import 'package:sound_chat/common/index.dart';

showAlert(context) {
  AwesomeDialog(
    context: context,
    dialogType: DialogType.INFO,
    animType: AnimType.BOTTOMSLIDE,
    btnOkColor: Colors.orange,
    title: 'Subscribe!',
    desc: "Please Subscribe to watch prime content",
    btnCancelOnPress: () {},
    btnOkOnPress: () {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => UpgradeSubscription()));
    },
  )..show();
}
