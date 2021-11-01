import 'package:sound_chat/common/index.dart';

class Sharedpreferences {
  saveData(String email, String name, String phone, String image,
      String country, int id, String userlogin, bool islogin) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (email != null) sharedPreferences.setString("email", email);
    if (name != null) sharedPreferences.setString("name", name);
    if (phone != null) sharedPreferences.setString("phone", phone);
    if (image != null) sharedPreferences.setString("image", image);
    if (country != null) sharedPreferences.setString("country", country);
    if (id != null) sharedPreferences.setInt("id", id);
    if (userlogin != null) sharedPreferences.setString("userlogin", userlogin);
    if (islogin != null) sharedPreferences.setBool("islogin", islogin);
  }
//  saveDatalid(int levalid) async {
//    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//    if(levalid!=null) sharedPreferences.setInt("levalid", levalid);
//  }

  saveUsernamePassword({String username, String password}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString('username', username);
    sharedPreferences.setString('password', password);
  }

  Future<String> getUsername() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString('username');
  }

  Future<String> getPassword() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString('password');
  }

  Future<int> getUserId() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getInt('id');
  }
}

class SessionData {
  String email;
  String name;
  String phone;
  String country;
  String image;
  int id;

  getData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    email = sharedPreferences.getString('email');
    name = sharedPreferences.getString('name');
    phone = sharedPreferences.getString('phone');
    country = sharedPreferences.getString('country');
    image = sharedPreferences.getString('image');
    id = sharedPreferences.getInt('id');
  }
}
