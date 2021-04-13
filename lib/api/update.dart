import 'package:sound_chat/common/index.dart';
import 'package:http/http.dart' as http;
import 'package:sound_chat/common/shared_preferences.dart';

Future<UpdateResponse> createUpdateState(
    String firstname,
    String lastname,
    String email,
    String phone,
    String name,
    int userid,
    String userlogin,
    String usernicename,
    context) async {
  final http.Response response = await http.post(
      Uri.parse('https://mintok.com/soundchat/wp-json/wp/v2/users/update_user'),
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
  //   Navigator.of(context)
  //       .pushReplacement(MaterialPageRoute(builder: (context) => HomeScreen()));
  //   Toast.show("User details updated Successfully ", context,
  //       duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
  //   return UpdateResponse.fromJson(json.decode(response.body));
  // } else {
  //   throw Exception(response.body);
  // }
    print(response.body);
    dynamic updateResponse = json.decode(response.body);
    print(response.body);
    String code = updateResponse['code'];
    dynamic message = updateResponse['message'];
    if(code == '200'){

      dynamic data = message['data'];
      //Sharefrifrance
      String email=data['user_email'];
      String name=data['first_name'];
      String phone=data['phone'];
      String image=data['image'];
      String country=data['country'];
      int id = message['ID'];
      String userlogin=data['user_login'];
      Sharedpreferences().saveData(email,name,phone,image,country,id,userlogin);
      //
      // int id = message['ID'];
      // //dynamic data = message['data'];
      // Provider.of<UpdateResponse>(context, listen: false).data = data;
      // Provider.of<UpdateResponse>(context, listen: false).id = id;
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => HomeScreen()));
      Toast.show("Update Successfully", context,
          duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
    } else {
      Toast.show(message, context,
          duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
    }
    return UpdateResponse.fromJson(json.decode(response.body));
  } else {
    throw Exception(response.body);
  }
}

class UpdateResponse {
  dynamic data;
  int id;
  dynamic message;

  UpdateResponse({
    this.data,
    this.id,
    this.message,
  });

  UpdateResponse.fromJson(Map<dynamic, dynamic> json) {
    message = json['message'];
    data = message['data'];
    id = message['ID'];
  }
}
