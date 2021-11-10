import 'package:flutter/material.dart';
import 'package:sound_chat/Model/message_data.dart';
import 'package:sound_chat/common/message_bubble.dart';

class MessageView extends StatelessWidget {
  const MessageView({Key key, @required this.messages}) : super(key: key);

  final MessageData messages;

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
              bgColor:
                  Color(int.parse(messages.messageBubbleColor ?? '0xff18a4f6')),
              isMe: messages.isMe),
          child: Container(
            constraints: BoxConstraints(maxWidth: width * 0.85),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            margin: const EdgeInsets.symmetric(vertical: 5),
            decoration: BoxDecoration(
                color: Color(
                    int.parse(messages.messageBubbleColor ?? '0xff18a4f6')),
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
                    style: TextStyle(
                        fontSize: 14,
                        color: Color(
                            int.parse(messages.textColor ?? "0xffffffff")),
                        fontWeight:
                            messages.bold ? FontWeight.w800 : FontWeight.normal,
                        fontStyle: messages.italic
                            ? FontStyle.italic
                            : FontStyle.normal,
                        decoration: messages.underline
                            ? TextDecoration.underline
                            : TextDecoration.none),
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
