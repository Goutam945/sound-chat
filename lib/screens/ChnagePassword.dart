import 'package:sound_chat/api/change_passwod.dart';
import 'package:sound_chat/common/index.dart';
import 'DesignUpdate.dart';

class ChangePassword extends StatefulWidget {
  @override
  _ChangePassword createState() => _ChangePassword();
}
class _ChangePassword extends State<ChangePassword> {
  final TextEditingController _newpassword = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool _isObscure = true;
  bool loader=false;
  int id;
  @override
  void initState() {
    super.initState();
    _loadSavedData();
  }
  _loadSavedData() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      if(sharedPreferences.getString('email') != null && sharedPreferences.getString('email').isNotEmpty){
        id = sharedPreferences.getInt('id');
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body:Stack(
          children: [
            SingleChildScrollView(
              child: SizedBox(
                  height: height,
                  width: width,
                  child: Image.asset(
                    "assets/soundchatbg.png",
                    fit: BoxFit.fill,
                  )),
            ),
            Form(
              key: formKey,
              child: ListView(
                children: [
                  SizedBox(height: 10,),
                  Image.asset(
                    "assets/soundpic.png",
                    width: width * 0.316,
                    height: height * 0.1902,
                  ),
                  SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: TextFormField(style: TextStyle(color: Color(0xFFA79A9A)),
                      controller: _newpassword,
                      obscureText: _isObscure,
                      validator: Validators.required(
                          'newpassword is required'),
                      decoration: InputDecoration(
                          errorStyle: TextStyle(height: 0.5),
                          prefixIcon:  Icon(Icons.lock,size: 28,
                            color: Color(0xFF6A6B6D),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          hintText: 'Enter new password',hintStyle: TextStyle(color: Color(0xFFA79A9A)),
                          contentPadding: EdgeInsets.only(
                              left: 20, top: 15)),
                    ),
                  ),
                  SizedBox(height: 30,),
                  Container(height: 60,
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: ElevatedButton(style:ElevatedButton.styleFrom( primary: Colors.orange,
//                      shape: new RoundedRectangleBorder(
//                    borderRadius: new BorderRadius.circular(30.0),)
                    ),
                      onPressed: () {
                        if (formKey.currentState.validate()) {
                          createChangepasswrdState(id,_newpassword.text, context).whenComplete(() {
                            setState(() {
                              loader=false;
                            });
                          });
                          setState(() {
                            loader=true;
                          });
                        }
                      },
                      child: Text('Change',style: TextStyle(fontSize: 20),),
                    ),
                  ),
                  SizedBox(height: 10,),
                ],
              ),
            ),
            if(loader)Center(child: CircularProgressIndicator(),)

          ],
        ),
      ),
    );
  }
}
