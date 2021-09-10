import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  //SocketIO socketIO;
  double height, width;
  Socket socket;

  @override
  void initState() {
    super.initState();
    createSocketConnection();
  }
  createSocketConnection() {
    socket = IO.io('https://api.rybitt.com/', {
      'transports': ['websocket'],
      'autoConnect': false,
    })
      ..on('connect', (_) {})..on('disconnect', (_) {});
    print(socket.id);
    print(socket.connected);
    socket.connect();
    //socket.off('active_bands');
    socket.emit('add_band', {'name': 'goutam'});
    socket.on('active_bands', _eventHandler);
  }
  void _eventHandler(Object object) {
    print(object);
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: <Widget>[
                SizedBox(height: 30,),
                Text(socket.id.toString()),
                Text(socket.connected.toString())
              ],
            ),
          ),
        ),
      ),
    );
  }
}



/*
import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<String> messages = [];
  final IO.Socket socket = IO.io('https://vvipnetwork.in:8081/', <String, dynamic>{
    'transports': ['websocket'],
  });

  final textEditingConntroller = TextEditingController();
  @override
  void initState() {
    socket.on('greeting', (data) {
      Map<String, dynamic> d = data;
      setState(() {
        // _users += d['user'];
      });
    });
    socket.on('disconnect', (_) => print('disconnect'));
    socket.on('msg', (data) {
      print("Ini data: $data");
      Map<String, dynamic> d = data;
      setState(() {
        // String pesan = d['user'] + ":" + d['msg'];
        // print(pesan);
        messages.add(d['msg']);
      });
    });
    socket.connect();
    print(socket.id);
    super.initState();
  }

  @override
  void dispose() {
    socket.disconnect();
    super.dispose();
  }

  void _sendMessage(String pesan) {
    print("goutam ${pesan}");
    socket.emit("msg", {'msg': pesan, 'type': "text"});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
        ),
        body: Stack(
          children: [
            Align(
              child: Container(
                color: Colors.lightGreen,
                child: ListView.builder(
                  itemCount: messages.length,
                  itemBuilder: (BuildContext ctx, int i) {
                    if (messages.length > 0) {
                      return Align(child: Text(messages[i]));
                    } else {
                      return Container();
                    }
                  },
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                color: Colors.blue[50],
                height: MediaQuery.of(context).size.height * 0.1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: textEditingConntroller,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      hintText: "Type a Message Here",
                      suffixIcon: IconButton(
                          icon: Icon(Icons.send),
                          onPressed: () {
                            String pesan = textEditingConntroller.text;
                            if (pesan.trim().length > 0) {
                              _sendMessage(pesan);
                              textEditingConntroller.text = "";
                              textEditingConntroller.clear();
                            }
                          }),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}*/