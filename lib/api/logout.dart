import 'package:sound_chat/common/index.dart';
import 'package:http/http.dart' as http;
import 'package:sound_chat/common/shared_preferences.dart';

Future<LogoutResponse> createLogoutState({int userid, context}) async {
  final http.Response response =
      await http.post(Uri.parse(baseUrl + 'signout'), body: {
    'id': "$userid",
  });
  void remove() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String username = await Sharedpreferences().getUsername();
    String password = await Sharedpreferences().getPassword();
    await preferences.clear();
    Sharedpreferences()
        .saveUsernamePassword(username: username, password: password);
  }

  if (response.statusCode == 200) {
    var data = json.decode(response.body);
    {
      remove();
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => HomeBottomBar()));
      Toast.show(data['status'].toString(), context,
          duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
      return LogoutResponse.fromJson(json.decode(response.body));
    }
  } else {
    Toast.show(response.body, context,
        duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
    throw Exception(response.body);
  }
}

class LogoutResponse with ChangeNotifier {
  dynamic data;

  LogoutResponse({
    this.data,
  });

  LogoutResponse.fromJson(Map<String, dynamic> json) {
    data = json;
    notifyListeners();
  }
}
