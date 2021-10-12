import 'dart:io';

import 'package:sound_chat/api/subcribtion_lable.dart';
import 'package:sound_chat/common/index.dart';
import 'package:http/http.dart' as http;
import 'package:sound_chat/common/shared_preferences.dart';
import 'package:sound_chat/screens/homebottomBar.dart';

Future<UpdateResponse> createUpdateState(
    int userid,
    String username,
    String email,
    String phone,
    String name,
    String country,
    File profilepic,
    context) async {
  final http.Response response =
      await http.post(Uri.parse(baseUrl + 'updateprofile'),
          headers: <String, String>{"content-type": "application/json"},
          body: jsonEncode({
            'user_id': userid,
            'username': username,
            'email': email,
            'mobileno': phone,
            'fname': name,
            'country': country,
            'profilepic': 'profilepic',
          }));
  /*var request = http.MultipartRequest('POST',
      Uri.parse('http://3.23.210.57:3000/api/v1/auth/updateprofile'));
  request.fields['user_id'] = "$userid";
  request.fields['username'] = username;
  request.fields['email'] = email;
  request.fields['mobileno'] = phone;
  request.fields['fname'] = name;
  request.fields['country'] = country;
 request.files.add(await http.MultipartFile.fromPath(
      'profilepic', profilepic.path,
      filename: profilepic.path.split('/').last));

  var streamResponse = await request.send();
  var response = await http.Response.fromStream(streamResponse);*/

  if (response.statusCode == 200) {
    print(response.body);
    dynamic updateResponse = json.decode(response.body);
    print(response.body);
    if (response.statusCode == 200) {
      dynamic data = updateResponse['data'];
      String email = data['email'];
      String name = data['fname'];
      String phone = data['mobileno'];
      String image = data['profilepic'];
      String country = data['country'];
      int id = data['id'];
      String userlogin = data['username'];
      Sharedpreferences()
          .saveData(email, name, phone, image, country, id, userlogin, true);
      print(id);
      createSubcriptionlevalState(id, context);
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => HomeBottomBar()));
      Toast.show("Update Successfully", context,
          duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
    } else {
      Toast.show("Error", context,
          duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
    }
    return UpdateResponse.fromJson(json.decode(response.body));
  } else {
    throw Exception(response.body);
  }
}

class UpdateResponse {
  dynamic data;
  UpdateResponse({
    this.data,
  });

  UpdateResponse.fromJson(Map<dynamic, dynamic> json) {
    data = json['data'];
  }
}
