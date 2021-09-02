import 'package:sound_chat/common/index.dart';
class Cc  extends CustomClipper<Path>{
  @override
  getClip(Size size) {
    Path path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.cubicTo(0, size.height, 30, size.height/2,0, 0,);
    //path.quadraticBezierTo(0, size.height, 100, 100);

    path.close();
    return path;

  }
  @override
  bool shouldReclip(CustomClipper old) => false;
}