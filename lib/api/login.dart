/*import 'package:sound_chat/api/subcribtion_lable.dart';
import 'package:sound_chat/common/index.dart';
import 'package:http/http.dart' as http;
import 'package:sound_chat/common/shared_preferences.dart';

Future<LoginResponse> createLoginState(
    String name, String password, context) async {
  final http.Response response =
      await http.post(Uri.parse('https://mintok.com/soundchat/wp-json/wp/v2/login'),
          headers: <String, String>{"content-type": "application/json"},
          body: jsonEncode({
            'username': name,
            'password': password,
          }));

  if (response.statusCode == 200) {
    print(response.body);
    dynamic loginResponse = json.decode(response.body);
    print(response.body);
    String code = loginResponse['code'];
    dynamic message = loginResponse['message'];
    if(code == '200'){

      dynamic data = message['data'];
      //Sharefrifrance
      String email=data['user_email'];
      String name=data['first_name'];
      String phone=data['phone'];
      String image=data['image'];
      String country=data['country'];
      int id = message['ID'];
      String userlogin=data['user_login'];
      Sharedpreferences().saveData(email,name,phone,image,country,id,userlogin);
      print(id);
      createSubcriptionlevalState(id,context);
      //
      // int id = message['ID'];
      // //dynamic data = message['data'];
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
*/
import 'package:sound_chat/api/subcribtion_lable.dart';
import 'package:sound_chat/common/index.dart';
import 'package:http/http.dart' as http;
import 'package:sound_chat/common/shared_preferences.dart';
import 'package:sound_chat/screens/homebottomBar.dart';

Future<LoginResponse> createLoginState(
    String mobile, String password, bool isRemembered, context) async {
  final http.Response response = await http.post(Uri.parse(baseUrl + 'signin'),
      headers: <String, String>{"content-type": "application/json"},
      body: jsonEncode({
        'mobileno': mobile,
        'password': password,
      }));
  if (response.statusCode == 200) {
    //print(response.body);

    dynamic data = json.decode(response.body);
    if (data['status'] == null) {
      //Sharefrifrance
      String email = data['email'];
      String name = data['fname'];
      String phone = data['mobileno'];
      String image = data['profilepic'];
      String country = data['country'];
      int id = data['id'];
      String userlogin = data['username'];
      Sharedpreferences()
          .saveData(email, name, phone, image, country, id, userlogin, true);
      if (isRemembered) {
        Sharedpreferences()
            .saveUsernamePassword(username: mobile, password: password);
      }
      final get = await Sharedpreferences().getUsername();

      //  print("USERNAME" + get.toString());
      createSubcriptionlevalState(id, context);

      Provider.of<LoginResponse>(context, listen: false).data = data;
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => HomeBottomBar()));
      Toast.show("Logged in Successfully", context,
          duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
      return LoginResponse.fromJson(json.decode(response.body));
    } else {
      Toast.show(data['message'], context,
          duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
    }
    return LoginResponse.fromJson(json.decode(response.body));
  } else {
    Toast.show("server error", context,
        duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
    throw Exception(response.body);
  }
}

class LoginResponse with ChangeNotifier {
  dynamic data;

  LoginResponse({
    this.data,
  });

  LoginResponse.fromJson(Map<dynamic, dynamic> json) {
    data = json;
    notifyListeners();
  }
}
