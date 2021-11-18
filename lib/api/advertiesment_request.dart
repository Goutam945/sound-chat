import 'dart:io';
import 'package:sound_chat/common/index.dart';
import 'package:http/http.dart' as http;
import 'package:sound_chat/screens/homebottomBar.dart';

Future<AdvertisementResponse> createAdvertisementState(
    String email,
    String subject,
    String message,
    String name,
    File filepick,
    String mobile,
    context) async {
  var request =
      http.MultipartRequest('POST', Uri.parse(baseUrl + 'setadsquery'));
  request.fields['user_name'] = name;
  request.fields['email'] = email;
  request.fields['message'] = message;
  request.fields['subject'] = subject;
  request.fields['mobile'] = mobile;
  (filepick != null)
      ? request.files.add(await http.MultipartFile.fromPath(
          'media_files', (filepick != null) ? filepick.path : '',
          filename: (filepick != null) ? filepick.path.split('/').last : ''))
      : request.fields['media_files'] = '';
  var streamResponse = await request.send();
  var response = await http.Response.fromStream(streamResponse);
  dynamic data = json.decode(response.body);
  if (response.statusCode == 200) {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => HomeBottomBar()));

    Toast.show(data['message'], context,
        duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
    return AdvertisementResponse.fromJson(json.decode(response.body));
  } else {
    Toast.show(data['message'], context,
        duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
    throw Exception(response.body);
  }
}

class AdvertisementResponse {
  int response;
  String message;

  AdvertisementResponse({
    this.response,
    this.message,
  });

  AdvertisementResponse.fromJson(Map<String, dynamic> json) {
    response = json['code'];
    message = json['message'];
  }
}
