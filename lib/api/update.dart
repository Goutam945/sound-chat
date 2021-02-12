import 'package:sound_chat/common/index.dart';
import 'package:http/http.dart' as http;

Future<UpdateResponse> createUpdateState(
    String name,
    String email,
    int userid,
    String userlogin,
    String usernicename,
    String lastname,
    String firstname,
    String phone,
    context) async {
  final http.Response response = await http.post(
      'https://mintok.com/soundchat/wp-json/wp/v2/users/update_user',
      headers: <String, String>{"content-type": "application/json"},
      body: jsonEncode({
        'display_name': name,
        'user_email': email,
        'user_id': userid,
        'user_login': userlogin,
        'user_nicename': usernicename,
        'last_name': lastname,
        'first_name': firstname,
        'phone': phone,
      }));

  if (response.statusCode == 200) {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => DesignLogin()));
    Toast.show("Succesfully ", context,
        duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
    return UpdateResponse.fromJson(json.decode(response.body));
  }
  if (response.statusCode == 406) {
    print(response.body);
  } else {
    throw Exception(response.body);
  }
}

class UpdateResponse {
  dynamic data;
  int ID;
  dynamic message;

  UpdateResponse({
    this.data,
    this.ID,
    this.message,
  });

  UpdateResponse.fromJson(Map<dynamic, dynamic> json) {
    message = json['message'];
    data = message['data'];
    ID = message['ID'];
  }
}
