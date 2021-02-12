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
    dynamic message = loginResponse['message'];
    int id = message['ID'];
    dynamic data = message['data'];
    Provider.of<LoginResponse>(context, listen: false).data = data;
    Provider.of<LoginResponse>(context, listen: false).ID = id;
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => HomeScreen()));
    Toast.show("Successfully Login", context,
        duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
    return LoginResponse.fromJson(json.decode(response.body));
  }
  if (response.statusCode == 406) {
    print(response.body);
  } else {
    throw Exception(response.body);
  }
}

class LoginResponse with ChangeNotifier {
  dynamic message;
  int ID;
  dynamic data;

  LoginResponse({
    this.message,
    this.ID,
    this.data,
  });

  LoginResponse.fromJson(Map<dynamic, dynamic> json) {
    message = json['message'];
    ID = message['ID'];
    data = message['data'];
    notifyListeners();
  }
}
