import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

faileddialog(error, context) {
  AwesomeDialog(
    context: context,
    dialogType: DialogType.ERROR,
    animType: AnimType.BOTTOMSLIDE,
    btnOkColor: Colors.orange,
    title: 'Payment Faild',
    desc: error.toString(),
    btnOkOnPress: () {
      //Navigator.of(context).pop();
    },
  )..show();
}
