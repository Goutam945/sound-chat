import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;
import 'package:sound_chat/Model/message_data.dart';
import 'package:sound_chat/common/appConfig.dart';
import 'package:sound_chat/common/index.dart';
import 'package:sound_chat/common/message_view.dart';
import 'package:http/http.dart' as http;

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  io.Socket socket;
  List<MessageData> messages = [];
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  bool isMe = true;

  @override
  void initState() {
    getMessages();
    scrollToBottom();
    socketConfig();
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  controller: _scrollController,
                  itemCount: messages.length,
                  itemBuilder: (context, index) =>
                      MessageView(messages: messages[index])),
            ),
            Row(
              children: [messageField(), sendBtn()],
            )
          ],
        ),
      ),
    );
  }

  Widget messageField() => Expanded(
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TextField(
              controller: _messageController,
              style: const TextStyle(fontSize: 18),
              // onChanged: (value) {
              //   socket!.emit("Typing");
              // },
              decoration: const InputDecoration(
                  border: InputBorder.none, hintText: "Type a message..."),
            ),
          ),
        ),
      );

  Widget sendBtn() => Container(
        decoration:
            BoxDecoration(shape: BoxShape.circle, color: Colors.teal[800]),
        child: IconButton(
            color: Colors.white,
            onPressed: sendMessage,
            icon: const Icon(Icons.send)),
      );

  void sendMessage() {
    if (_messageController.text.isNotEmpty) {
      final message = MessageData(
          socketId: socket.id,
          roomId: "123",
          message: _messageController.text,
          senderId: 0,
          isMe: isMe,
          time: DateTime.now().toString());
      setState(() {
        messages.add(message);
        _messageController.clear();
      });
      socket.emit(SocketEvents.sendMessage, message.toJSONEncodable());
      scrollToBottom();
    }
  }

  void socketConfig() {
    socket = io.io(
        socketUrl,
        io.OptionBuilder()
            .setTransports(['websocket'])
            .disableAutoConnect()
            .build());

    socket.connect();

    socket.on('connect', (data) {
      print('Connected to Server');
    });

    socket.onConnect((_) {
      print('connect');
      // socket!.emit('joinRoom', {
      //   {'roomId': '123'}
      // });
    });

    socket.on(SocketEvents.receiveMessage, (data) {
      print(data.toString());
      setState(() {
        if (socket.id != data['socketId']) {
          // Map<String, dynamic> msg = {
          //   'socketId': data['socketId'],
          //   'roomId': data['roomId'],
          //   'message': data['message'],
          //   'senderId': data['senderId'],
          //   'isMe': false,
          //   'time': data['time']
          // };
          messages.add(MessageData.fromJson(data));
        }
      });
      scrollToBottom();
    });

    socket.onDisconnect((_) => print('disconnect'));
    socket.onConnectError((data) => print('error: $data'));
    socket.onError((data) => print('error: $data'));
  }

  void scrollToBottom() async {
    // _scrollController.position.maxScrollExtent;
    await Future.delayed(const Duration(milliseconds: 1));
    SchedulerBinding.instance?.addPostFrameCallback((_) {
      _scrollController.animateTo(_scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 100),
          curve: Curves.fastOutSlowIn);
    });
  }

  Future<ChatResponse> getMessages() async {
    final http.Response response = await http.get(
        Uri.parse('https://soundchatfirstapp.herokuapp.com/groupchatlist/0'));
    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      Provider.of<SearchResponse>(context, listen: false).data = data;
      print(data);
      return ChatResponse.fromJson(json.decode(response.body));
    } else {
      Toast.show("server error", context,
          duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
      throw Exception(response.body);
    }
  }
}

class ChatResponse {
  Map<String, dynamic> data;

  ChatResponse({
    this.data,
  });

  ChatResponse.fromJson(Map<String, dynamic> json) {
    data = json;
  }
}
