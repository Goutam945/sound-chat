import 'package:sound_chat/common/index.dart';
import 'package:http/http.dart' as http;
import 'package:sound_chat/screens/allorderdetails.dart';
Future<AllorderResponse> createAllOrderState(int userid,
    context) async {
  final http.Response response = await http.post(
      Uri.parse(baseUrl+'listorder'),
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
      Provider.of<AllorderResponse>(context, listen: false).data = data;
      Navigator.of(context)
         .pushReplacement(MaterialPageRoute(builder: (context) => AllOrderlist()));
//      Toast.show(data.toString(), context,
//          duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
      return AllorderResponse.fromJson(json.decode(response.body));
    }
  } else {
    Toast.show(response.body, context,
        duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
    throw Exception(response.body);
  }
}
class AllorderResponse with ChangeNotifier {
  dynamic data;

  AllorderResponse({
//    this.response,
    this.data,
  });

  AllorderResponse.fromJson(Map<String, dynamic> json) {
//    response = json['code'];
    data = json;
    notifyListeners();
  }
}
