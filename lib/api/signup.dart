/*import 'package:sound_chat/common/index.dart';
import 'package:http/http.dart' as http;
import 'package:sound_chat/screens/login.dart';
import 'package:sound_chat/screens/paymentdetailsmembarship.dart';

Future<SignUpResponse> createSignUpState(
    plan,
    lid,
    productname,
    String username,
    String email,
    String firstName,
    String lastName,
    String password,
    String phoneNumber,
    String country,
    String coupon,
    String _image,
    context) async {
  final http.Response response = await http.post(Uri.parse(baseUrl + 'signup'),
      headers: <String, String>{"content-type": "application/json"},
      body: jsonEncode({
        'username': username,
        'email': email,
        'fname': firstName,
        'lname': lastName,
        'password': password,
        'mobileno': phoneNumber,
        'country': country,
        'coupon': coupon,
        'profilepic': 'nbnbnbn',
        'roles': ["Freemium"],
      }));

  if (response.statusCode == 200) {
    var data = json.decode(response.body);
    int status = data['status'];
    if (status == 200) {
      int uid = data['data']['id'];
      String message = data['message'];
      print(data);
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => (plan['amount'] != 0)
              ? PaymentDetailsMember(plan, uid, lid, productname, firstName,
                  lastName, email, phoneNumber)
              : NewLogin()));
      Toast.show(message, context,
          duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
      return SignUpResponse.fromJson(json.decode(response.body));
    } else {
      Toast.show(data['message'], context,
          duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
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
}*/

import 'dart:io';
import 'package:sound_chat/common/index.dart';
import 'package:http/http.dart' as http;
import 'package:sound_chat/screens/login.dart';
import 'package:sound_chat/screens/paymentdetailsmembarship.dart';

Future<SignUpResponse> createSignUpState(
    plan,
    lid,
    productname,
    String username,
    String email,
    String firstName,
    String lastName,
    String password,
    String phoneNumber,
    String country,
    String coupon,
    String token,
    String divicetype,
    File profilepic,
    context) async {
  var request = http.MultipartRequest('POST', Uri.parse(baseUrl + 'signup'));
  request.fields['mobileno'] = username;
  request.fields['email'] = email;
  request.fields['fname'] = firstName;
  request.fields['lname'] = lastName;
  request.fields['password'] = password;
  request.fields['username'] = phoneNumber;
  request.fields['country'] = country;
  request.fields['coupon'] = coupon;
  request.fields['device_token'] = token;
  request.fields['device_type'] = divicetype;
  request.fields['device_name'] = "device_name";
  // request.files.add(await http.MultipartFile.fromPath('profilepic', _image.path,
  //     filename: _image.path.split('/').last));
  (profilepic != null)
      ? request.files.add(await http.MultipartFile.fromPath(
          'profilepic', (profilepic != null) ? profilepic.path : '',
          filename:
              (profilepic != null) ? profilepic.path.split('/').last : ''))
      : request.fields['profilepic'] = '';
  request.fields['roles'] = "";
  var streamResponse = await request.send();
  var response = await http.Response.fromStream(streamResponse);

  if (response.statusCode == 200) {
    var data = json.decode(response.body);
    int status = data['status'];
    if (status == 200) {
      int uid = data['data']['id'];
      String message = data['message'];
      // print(data);
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => (plan['amount'] != 0)
              ? PaymentDetailsMember(plan, uid, lid, productname, firstName,
                  lastName, email, phoneNumber)
              : NewLogin()));
      Toast.show(message, context,
          duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
      return SignUpResponse.fromJson(json.decode(response.body));
    } else {
      Toast.show(data['message'], context,
          duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
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
