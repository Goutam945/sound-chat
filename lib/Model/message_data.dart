import 'package:flutter/material.dart';

class MessageData {
  String socketId = "";
  int roomId = 123;
  String message = "";
  int senderId = 0;
  bool isMe = true;
  String time = "";
  String textColor = "";
  String messageBubbleColor = "";
  bool bold = false;
  bool italic = false;
  bool underline = false;

  MessageData(
      {@required this.socketId,
      @required this.roomId,
      @required this.message,
      @required this.senderId,
      @required this.isMe,
      @required this.time,
      @required this.textColor,
      @required this.messageBubbleColor,
      @required this.bold,
      @required this.italic,
      @required this.underline});

  factory MessageData.fromJson(Map<String, dynamic> jsonData) {
    return MessageData(
      socketId: jsonData['socketId'],
      roomId: jsonData['roomId'],
      message: jsonData['message'],
      senderId: jsonData['senderId'],
      isMe: false, //jsonData['isMe'],
      time: jsonData['time'],
      textColor: jsonData['textColor'],
      messageBubbleColor: jsonData['messageBubbleColor'],
      bold: jsonData['bold'] == 1,
      italic: jsonData['italic'] == 1,
      underline: jsonData['underline'] == 1,
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
    m['textColor'] = textColor;
    m['messageBubbleColor'] = messageBubbleColor;
    m['bold'] = bold;
    m['italic'] = italic;
    m['underline'] = underline;

    return m;
  }
}
