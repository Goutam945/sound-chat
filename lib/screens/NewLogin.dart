import 'dart:ui';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sound_chat/common/index.dart';

class NewLogin extends StatefulWidget {
  @override
  _DesignLogin createState() => _DesignLogin();
}

//SharedPreferences localStorage;
class _DesignLogin extends State<NewLogin> {
  @override
  void initState() {
    super.initState();
  }

  final formKey = GlobalKey<FormState>();
  bool _isObscure = true;
  final TextEditingController _name = TextEditingController();
  final TextEditingController _password = TextEditingController();
  bool loader = false;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery
        .of(context)
        .size
        .width;
    double height = MediaQuery
        .of(context)
        .size
        .height;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
//          body: Center(
//            child: Container(
//              constraints: BoxConstraints.expand(),
//              decoration: BoxDecoration(
//                  image: DecorationImage(
//                      image: NetworkImage(
//                          "https://flutter-examples.com/wp-content/uploads/2020/02/dice.jpg"),
//                      fit: BoxFit.cover)),
//              child: ClipRRect(
//                child: BackdropFilter(
//                  filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
//                  child: Container(
//                    alignment: Alignment.center,
//                    color: Colors.grey.withOpacity(0.1),
//                    child: Text(
//                      "Blur Background Image in Flutter",
//                      textAlign: TextAlign.center,
//                      style:
//                          TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
//                    ),
//                  ),
//                ),
//              ),
//            ),
//          )

        body: Stack(
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
                  /*Container(
                    height: height * 0.0585,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "SOUNDCHAT RADIO",
                          style: TextStyle(color: Colors.white, fontSize: 36),
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  ),*/
                  SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: TextFormField(
                      style: TextStyle(color: Color(0xFFA79A9A)),
                      controller: _name,
                      validator: Validators.required(
                          'Name is required'),
                      decoration: InputDecoration(
                          errorStyle: TextStyle(height: 0.5),
                          prefixIcon: Image.asset(
                            'assets/u.gif',
                            color: Color(0xFF6A6B6D),
                            scale: 2.2,
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          hintText: 'Username',
                          hintStyle: TextStyle(color: Color(0xFFA79A9A)),
                          contentPadding: EdgeInsets.only(
                              left: 20, top: 15)),
                    ),
                  ),
                  SizedBox(height: 30,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: TextFormField(
                      style: TextStyle(color: Color(0xFFA79A9A)),
                      controller: _password,
                      obscureText: _isObscure,
                      validator: Validators.required(
                          'Password is required'),
                      decoration: InputDecoration(
                          errorStyle: TextStyle(height: 0.5),
                          prefixIcon: Icon(Icons.lock, color: Color(
                              0xFF6A6B6D),),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          hintText: 'Password',
                          hintStyle: TextStyle(color: Color(0xFFA79A9A)),
                          contentPadding: EdgeInsets.only(
                              left: 20, top: 15)),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => DesignForgotpass()));
                    },
                       child: Padding(
                          padding:
                          const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                          child: Text(
                            "Reset Password",
                            textAlign: TextAlign.end,
                            style: TextStyle(
                                color: Colors.red[400], fontSize: 18),
                          ),
                        ),

                  ),
                  SizedBox(height: 10,),
                  Container(height: 60,
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.orange,
//                      shape: new RoundedRectangleBorder(
//                    borderRadius: new BorderRadius.circular(30.0),)
                      ),
                      onPressed: () {
                        if (formKey.currentState.validate()) {
                          createLoginState(_name.text, _password.text, context)
                              .whenComplete(() {
                            setState(() {
                              loader = false;
                            });
                          });
                          setState(() {
                            loader = true;
                          });
                        }
                      },
                      child: Text('SIGNIN', style: TextStyle(fontSize: 20),),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text("OR", textAlign: TextAlign.center,
                    style: TextStyle(color: Color(0xFFA79A9A), fontSize: 16),),
                  SizedBox(height: 10,),
                  Container(height: 60,
                    color: Colors.indigoAccent,
                    margin: EdgeInsets.symmetric(
                        horizontal: width * 0.07),
                    child: Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: Icon(FontAwesomeIcons.google, color: Colors
                              .white,),
                        ),
                        Text("Sign up with Google", textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.bold

                            ))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height * 0.0785,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Dont's have an account? ",
                        style: TextStyle(
                            color: Color(0xFFA79A9A),
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                        textAlign: TextAlign.center,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Subscription()));
                        },
                        child: Column(
                          children: [
                            Text(
                              "Sign UP",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 18),
                              textAlign: TextAlign.center,
                            ),
//                          Container(
//                            height: height * 0.0008,
//                            width: 80,
//                            color: Colors.white,
//                          ),
                          ],
                        ),
                      ),
                    ],
                  ),
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
