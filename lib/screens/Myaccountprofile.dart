import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:photo_view/photo_view.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sound_chat/api/cancel_subcription.dart';
import 'package:sound_chat/api/subcribtion_lable.dart';
import 'package:sound_chat/common/Backappbar.dart';
import 'package:sound_chat/common/navinext.dart';

import 'chnagepassword.dart';
import 'designforgotpass.dart';
import 'designupdate.dart';
import 'updateprofile.dart';

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
bool loader=false;
dynamic data;
int id;
  Future<int> _loadSavedData() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      if(sharedPreferences.getString('email') != null && sharedPreferences.getString('email').isNotEmpty){
        email = sharedPreferences.getString('email');
        name = sharedPreferences.getString('name');
        phone = sharedPreferences.getString('phone');
        country = sharedPreferences.getString('country');
        image = sharedPreferences.getString('image');
        id = sharedPreferences.getInt('id');
      }
    });
    return id;
  }
@override
void initState() {
  super.initState();
  _loadSavedData().then((value) => print("USERID"+value.toString()));
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    if(Provider.of<SubcriptionlevalResponse>(context, listen: false).data!=null)
      data = Provider.of<SubcriptionlevalResponse>(context, listen: false).data['data'];
    return SafeArea(
      child: Stack(
        children: [
          Scaffold(
            backgroundColor: Colors.black,
            appBar: PreferredSize(preferredSize: Size.fromHeight(55),
                child: Backappbar()),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  SizedBox(height: 20,),
                  Center(
//                      child: CachedNetworkImage(
//                        imageUrl: image,
//                        fit: BoxFit.cover,
//                        placeholder: (context, url) => Center(
//                            child:
//                            CircularProgressIndicator()),
//                        errorWidget:
//                            (context, url, error) =>
//                            Icon(Icons.error),
//                      ),
                    child: GestureDetector(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Fullview(image)));
                      },
                      child: Container(
                        width: width * 0.2537,
                        height: height * 0.1553,
                          child: CachedNetworkImage(
                            imageUrl: image,
                            fit: BoxFit.fill,
                            imageBuilder: (context, imageProvider) => CircleAvatar(
                              radius: 50,
                              backgroundImage: imageProvider,
                            ),
                            placeholder: (context, url) => Center(
                                child:
                                CircularProgressIndicator()),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                          ),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white),
                      ),
                  ),),
                  SizedBox(height: 10,),
                  Text(
                    name.toString(),
                    style: TextStyle(fontSize: 16,color: Colors.white),
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
                          Text(
                            'Update Profile:',
                            style: TextStyle(fontSize: 16,color: Color(0xFFA39597)),
                          ),

                        ],
                      ),
                      SizedBox(width: 10,),
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
                              Navigator.push(
                                  context,
                                  PageTransition(
                                      type: PageTransitionType.rightToLeft,
                                      child: ChangePassword()));
                            },
                            child: Text(
                              "Change Password",
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                  color: Color(0xFF8E0E14), fontSize: 16),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  PageTransition(
                                      type: PageTransitionType.rightToLeft,
                                      child: DesignUpdate()));
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
                            'Plan Level:',
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
                            'Cancel Plan: ',
                            style: TextStyle(fontSize: 16,color: Color(0xFFA39597)),
                          ),
                        ],
                      ),
                      SizedBox(width: 30,),
                      //for(int i=0;i<((data!=null)?data.length:0);i++)
                     // for (int i = 0; i < data.length; i++)
                      data != null? Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data["plan_id"].toString(),
                            style: TextStyle(fontSize: 16,color: Color(0xFFA39597)),
                          ),
                          SizedBox(height: 20,width: 90,
                            child: Text(
                              data["plan_expired"].toString(),
                              style: TextStyle(fontSize: 16,color: Color(0xFFA39597)),
                            ),
                          ),
                          SizedBox(height: 20,width: 90,
                            child: Text(
                              data["plan_active"].toString(),
                              style: TextStyle(fontSize: 16,color: Color(0xFFA39597)),
                            ),
                          ),
                          GestureDetector(
                              onTap: () => {
                                setState(() {
                                  loader=true;
                                }),
                                createCancelsubcripState(id.toString(),context).whenComplete(() {
                                  setState(() {
                                    loader=false;
                                  });
                                }),
                              },
                         child: Text(
                            "Cancel Subscription",
                            style: TextStyle(fontSize: 16,color: Colors.orange),
                          )),
                        ],
                      ):Text("FREE")
                    ],
                  ),

                ],
              ),
            ),
          ),
          if(loader)Center(child: CircularProgressIndicator(),),
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
class Fullview extends StatefulWidget {
  final image;
  Fullview(this.image);
  @override
  _FullImageState createState() => _FullImageState();
}

class _FullImageState extends State<Fullview> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          leading: Builder(builder: (BuildContext context) {
            return IconButton(
              icon: Icon(
                Icons.arrow_back_rounded,
                color: Colors.white,
                size: 25,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            );
          }),
        ),
        body: Center(
          child: Container(
            child: PhotoView(
              imageProvider: CachedNetworkImageProvider(widget.image),
            ),
          ),
        ),
      ),
    );
  }
}
