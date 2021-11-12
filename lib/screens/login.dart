/*
import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
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


  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<void> signInWithGoogle() async {
    final googleSignIn = GoogleSignIn();
    final googleUser = await googleSignIn.signIn();
    if (googleUser != null) {
      final googleAuth = await googleUser.authentication;
      if (googleAuth.idToken != null) {
        final userCredential = await _firebaseAuth.signInWithCredential(
          GoogleAuthProvider.credential(
              idToken: googleAuth.idToken, accessToken: googleAuth.accessToken),
        );
        print(googleAuth.idToken);
        return userCredential.user;
      }
    } else {
      throw FirebaseAuthException(
        message: "Sign in aborded by user",
        code: "ERROR_ABORDER_BY_USER",
      );
    }
  }


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
                          hintText: 'Username/Mobile Number',
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
                      Navigator.push(context,
                          PageTransition(type:
                          PageTransitionType.rightToLeft, child: DesignForgotpass()));
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
                  GestureDetector(
                    onTap: (){
                      // Navigator.of(context).push(MaterialPageRoute(
                      //     builder: (context) => Googlesigninuser()));
                      signInWithGoogle().whenComplete((){
                        Navigator.push(context,
                            PageTransition(type:
                            PageTransitionType.rightToLeft, child: HomeScreen()));
                      });
                    },
                    child: Container(height: 60,
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
                          Navigator.push(context,
                              PageTransition(type:
                              PageTransitionType.rightToLeft, child: Subscription()));
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
                  SizedBox(
                    height: height * 0.03189,
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Text("CONTINUE AS GUEST",
                          style: TextStyle(
                            fontSize: 18,
                            color: Color(0xFF66BA5F),
                          ),
                          textAlign: TextAlign.center))
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


*/
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:sound_chat/common/index.dart';
import 'package:sound_chat/common/shared_preferences.dart';

class NewLogin extends StatefulWidget {
  @override
  _DesignLogin createState() => _DesignLogin();
}

//SharedPreferences localStorage;
class _DesignLogin extends State<NewLogin> {
  @override
  void initState() {
    super.initState();
    getuserpassword();
  }

  final formKey = GlobalKey<FormState>();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _password = TextEditingController();
  bool loader = false;
  bool isRemembered = false;
  InputBorder border = OutlineInputBorder(
    borderSide: const BorderSide(color: Color(0xFFA6B3BC), width: 2.0),
    borderRadius: BorderRadius.circular(30.0),
  );

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<void> signInWithGoogle() async {
    final googleSignIn = GoogleSignIn();
    final googleUser = await googleSignIn.signIn();
    if (googleUser != null) {
      final googleAuth = await googleUser.authentication;
      if (googleAuth.idToken != null) {
        final userCredential = await _firebaseAuth.signInWithCredential(
          GoogleAuthProvider.credential(
              idToken: googleAuth.idToken, accessToken: googleAuth.accessToken),
        );
        print(googleAuth.idToken);
        return userCredential.user;
      }
    } else {
      throw FirebaseAuthException(
        message: "Sign in aborded by user",
        code: "ERROR_ABORDER_BY_USER",
      );
    }
  }

  getuserpassword() {
    Sharedpreferences().getUsername().then((value) {
      _name.text = value;
    });
    Sharedpreferences().getPassword().then((value) {
      _password.text = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Container(
                height: height,
                width: width,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [Color(0xFF3F535E), Color(0xFF3A432E)])),
              ),
            ),
            Form(
              key: formKey,
              child: ListView(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Image.asset(
                    "assets/home2.png",
                    width: width * 0.316,
                    height: height * 0.1902,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 2,
                        width: 110,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "SIGN IN",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            fontFamily: fontfamily,
                            color: Colors.white),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: 2,
                        width: 110,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextFormField(
                      style: TextStyle(
                          color: Colors.white, fontFamily: fontfamily),
                      controller: _name,
                      validator: Validators.required('Username is required'),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                        border: border,
                        enabledBorder: border,
                        focusedBorder: border,
                        fillColor: Colors.white,
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Image.asset(
                            'assets/user50.png',
                          ),
                        ),
                        hintText: 'Username',
                        hintStyle: TextStyle(
                            color: Colors.white, fontFamily: fontfamily),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextFormField(
                      obscureText: true,
                      style: TextStyle(
                          color: Colors.white, fontFamily: fontfamily),
                      controller: _password,
                      validator: Validators.required('Password is required'),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                        border: border,
                        enabledBorder: border,
                        focusedBorder: border,
                        fillColor: Colors.white,
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Image.asset(
                            'assets/password50.png',
                          ),
                        ),
                        hintText: 'Password',
                        hintStyle: TextStyle(
                            color: Colors.white, fontFamily: fontfamily),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isRemembered = !isRemembered;
                            });
                          },
                          child: Row(
                            children: [
                              // Image.asset(
                              //   'assets/check50.png',
                              // ),
                              Icon(
                                Icons.check_circle_rounded,
                                size: 30,
                                color: isRemembered
                                    ? Colors.green
                                    : Color(0xFFA6B3BC),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Remember me",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontFamily: fontfamily),
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                PageTransition(
                                    type: PageTransitionType.rightToLeft,
                                    child: DesignForgotpass()));
                          },
                          child: Text(
                            "Forgot password?",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontFamily: fontfamily),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          if (formKey.currentState.validate()) {
                            createLoginState(_name.text, _password.text,
                                    isRemembered, context)
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
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 40, vertical: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(color: Colors.white)),
                          child: Center(
                              child: Text(
                            'LOGIN',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          )),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    height: 2,
                    width: width,
                    color: Colors.white,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.rightToLeft,
                              child: Subscription()));
                    },
                    child: Text(
                      "Create Account",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: fontfamily),
                    ),
                  ),
                ],
              ),
            ),
            if (loader)
              Center(
                child: CircularProgressIndicator(),
              ),
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                )),
          ],
        ),
      ),
    );
  }
}
