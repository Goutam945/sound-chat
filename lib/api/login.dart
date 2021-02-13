import 'package:sound_chat/common/index.dart';
import 'package:http/http.dart' as http;

Future<LoginResponse> createLoginState(
    String name, String password, context) async {
  final http.Response response =
      await http.post('https://mintok.com/soundchat/wp-json/wp/v2/login',
          headers: <String, String>{"content-type": "application/json"},
          body: jsonEncode({
            'username': name,
            'password': password,
          }));

  if (response.statusCode == 200) {
    dynamic loginResponse = json.decode(response.body);
    String code = loginResponse['code'];
    dynamic message = loginResponse['message'];
    if(code == '200'){
      int id = message['ID'];
      dynamic data = message['data'];
      Provider.of<LoginResponse>(context, listen: false).data = data;
      Provider.of<LoginResponse>(context, listen: false).id = id;
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => HomeScreen()));
      Toast.show("Logged in Successfully", context,
          duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
    } else {
      Toast.show(message, context,
          duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
    }
    return LoginResponse.fromJson(json.decode(response.body));
  } else {
    throw Exception(response.body);
  }
}

class LoginResponse with ChangeNotifier {
  dynamic message;
  int id;
  dynamic data;

  LoginResponse({
    this.message,
    this.id,
    this.data,
  });

  LoginResponse.fromJson(Map<dynamic, dynamic> json) {
    message = json['message'];
    id = message['ID'];
    data = message['data'];
    notifyListeners();
  }
}
