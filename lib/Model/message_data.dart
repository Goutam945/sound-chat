import 'package:flutter/material.dart';

class MessageData {
  String socketId = "";
  String roomId = "";
  String message = "";
  int senderId = 0;
  bool isMe = true;
  String time = "";

  MessageData(
      {@required this.socketId,
      @required this.roomId,
      @required this.message,
      @required this.senderId,
      @required this.isMe,
      @required this.time});

  factory MessageData.fromJson(Map<String, dynamic> jsonData) {
    return MessageData(
      socketId: jsonData['socketId'],
      roomId: jsonData['roomId'],
      message: jsonData['message'],
      senderId: jsonData['senderId'],
      isMe: false, //jsonData['isMe'],
      time: jsonData['time'],
    );
  }

  toJSONEncodable() {
    Map<String, dynamic> m = {};
    m['socketId'] = socketId;
    m['roomId'] = roomId;
    m['message'] = message;
    m['senderId'] = senderId;
    m['isMe'] = isMe;
    m['time'] = time;
    return m;
  }
}
