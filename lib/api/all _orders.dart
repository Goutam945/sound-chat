import 'package:sound_chat/common/index.dart';
import 'package:http/http.dart' as http;

Future<AllorderResponse> createAllOrderState(int userid, context) async {
  final http.Response response =
      await http.post(Uri.parse(baseUrl + 'listorder'), body: {
    'user_id': "$userid",
  });

  if (response.statusCode == 200) {
    Map data = json.decode(response.body);
    // print(data);
    Provider.of<AllorderResponse>(context, listen: false).data = data;
    // Navigator.of(context)
    //     .push(MaterialPageRoute(builder: (context) => AllOrderlist()));
//      Toast.show(data.toString(), context,
//          duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
    return AllorderResponse.fromJson(data);
  } else {
    Toast.show(response.body, context,
        duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
    throw Exception(response.body);
  }
}

class AllorderResponse with ChangeNotifier {
  Map data;

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
