import 'dart:io';
import 'package:sound_chat/common/index.dart';
import 'package:http/http.dart' as http;
import 'package:sound_chat/screens/NewLogin.dart';
import 'package:sound_chat/screens/PaymentdetailsMembarship.dart';

Future<SignUpResponse> createSignUpState(
    user,
    lid,
    String username,
    String email,
    String firstName,
    String lastName,
    String password,
    String phoneNumber,
    String country,
    String coupon,
    File _image,
    context) async {
  // final http.Response response = await http.post(
  //     Uri.parse('https://mintok.com/soundchat/wp-json/wp/v2/users/register'),
  //     headers: <String, String>{"content-type": "application/json"},
  //     body: jsonEncode({
  //       'username': username,
  //       'email': email,
  //       'firstName': firstName,
  //       'lastName': lastName,
  //       'password': password,
  //       'phoneNumber': phoneNumber,
  //       'country': country,
  //       'coupon': coupon,
  //       'profile_image': profile_image != null ? base64Encode(profile_image.readAsBytesSync()) : '',
  //     }));

  var request = http.MultipartRequest('POST',
      Uri.parse('https://mintok.com/soundchat/wp-json/wp/v2/users/register'));
  request.fields['username'] = username;
  request.fields['email'] = email;
  request.fields['firstName'] = firstName;
  request.fields['lastName'] = lastName;
  request.fields['password'] = password;
  request.fields['phoneNumber'] = phoneNumber;
  request.fields['country'] = country;
  request.fields['coupon'] = coupon;
  request.files.add(await http.MultipartFile.fromPath(
      'profile_image', _image.path,
      filename: _image.path.split('/').last));
  var streamResponse = await request.send();
  var response = await http.Response.fromStream(streamResponse);

  if (response.statusCode == 200) {
    var data = json.decode(response.body);
    int status = data['status'];
    if (status == 200) {
      int uid = data['user_id'];
      String message = data['message'];
      print(data);
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => (user['payment_type'] == 'payment')
              ? PaymentDetailsMember(user, uid, lid)
              : NewLogin()));
      Toast.show(message, context,
          duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
      return SignUpResponse.fromJson(json.decode(response.body));
    }
    return SignUpResponse.fromJson(json.decode(response.body));
  } else {
    Toast.show(response.body, context,
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
