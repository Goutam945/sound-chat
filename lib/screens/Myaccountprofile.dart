import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'DesignForgotpass.dart';
import 'DesignUpdate.dart';
import 'Updateprofile.dart';

class MyAccount extends StatefulWidget {
  final email,name;
  MyAccount(this.email,this.name);
  @override
  _MyAccountState createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
String email;
String name;
String phone;
String country;
String image;
  _loadSavedData() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      if(sharedPreferences.getString('email') != null && sharedPreferences.getString('email').isNotEmpty){
        email = sharedPreferences.getString('email');
        name = sharedPreferences.getString('name');
        phone = sharedPreferences.getString('phone');
        country = sharedPreferences.getString('country');
        image = sharedPreferences.getString('image');
      }
    });
  }
@override
void initState() {
  super.initState();
  _loadSavedData();
  }

  File _image;
  final picker = ImagePicker();

  Future getImage() async {
    // final pickedFile = await picker.getImage(source: ImageSource.gallery);
    //
    // setState(() {
    //   if (pickedFile != null) {
    //     _image = File(pickedFile.path);
    //     print(_image);
    //   } else {
    //     print('No image selected.');
    //   }
    // });
    var choosedimage = await ImagePicker.pickImage(source: ImageSource.gallery);
    //set source: ImageSource.camera to get image from camera
    setState(() {
      _image = choosedimage;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Stack(
        children: [
          Scaffold(
            backgroundColor: Colors.black,
            appBar: AppBar(leadingWidth: 25,
              backgroundColor: Color(0xFFE18D13),
              title: Text("My Account"),
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  SizedBox(height: 20,),
                  Center(
                    child: CircleAvatar(
                      radius: 50,backgroundColor: Colors.green,
                      child: (_image != null)?ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Container(
                              height: 100,
                              width: 100,
                              child: Image.file(
                                _image,
                                fit: BoxFit.cover,
                              ))):Icon(Icons.account_circle,size: 70,),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text(
                    name.toString(),
                    style: TextStyle(fontSize: 16,color: Colors.white),
                  ),
                  SizedBox(height: 5,),
                  Text(
                    'Subscription_title',
                    style: TextStyle(fontSize: 16,color: Colors.orange,fontStyle: FontStyle.italic),
                  ),
                  SizedBox(height: 5,),
                  Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        phone.toString()+"  (",
                        style: TextStyle(fontSize: 16,color: Color(0xFFA79A9A)),
                      ),
                      Text(
                        country.toString()+")",
                        style: TextStyle(fontSize: 16,color: Color(0xFFA79A9A)),
                      ),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Align(alignment: Alignment.centerLeft,
                    child: Text(
                      'Account Details',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(height: 0.5,color: Colors.orange,),
                  SizedBox(height: 20,),
                  Row(
                    children: [
                      Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Email: ',
                            style: TextStyle(fontSize: 16,color: Color(0xFFA39597)),
                          ),
                          Text(
                            'User name: ',
                            style: TextStyle(fontSize: 16,color: Color(0xFFA39597)),
                          ),
                          Text(
                            'Country: ',
                            style: TextStyle(fontSize: 16,color: Color(0xFFA39597)),
                          ),
                          Text(
                            'Password:',
                            style: TextStyle(fontSize: 16,color: Color(0xFFA39597)),
                          ),
                        ],
                      ),
                      SizedBox(width: 20,),
                      Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            email.toString(),
                            style: TextStyle(fontSize: 16,color: Color(0xFFA39597)),
                          ),
                          Text(
                            name.toString(),
                            style: TextStyle(fontSize: 16,color: Color(0xFFA39597)),
                          ),
                          Text(
                            country.toString(),
                            style: TextStyle(fontSize: 16,color: Color(0xFFA39597)),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => DesignForgotpass()));
                            },
                            child: Text(
                              "Change Password",
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                  color: Color(0xFF8E0E14), fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Container(height: 2,color: Colors.orange,),
                  SizedBox(height: 20,),
                  Align(alignment: Alignment.centerLeft,
                    child: Text(
                      'Subscription Details',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  SizedBox(height: 20,),
                  Row(
                    children: [
                      Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Plan:',
                            style: TextStyle(fontSize: 16,color: Color(0xFFA39597)),
                          ),
                          Text(
                            'Expiry Date: ',
                            style: TextStyle(fontSize: 16,color: Color(0xFFA39597)),
                          ),
                          Text(
                            'Data Purchased: ',
                            style: TextStyle(fontSize: 16,color: Color(0xFFA39597)),
                          ),
                          Text(
                            'Cancel Subscription_plan: ',
                            style: TextStyle(fontSize: 16,color: Color(0xFFA39597)),
                          ),
                          Text(
                            'Update Profile: ',
                            style: TextStyle(fontSize: 16,color: Color(0xFFA39597)),
                          ),
                        ],
                      ),
                      SizedBox(width: 30,),
                      Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "subscription_plan:",
                            style: TextStyle(fontSize: 16,color: Color(0xFFA39597)),
                          ),
                          Text(
                            "Expiry_date",
                            style: TextStyle(fontSize: 16,color: Color(0xFFA39597)),
                          ),
                          Text(
                            "subscription_start",
                            style: TextStyle(fontSize: 16,color: Color(0xFFA39597)),
                          ),
                          Text(
                            "%Link%",
                            style: TextStyle(fontSize: 16,color: Color(0xFFA39597)),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => DesignUpdate()));
                            },
                            child: Text(
                              "upgrade profile",
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                  color: Color(0xFF8E0E14), fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),


                  /*Column(
                    children: [
                      // SizedBox(height: 40,),
                      // Align(
                      //     alignment: Alignment.center,
                      //     child: Text(
                      //       'My Account',
                      //       style: TextStyle(
                      //         fontSize: 22,
                      //         fontWeight: FontWeight.bold,
                      //           color: Colors.white
                      //       ),
                      //       textAlign: TextAlign.center,
                      //     )),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Container(
                            height: 110,
                            child: Stack(
                              children: [
                                CircleAvatar(radius: 50,backgroundColor: Colors.green,
                                  child: (_image != null)
                                      ? ClipRRect(
                                          borderRadius: BorderRadius.circular(50),
                                          child: Container(
                                              height: 100,
                                              width: 100,
                                              child: Image.file(
                                                _image,
                                                fit: BoxFit.cover,
                                              )))
                                      : Icon(
                                          Icons.person,
                                          size: 80,
                                        ),
                                ),
                                Positioned(
                                    bottom: 0,
                                    left: 0,
                                    right: 0,
                                    child: GestureDetector(
                                      onTap: getImage,
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 5),
                                        color: Color(0xFF8E0E14),
                                        child: Center(
                                          child: Text(
                                            'Change',
                                            style: TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ))
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                name.toString(),
                                style: TextStyle(fontSize: 16,color: Colors.white),
                              ),
                              Text(
                                'Subscription_title',
                                style: TextStyle(fontSize: 16,color: Colors.white),
                              ),
                              Text(
                                phone.toString(),
                                style: TextStyle(fontSize: 16,color: Colors.white),
                              ),
                              Text(
                                country.toString(),
                                style: TextStyle(fontSize: 16,color: Colors.white),
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Account Details',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                                color: Colors.white
                            ),
                            textAlign: TextAlign.center,
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(color: Color(0xFF252525),width: width*width,padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 10,),
                              Text(
                                'Email: '+ email.toString(),
                                style: TextStyle(fontSize: 16,color: Color(0xFFA39597)),
                              ),
                              Text(
                                'User name: '+name.toString(),
                                style: TextStyle(fontSize: 16,color: Color(0xFFA39597)),
                              ),
                              Text(
                                'Country: '+ country.toString(),
                                style: TextStyle(fontSize: 16,color: Color(0xFFA39597)),
                              ),
                              // Text(
                              //   'Password: change_link',
                              //   style: TextStyle(fontSize: 18,color: Colors.white),
                              // ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => DesignForgotpass()));
                                },
                                child: Text(
                                  "Change Password",
                                  textAlign: TextAlign.end,
                                  style: TextStyle(
                                      color: Color(0xFF8E0E14), fontSize: 16),
                                ),
                              ),
                              SizedBox(height: 10,),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Subscription Details',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                                color: Colors.white
                            ),
                            textAlign: TextAlign.center,
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(color: Color(0xFF252525),width: width*width,padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 10,),
                              Text(
                                'Plan: subscription_plan',
                                style: TextStyle(fontSize: 16,color: Color(0xFFA39597)),
                              ),
                              Text(
                                'Expiry Date: Expiry_date',
                                style: TextStyle(fontSize: 16,color: Color(0xFFA39597)),
                              ),
                              Text(
                                'Data Purchased: subscription_start',
                                style: TextStyle(fontSize: 16,color: Color(0xFFA39597)),
                              ),
                              Text(
                                'Cost: subscription_cost',
                                style: TextStyle(fontSize: 16,color: Color(0xFFA39597)),
                              ),
                              SizedBox(height: 10,),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),

                      Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            '%Cancel link%',
                            style: TextStyle(fontSize: 20,color: Colors.white),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => DesignUpdate()));
                            },
                            child: Text(
                              "upgrade profile",
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                  color: Color(0xFF8E0E14), fontSize: 16),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),*/
                ],
              ),
            ),
          ),
          /*Positioned(
            top: AppBar().preferredSize.height*0.2,
            left: width * 0.39865,
            child: SizedBox(
              height: height * 0.12168,
              width: width * 0.21875,
              child: Image.asset(
                'assets/soundpic.png',
              ),
            ),
          ),*/
        ],
      ),
    );
  }
}
