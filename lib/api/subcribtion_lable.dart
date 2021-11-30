import 'package:sound_chat/common/index.dart';
import 'package:http/http.dart' as http;
import 'package:sound_chat/common/shared_preferences.dart';

Future<SubcriptionlevalResponse> createSubcriptionlevalState(
    int userid, context) async {
  final http.Response response = await http
      .post(Uri.parse(baseUrl + 'subscriberdetails'), headers: <String, String>{
    "x-access-token": await Sharedpreferences().getToken()
  }, body: {
    'user_id': "$userid",
  });
  if (response.statusCode == 200) {
    //var data = json.decode(response.body);
    {
      //print(data);
      //  Provider.of<SubcriptionlevalResponse>(context, listen: false).data = data;
//      Navigator.of(context)
//          .pushReplacement(MaterialPageRoute(builder: (context) => AllOrderlist()));
//      Toast.show(data.toString(), context,
//          duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
      return SubcriptionlevalResponse.fromJson(json.decode(response.body));
    }
  } else {
    Toast.show(response.body, context,
        duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
    throw Exception(response.body);
  }
}

class SubcriptionlevalResponse with ChangeNotifier {
  dynamic data;

  SubcriptionlevalResponse({
//    this.response,
    this.data,
  });

  SubcriptionlevalResponse.fromJson(Map<String, dynamic> json) {
//    response = json['code'];
    data = json;
    notifyListeners();
  }
}
