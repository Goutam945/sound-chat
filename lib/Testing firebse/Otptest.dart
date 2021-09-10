import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sound_chat/common/index.dart';

import 'dart:async';

import 'package:sound_chat/common/navinext.dart';

import 'Firebasecrud.dart';

class Otpmsg extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<Otpmsg> {
  String phoneNumber, verificationId;
  String otp, authStatus = "";

  Future<void> verifyPhoneNumber(BuildContext context) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      timeout: const Duration(seconds: 15),
      verificationCompleted: (AuthCredential authCredential) {
        setState(() {
          authStatus = "Your account is successfully verified";
        });
      },
      verificationFailed: (authException) {
        setState(() {
          authStatus = "Authentication failed";
        });
      },
      codeSent: (String verId, [int forceCodeResent]) {
        verificationId = verId;
        setState(() {
          authStatus = "OTP has been successfully send";
        });
        otpDialogBox(context).then((value) {});
      },
      codeAutoRetrievalTimeout: (String verId) {
        verificationId = verId;
        setState(() {
          authStatus = "TIMEOUT";
        });
      },
    );
  }

  otpDialogBox(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return new AlertDialog(
            title: Text('Enter your OTP'),
            content: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  border: new OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                      const Radius.circular(30),
                    ),
                  ),
                ),
                onChanged: (value) {
                  otp = value;
                },
              ),
            ),
            contentPadding: EdgeInsets.all(10.0),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.rightToLeft,
                          child: HomePage()));
                  signIn(otp);
                },
                child: Text(
                  'Submit',
                ),
              ),
            ],
          );
        });
  }

  Future<void> signIn(String otp) async {
    await FirebaseAuth.instance
        .signInWithCredential(PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: otp,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFE18D13),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
              ),
              Text(
                "Phone Auth demo📱",
                style: TextStyle(
                  color: Colors.orange,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  keyboardType: TextInputType.phone,
                  decoration: new InputDecoration(
                      border: new OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(30),
                        ),
                      ),
                      filled: true,
                      prefixIcon: Icon(
                        Icons.phone_iphone,
                        color: Colors.orange,
                      ),
                      hintStyle: new TextStyle(color: Colors.grey[800]),
                      hintText: "Enter Your Phone Number...",
                      fillColor: Colors.white70),
                  onChanged: (value) {
                    phoneNumber = value;
                  },
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              ElevatedButton(
                style:ButtonStyle(shape:MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                ),backgroundColor: MaterialStateProperty.all(Colors.orange)) ,

                onPressed: () =>
                    phoneNumber == null ? null : verifyPhoneNumber(context),
                child: Text(
                  "Generate OTP",
                  style: TextStyle(color: Colors.white),
                ),

              ),
              SizedBox(
                height: 20,
              ),
              Text("Need Help?"),
              SizedBox(
                height: 20,
              ),
              Text(
                "Please enter the phone number followed by country code",
                style: TextStyle(color: Colors.green),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                authStatus == "" ? "" : authStatus,
                style: TextStyle(
                    color: authStatus.contains("fail") ||
                            authStatus.contains("TIMEOUT")
                        ? Colors.red
                        : Colors.green),
              )
            ],
          ),
        ),
      ),
    );
  }
}
