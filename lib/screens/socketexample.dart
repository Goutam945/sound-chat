// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:socket_io_client/socket_io_client.dart';
//
// class ChatPage extends StatefulWidget {
//   @override
//   _ChatPageState createState() => _ChatPageState();
// }
//
// class _ChatPageState extends State<ChatPage> {
//   //SocketIO socketIO;
//   double height, width;
//
//   @override
//   Socket socket;
//
//   @override
//   void initState() {
//     super.initState();
//     connectToServer();
//   }
//
//   void connectToServer() {
//     try {
//
//       // Configure socket transports must be sepecified
//       socket = io('https://vvipnetwork.in:8081/', <String, dynamic>{
//         'transports': ['websocket'],
//         'autoConnect': false,
//       });
//
//       // Connect to websocket
//       socket.connect();
//
//       // Handle socket events
//       socket.on('connect', (_) => print('connect: ${socket.id}'));
//       socket.on('location', handleLocationListen);
//       socket.on('typing', handleTyping);
//       socket.on('message', handleMessage);
//       socket.on('disconnect', (_) => print('disconnect'));
//       socket.on('fromServer', (_) => print(_));
//
//     } catch (e) {
//       print(e.toString());
//     }
//   }
//   // Send Location to Server
//   sendLocation(Map<String, dynamic> data) {
//     socket.emit("location", data);
//   }
//
//   // Listen to Location updates of connected usersfrom server
//   handleLocationListen(Map<String, dynamic> data) async {
//     print(data);
//   }
//
//   // Send update of user's typing status
//   sendTyping(bool typing) {
//     socket.emit("typing",
//         {
//           "id": socket.id,
//           "typing": typing,
//         });
//   }
//
//   // Listen to update of typing status from connected users
//   void handleTyping(Map<String, dynamic> data) {
//     print(data);
//   }
//
//   // Send a Message to the server
//   sendMessage(String message) {
//     socket.emit("message",
//       {
//         "id": socket.id,
//         "message": message, // Message to be sent
//         "timestamp": DateTime.now().millisecondsSinceEpoch,
//       },
//     );
//   }
//
//   // Listen to all message events from connected users
//   void handleMessage(Map<String, dynamic> data) {
//     print(data);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     height = MediaQuery.of(context).size.height;
//     width = MediaQuery.of(context).size.width;
//     return SafeArea(
//       child: Scaffold(
//         body: SingleChildScrollView(
//           child: Column(
//             children: <Widget>[
//               Text("socket"),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'dart:io';
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

  @override
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