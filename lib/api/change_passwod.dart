import 'package:sound_chat/common/index.dart';
import 'package:http/http.dart' as http;
import 'package:sound_chat/screens/NewLogin.dart';
Future<ChangepasswordResponse> createChangepasswrdState(int uid,String passwod,
    context) async {
  final http.Response response = await http.post(
      Uri.parse('https://mintok.com/soundchat/wp-json/change_password/v2/'),
      // headers: <String, String>{"content-type": "application/json"},
      body: {
        'user_id': "$uid",
        'password': passwod
      });

  if (response.statusCode == 200) {
    var data = json.decode(response.body);
//    int status = data['status'];
//    if(status==200)
        {
//      String message = data['message'];

      print(data);
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => NewLogin()));
      Toast.show(data.toString(), context,
          duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
      return ChangepasswordResponse.fromJson(json.decode(response.body));
    }
  } else {
    Toast.show(response.body, context,
        duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
    throw Exception(response.body);
  }
}
class ChangepasswordResponse {
  dynamic data;

  ChangepasswordResponse({
//    this.response,
    this.data,
  });

  ChangepasswordResponse.fromJson(Map<String, dynamic> json) {
//    response = json['code'];
    data = json;
  }
}
