import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;
import 'package:sound_chat/Model/message_data.dart';
import 'package:sound_chat/common/appConfig.dart';
import 'package:sound_chat/common/index.dart';
import 'package:sound_chat/common/message_view.dart';
import 'package:http/http.dart' as http;
import 'package:sound_chat/common/shared_preferences.dart';

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
  Future<ChatResponse> _getMessages;
  int userId = 0;
  bool isLoading = false;
  int lastMessageId = 0;

  @override
  void initState() {
    Sharedpreferences().getUserId().then((value) => userId = value);
    _getMessages = getLastMessages().then((value) {
      addMessages(value);
      scrollToBottom();
      return value;
    });
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
              child: FutureBuilder(
                  future: _getMessages,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      print(snapshot.data.data);
                      return ListView.builder(
                          controller: _scrollController,
                          itemCount: messages.length,
                          itemBuilder: (context, index) {
                            // List data = snapshot.data.data['data'];
                            // MessageData msg = MessageData(
                            //     socketId: socket.id,
                            //     roomId: data[index]["room_id"],
                            //     message: data[index]["message"],
                            //     senderId: int.parse(data[index]["sender_id"]),
                            //     isMe: isMe,
                            //     time: data[index]["created_date"]);
                            // messages.add(msg);
                            return MessageView(messages: messages[index]);
                          });
                    }
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }),
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
          roomId: 123,
          message: _messageController.text,
          senderId: userId,
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
        sockerUrl1,
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
        if (userId != data['senderId']) {
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

  void pagination() {
    if (_scrollController.position.pixels ==
        _scrollController.position.minScrollExtent) {
      if (lastMessageId > 0) {
        setState(() {
          isLoading = true;
          lastMessageId -= 10;
          getMessages().then((value) => addOldMessages(value));
          print(lastMessageId);
        });
      }
    }
  }

  void scrollToBottom() async {
    // _scrollController.position.maxScrollExtent;
    await Future.delayed(const Duration(milliseconds: 1));
    SchedulerBinding.instance?.addPostFrameCallback((_) {
      _scrollController.animateTo(_scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 100),
          curve: Curves.fastOutSlowIn);
    });

    _scrollController.addListener(pagination);
  }

  Future<ChatResponse> getMessages() async {
    final http.Response response = await http.get(Uri.parse(
        'http://192.168.29.69:8081/group_chat_history_bylastmessageid/$lastMessageId'));
    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      Provider.of<SearchResponse>(context, listen: false).data = data;
      print(data);
      return ChatResponse.fromJson(json.decode(response.body));
    } else {
      Toast.show(response.body, context,
          duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
      throw Exception(response.body);
    }
  }

  Future<ChatResponse> getLastMessages() async {
    final http.Response response = await http
        .get(Uri.parse('http://192.168.29.69:8081/group_chat_history'));
    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      Provider.of<SearchResponse>(context, listen: false).data = data;
      print(data);
      return ChatResponse.fromJson(json.decode(response.body));
    } else {
      Toast.show(response.body, context,
          duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
      throw Exception(response.body);
    }
  }

  void addMessages(ChatResponse value) {
    List data = value.data['data'];
    print("data from history: $data");
    for (int i = 0; i < data.length; i++) {
      MessageData msg = MessageData(
          socketId: socket.id,
          roomId: data[i]["room_id"],
          message: data[i]["message"],
          senderId: data[i]["sender_id"],
          isMe: data[i]["sender_id"] == userId,
          time: data[i]["createdAt"]);
      messages.add(msg);
      // messages.insert(0, msg);
    }
    lastMessageId = data[0]["id"];
  }

  void addOldMessages(ChatResponse value) {
    List data = value.data['data'];
    print("data from history: $data");
    for (int i = 0; i < data.length; i++) {
      MessageData msg = MessageData(
          socketId: socket.id,
          roomId: data[i]["room_id"],
          message: data[i]["message"],
          senderId: data[i]["sender_id"],
          isMe: data[i]["sender_id"] == userId,
          time: data[i]["createdAt"]);
      messages.insert(0, msg);
    }
    setState(() {});
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
