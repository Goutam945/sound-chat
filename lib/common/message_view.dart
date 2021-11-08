import 'package:flutter/material.dart';
import 'package:sound_chat/Model/message_data.dart';
import 'package:sound_chat/common/message_bubble.dart';

class MessageView extends StatelessWidget {
  const MessageView(
      {Key key,
      @required this.messages,
      @required this.pickedBubbleColor,
      @required this.pickedTextColor})
      : super(key: key);

  final MessageData messages;
  final Color pickedBubbleColor;
  final Color pickedTextColor;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    DateTime time = DateTime.parse(messages.time);
    return Row(
      mainAxisAlignment:
          (messages.isMe) ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        CustomPaint(
          painter: CustomShape(
              bgColor: (messages.isMe) ? Colors.green : Colors.blue,
              isMe: messages.isMe),
          child: Container(
            constraints: BoxConstraints(maxWidth: width * 0.85),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            margin: const EdgeInsets.symmetric(vertical: 5),
            decoration: BoxDecoration(
                color: (messages.isMe) ? pickedBubbleColor : Colors.blue,
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              textBaseline: TextBaseline.alphabetic,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: width * 0.7),
                  child: Text(
                    messages.message,
                    style: (messages.isMe)
                        ? pickedTextColor
                        : TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "${time.hour}:${time.minute}",
                  style: const TextStyle(
                    fontSize: 10,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
