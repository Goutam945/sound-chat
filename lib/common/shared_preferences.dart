import 'package:sound_chat/common/index.dart';

class Sharedpreferences {
  saveData(String email, String name, String phone, String image, String country,int id,String userlogin) async {
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if(email!=null)  sharedPreferences.setString("email", email);
    if(name!=null) sharedPreferences.setString("name", name);
    if(phone!=null)  sharedPreferences.setString("phone", phone);
    if(image!=null)  sharedPreferences.setString("image", image);
   if(country!=null) sharedPreferences.setString("country", country);
   if(id!=null) sharedPreferences.setInt("id", id);
   if(userlogin!=null) sharedPreferences.setString("userlogin", userlogin);


  }
//  saveDatalid(int levalid) async {
//    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//    if(levalid!=null) sharedPreferences.setInt("levalid", levalid);
//  }
}
