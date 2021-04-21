import 'package:sound_chat/common/index.dart';
import 'package:http/http.dart' as http;
Future<CancelSubpResponse> createCancelsubcripState(int uid,String lid,
    context) async {
  final http.Response response = await http.post(
      Uri.parse('https://mintok.com/soundchat/wp-json/cancel_membership/v2'),
      // headers: <String, String>{"content-type": "application/json"},
      body: {
        'uid': "$uid",
        'lid': "$lid"
      });

  if (response.statusCode == 200) {
    var data = json.decode(response.body);
//    int status = data['status'];
//    if(status==200)
        {
//      String message = data['message'];

      print(data);
//      Navigator.of(context)
//          .pushReplacement(MaterialPageRoute(builder: (context) => AllOrderlist()));
      Toast.show(data.toString(), context,
          duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
      return CancelSubpResponse.fromJson(json.decode(response.body));
    }
  } else {
    Toast.show(response.body, context,
        duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
    throw Exception(response.body);
  }
}
class CancelSubpResponse {
  dynamic data;

  CancelSubpResponse({
//    this.response,
    this.data,
  });

  CancelSubpResponse.fromJson(Map<String, dynamic> json) {
//    response = json['code'];
    data = json;
  }
}
