import 'package:sound_chat/common/index.dart';
import 'package:http/http.dart' as http;

Future<CoupncodeResponse> createCoupncodeState(context) async {
  final http.Response response =
  await http.get( Uri.parse('http://mintok.com/soundchat/wp-json/coupon/v2/'));
  if (response.statusCode == 200) {
    dynamic data = json.decode(response.body);
    Provider.of<CoupncodeResponse>(context, listen: false).data = data;
    return CoupncodeResponse.fromJson(json.decode(response.body));
  } else {
    Toast.show("server error", context,
        duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
    throw Exception(response.body);
  }
}

class CoupncodeResponse with ChangeNotifier {
  dynamic data;

  CoupncodeResponse({
    this.data,
  });

  CoupncodeResponse.fromJson(Map<dynamic, dynamic> json) {
    data = json;
    notifyListeners();
  }
}