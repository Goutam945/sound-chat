import 'package:sound_chat/common/index.dart';

Future<void> popAds(context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: true, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        contentPadding: EdgeInsets.all(0),
        //title: const Text('AlertDialog Title'),
        content: Stack(
          children: [
            Image.network(
                "https://soundchatradio.com/wp-content/uploads/2021/09/new-merch.jpeg"),
            Positioned(
              right: 0,
              top: 0,
              child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(
                    Icons.close,
                    size: 30,
                    color: Colors.black,
                  )),
            )
          ],
        ),
        // actions: <Widget>[
        //   TextButton(
        //     child: const Text('Ok'),
        //     onPressed: () {
        //       Navigator.of(context).pop();
        //     },
        //   ),
        // ],
      );
    },
  );
}
