import 'package:flutter/material.dart';

class CustomShape extends CustomPainter {
  final Color bgColor;
  final bool isMe;

  const CustomShape({Key key, this.bgColor, this.isMe}) : super();

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()..color = bgColor;

    if (isMe) {
      var path = Path();
      path.moveTo(size.width - 10, 5);
      path.lineTo(size.width - 10, 5);
      path.lineTo(size.width, 15);
      path.lineTo(size.width + 5, 5);
      canvas.drawPath(path, paint);
    } else {
      var path = Path();
      path.moveTo(-5, 5);
      path.lineTo(-5, 5);
      path.lineTo(0, 15);
      path.lineTo(10, 5);
      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
