import 'package:sound_chat/common/index.dart';
import 'package:http/http.dart' as http;
import 'package:sound_chat/screens/AllorderDetails.dart';
Future<AllorderResponse> createAllOrderState(int userid,
    context) async {
  final http.Response response = await http.post(
      Uri.parse('https://mintok.com/soundchat/wp-json/orders/v2/'),
     // headers: <String, String>{"content-type": "application/json"},
      body: {
        'user_id': "$userid",
//        "user_id": "691"
      });

  if (response.statusCode == 200) {
    var data = json.decode(response.body);
//    int status = data['status'];
//    if(status==200)
    {
//      String message = data['message'];

      print(data);
      Navigator.of(context)
         .pushReplacement(MaterialPageRoute(builder: (context) => AllOrderlist()));
      Toast.show(data.toString(), context,
          duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
      return AllorderResponse.fromJson(json.decode(response.body));
    }
  } else {
    Toast.show(response.body, context,
        duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
    throw Exception(response.body);
  }
}
class AllorderResponse {
  int response;
  dynamic message;

  AllorderResponse({
//    this.response,
    this.message,
  });

  AllorderResponse.fromJson(Map<String, dynamic> json) {
//    response = json['code'];
    message = json;
  }
}
