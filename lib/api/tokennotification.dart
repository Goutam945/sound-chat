import 'package:sound_chat/common/index.dart';
import 'package:http/http.dart' as http;

Future<TokenApi> createTokenapiState(
    {String token, String devicetype, context}) async {
  final http.Response response = await http.post(
      Uri.parse(baseUrl + 'setdeviceinfo'),
      body: {'device_token': token, 'device_type': devicetype});

  if (response.statusCode == 200) {
    var data = json.decode(response.body);
    print(data);
    {
      // Toast.show(data['status'].toString(), context,
      //     duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
      return TokenApi.fromJson(json.decode(response.body));
    }
  } else {
    Toast.show(response.body, context,
        duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
    throw Exception(response.body);
  }
}

class TokenApi with ChangeNotifier {
  dynamic data;

  TokenApi({
    this.data,
  });

  TokenApi.fromJson(Map<String, dynamic> json) {
    data = json;
    notifyListeners();
  }
}
