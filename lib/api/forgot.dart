import 'package:sound_chat/common/index.dart';
import 'package:http/http.dart' as http;
import 'package:sound_chat/screens/login.dart';

Future<ForgotResponse> createForgotResponse(String name, context) async {
  final http.Response response =
      await http.post(Uri.parse(baseUrl + 'forgetpassword'),
          headers: <String, String>{"content-type": "application/json"},
          body: jsonEncode({
            'mobile_no': name,
          }));

  if (response.statusCode == 200) {
    dynamic forgotResponse = json.decode(response.body);
    print(response.body.toString());
    int responseCode = forgotResponse['status'];
    String message = forgotResponse['message'];
    if (responseCode == 200) {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => NewLogin()));
    }

    Toast.show(message, context,
        duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
    return ForgotResponse.fromJson(json.decode(response.body));
  } else {
    Toast.show(response.body, context,
        duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
    throw Exception(response.body);
  }
}

class ForgotResponse {
  int response;
  String message;

  ForgotResponse({
    this.response,
    this.message,
  });

  ForgotResponse.fromJson(Map<String, dynamic> json) {
    response = json['status'];
    message = json['message'];
  }
}
