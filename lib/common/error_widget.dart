import 'package:sound_chat/common/index.dart';

class Errorwidget extends StatefulWidget {
  final onTap;
  const Errorwidget({Key key, @required this.onTap}) : super(key: key);

  @override
  _ErrorwidgetState createState() => _ErrorwidgetState();
}

class _ErrorwidgetState extends State<Errorwidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "OOPS!\nNO INTERNET",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            ElevatedButton(onPressed: widget.onTap, child: Text("TRY AGAIN"))
          ],
        ),
      ),
    );
  }
}
