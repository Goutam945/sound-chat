import 'package:sound_chat/common/index.dart';
import 'package:http/http.dart' as http;
import 'package:sound_chat/common/shared_preferences.dart';
import 'package:sound_chat/screens/login.dart';

Future<ChangepasswordResponse> createChangepasswrdState(
    int uid, String passwod, String newpassword, context) async {
  final http.Response response = await http
      .post(Uri.parse(baseUrl + 'changepassword'), headers: <String, String>{
    "x-access-token": await Sharedpreferences().getToken()
  }, body: {
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

      //print(data);
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
