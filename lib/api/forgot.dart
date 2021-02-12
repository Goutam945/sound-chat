import 'package:sound_chat/common/index.dart';
import 'package:http/http.dart' as http;

Future<ForgotResponse> createForgotResponse(String name,context) async {
  final http.Response response =
  await http.post('https://mintok.com/soundchat/wp-json/wp/v2/users/lost-password', headers: <String,String> {"content-type": "application/json"
  },body:jsonEncode({
    'username':name,
  }));

  if (response.statusCode == 200) {
    dynamic forgotResponse = json.decode(response.body);
    String responsecode = forgotResponse['code'];
    print(responsecode);
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => DesignLogin()));

    Toast.show("Succesfully Email", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);

    print(response.body);
    return ForgotResponse.fromJson(json.decode(response.body));
  } if (response.statusCode == 406) {
    print(response.body);

  }else {
    throw Exception(response.body);
  }
}

class ForgotResponse {
  String response;
  String message;

  ForgotResponse({
    this.response,
    this.message,
  });

  ForgotResponse.fromJson(Map<String, dynamic> json) {
    response = json['code'];
    message = json['msg'];
  }
}