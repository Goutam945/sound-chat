import 'package:sound_chat/common/index.dart';
import 'package:http/http.dart' as http;

Future<SignUpResponse> createSignUpState(
    String name, String email, String password, context) async {
  final http.Response response = await http.post(
      'https://mintok.com/soundchat/wp-json/wp/v2/users/register',
      headers: <String, String>{"content-type": "application/json"},
      body: jsonEncode({
        'username': name,
        'email': email,
        'password': password,
      }));

  if (response.statusCode == 200) {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => DesignLogin()));
    Toast.show("Succesfully Register", context,
        duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
    return SignUpResponse.fromJson(json.decode(response.body));
  }
  if (response.statusCode == 406) {
    print(response.body);
  } else {
    Toast.show("Alredy Register", context,
        duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
    throw Exception(response.body);
  }
}

class SignUpResponse {
  int response;
  String message;

  SignUpResponse({
    this.response,
    this.message,
  });

  SignUpResponse.fromJson(Map<String, dynamic> json) {
    response = json['code'];
    message = json['message'];
  }
}
