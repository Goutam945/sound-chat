import 'package:sound_chat/common/index.dart';

Future<bool> checkProductStock({int quantity, int stock, context}) async {
  if (quantity >= stock) {
    outOfStockDialog(context: context, stock: stock);
    return false;
  } else {
    return true;
  }
}

outOfStockDialog({context, stock}) {
  AwesomeDialog(
    context: context,
    dialogType: DialogType.WARNING,
    animType: AnimType.BOTTOMSLIDE,
    btnOkColor: Colors.orange,
    title: 'Out Of Stock',
    desc: "You can not add more than $stock",
    btnOkOnPress: () {
      //Navigator.of(context).pop();
    },
  )..show();
}
