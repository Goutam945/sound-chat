import 'dart:io';
import 'package:sound_chat/common/index.dart';
import 'package:http/http.dart' as http;
import 'package:sound_chat/screens/homebottomBar.dart';

Future<SendmailResponse> createSendmailState(
    String email,String subject,String message,String name,File filepick, context) async {
  final http.Response response = await http.post(
      Uri.parse('https://mintok.com/soundchat/wp-json/contact_mail/v2/'),
      headers: <String, String>{"content-type": "application/json"},
      body: jsonEncode({
        'email': email,
        'subject': subject,
        'message': message,
        'name': name,
        'contact_attach': filepick != null ? base64Encode(filepick.readAsBytesSync()) : '',

      }));

  if (response.statusCode == 200) {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => HomeBottomBar()));
    Toast.show("  Email Successfully", context,
        duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
    return SendmailResponse.fromJson(json.decode(response.body));
  } else {
    Toast.show("already", context,
        duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
    throw Exception(response.body);
  }
}

class SendmailResponse {
  int response;
  String message;

  SendmailResponse({
    this.response,
    this.message,
  });

  SendmailResponse.fromJson(Map<String, dynamic> json) {
    response = json['code'];
    message = json['message'];
  }
}
