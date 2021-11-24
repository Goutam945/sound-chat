import 'package:flutter/material.dart';
import 'package:sound_chat/Model/message_data.dart';
import 'package:sound_chat/common/date_formatter.dart';
import 'package:sound_chat/common/message_bubble.dart';

class MessageView extends StatelessWidget {
  const MessageView({Key key, @required this.messages}) : super(key: key);

  final MessageData messages;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    DateTime time = DateTime.parse(messages.time);
    String month = DateFormatter.getMonth(time);
    String hM = DateFormatter.getHM(time);
    return Row(
      mainAxisAlignment:
          (messages.isMe) ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Stack(
          children: [
            CustomPaint(
              painter: CustomShape(
                  bgColor: Color(
                      int.parse(messages.messageBubbleColor ?? '0xff18a4f6')),
                  isMe: messages.isMe),
              child: Container(
                constraints: BoxConstraints(maxWidth: width * 0.85),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                margin: const EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                    color: Color(
                        int.parse(messages.messageBubbleColor ?? '0xff18a4f6')),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(messages.name,
                        style: TextStyle(
                            color: Color(0xffae8713),
                            fontSize: 14,
                            fontWeight: FontWeight.bold)),
                    Row(
                      textBaseline: TextBaseline.alphabetic,
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        ConstrainedBox(
                          constraints: BoxConstraints(maxWidth: width * 0.7),
                          child: (messages.messageType == "text")
                              ? textMessageView()
                              : (messages.messageType == "emoji")
                                  ? emojiMessageView()
                                  : gifMessageView(),
                        ),
                        // const SizedBox(
                        //   width: 10,
                        // ),
                        // Text(
                        //   "$month ${time.day} $hM",
                        //   style: const TextStyle(
                        //     fontSize: 10,
                        //     color: Colors.white70,
                        //   ),
                        // ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 8,
              right: 5,
              child: Text(
                "$month ${time.day} $hM",
                style: const TextStyle(
                  fontSize: 10,
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget textMessageView() => Text(
        messages.message,
        style: TextStyle(
            fontSize: 14,
            color: Color(int.parse(messages.textColor ?? "0xffffffff")),
            fontWeight: messages.bold ? FontWeight.w800 : FontWeight.normal,
            fontStyle: messages.italic ? FontStyle.italic : FontStyle.normal,
            decoration: messages.underline
                ? TextDecoration.underline
                : TextDecoration.none),
      );

  Widget emojiMessageView() => Text(
        messages.message,
        style: TextStyle(
            fontSize: 100,
            color: Color(int.parse(messages.textColor ?? "0xffffffff")),
            fontWeight: messages.bold ? FontWeight.w800 : FontWeight.normal,
            fontStyle: messages.italic ? FontStyle.italic : FontStyle.normal,
            decoration: messages.underline
                ? TextDecoration.underline
                : TextDecoration.none),
      );

  Widget gifMessageView() => Image.network(
        messages.message,
        headers: {'accept': 'image/*'},
        loadingBuilder: (BuildContext context, Widget child,
            ImageChunkEvent loadingProgress) {
          if (loadingProgress == null) {
            return child;
          }
          return Center(
            child: CircularProgressIndicator(
              value: loadingProgress.expectedTotalBytes != null
                  ? loadingProgress.cumulativeBytesLoaded /
                      loadingProgress.expectedTotalBytes
                  : null,
            ),
          );
        },
      );
}
