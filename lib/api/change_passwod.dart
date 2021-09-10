import 'package:sound_chat/common/index.dart';
import 'package:http/http.dart' as http;
import 'package:sound_chat/screens/newlogin.dart';
Future<ChangepasswordResponse> createChangepasswrdState(int uid,String passwod,String newpassword,
    context) async {
  final http.Response response = await http.post(
      Uri.parse('http://3.23.210.57:3000/api/v1/auth/changepassword'),
      // headers: <String, String>{"content-type": "application/json"},
      body: {
        'user_id': "$uid",
        'current_password': passwod,
        'new_password': newpassword
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
