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
  final http.Response response = await http.post(
      Uri.parse('http://3.23.210.57:3000/api/v1/auth/signup'),
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
        'profilepic':'nbnbnbn',
        'roles': ["Freemium"],
      }));

  /*var request = http.MultipartRequest('POST',
      Uri.parse('http://3.23.210.57:3000/api/v1/auth/signup'));
  request.fields['username'] = username;
  request.fields['email'] = email;
  request.fields['fname'] = firstName;
  request.fields['lname'] = lastName;
  request.fields['password'] = password;
  request.fields['mobileno'] = phoneNumber;
  request.fields['country'] = country;
  request.fields['coupon'] = coupon;
  request.fields['roles'] = "Freemium";
  request.fields['profilepic'] = "profilepicgdg";

  // request.files.add(await http.MultipartFile.fromPath(
  //     'profile_image', _image.path,
  //     filename: _image.path.split('/').last));

  var streamResponse = await request.send();
  var response = await http.Response.fromStream(streamResponse);*/

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

/*
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

  var request = http.MultipartRequest('POST',
      Uri.parse('http://3.23.210.57:3000/api/v1/auth/signup'));
  request.fields['username'] = username;
  request.fields['email'] = email;
  request.fields['fname'] = firstName;
  request.fields['lname'] = lastName;
  request.fields['password'] = password;
  request.fields['mobileno'] = phoneNumber;
  request.fields['country'] = country;
  request.fields['coupon'] = coupon;
  request.files.add(await http.MultipartFile.fromPath(
      'profilepic', _image.path,
      filename: _image.path.split('/').last));
  request.fields['roles'] = "";
  var streamResponse = await request.send();
  var response = await http.Response.fromStream(streamResponse);

  if (response.statusCode == 200) {
    var data = json.decode(response.body);
    int status = data['status'];
    if (status == 200) {
      // int uid = 6;
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
}*/