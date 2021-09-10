import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:sound_chat/common/index.dart';
class DesignUpdate extends StatefulWidget {
  @override
  _DesignUpdate createState() => _DesignUpdate();
}

class _DesignUpdate extends State<DesignUpdate> {
 /* final TextEditingController _firstname = TextEditingController();
  final TextEditingController _lastname = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool loader = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var userResponse = context.watch<LoginResponse>();
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
                    "assets/soundbg.png",
                    fit: BoxFit.fill,
                  )),
            ),
            ListView(
              children: [
                Image.asset(
                  "assets/soundpic.png",
                  width: width * 0.316,
                  height: height * 0.1902,
                ),
                Container(
                  color: Color(0xFF8E180A),
                  height: height * 0.0585,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "WELCOME TO  ",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w100),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        "SOUNDCHAT RADIO",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 2,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(top: 50),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width / 1.2,
                          height: 45,
                          padding: EdgeInsets.only(
                              top: 4, left: 16, right: 16, bottom: 4),
                          // decoration: BoxDecoration(
                          //     borderRadius: BorderRadius.all(
                          //         Radius.circular(10)
                          //     ),
                          //     color: Color(0xFFDBCBB1),
                          //     boxShadow: [
                          //       BoxShadow(
                          //           color: Color(0xFF0A660F),
                          //           blurRadius: 5
                          //       )
                          //     ]
                          // ),
                          child: TextFormField(
                            controller: _firstname,
                            validator: Validators.required('Name is required'),
                            decoration: InputDecoration(
                              //  border: InputBorder.none,
                              hintText: 'Firstname',
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 1.2,
                          height: 45,
                          padding: EdgeInsets.only(
                              top: 4, left: 16, right: 16, bottom: 4),
                          // decoration: BoxDecoration(
                          //     borderRadius: BorderRadius.all(
                          //         Radius.circular(10)
                          //     ),
                          //     color: Color(0xFFDBCBB1),
                          //     boxShadow: [
                          //       BoxShadow(
                          //           color: Color(0xFF0A660F),
                          //           blurRadius: 5
                          //       )
                          //     ]
                          // ),
                          child: TextFormField(
                            controller: _lastname,
                            validator:
                                Validators.required('LastName is required'),
                            decoration: InputDecoration(
                              // border: InputBorder.none,
                              hintText: 'Lastname',
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        InkWell(
                          onTap: () {
                            if (formKey.currentState.validate()) {
                              createUpdateState(
                                      _firstname.text,
                                      _lastname.text,
                                      userResponse.id,
                                      userResponse.data['user_login'],
                                      userResponse.data['user_nicename'],
                                      userResponse.data['user_email'],
                                      userResponse.data['display_name'],
                                      userResponse.data['phone'],
                                      context)
                                  .whenComplete(() {
                                setState(() {
                                  loader = false;
                                });
                              });
                              setState(() {
                                loader = true;
                              });
                              ;
                            }
                          },
                          child: Container(
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Color(0xFF0A660F),
                                      Color(0xFF0A660F),
                                    ],
                                  ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              height: height * 0.0592,
                              width: MediaQuery.of(context).size.width / 1.2,
                              padding: EdgeInsets.only(top: 10),
                              child: Text(
                                "SEND",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              )),
                        ),
                        SizedBox(
                          height: 042,
                        ),
                        GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Text("CONTINUE",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Color(0xFF66BA5F),
                                ),
                                textAlign: TextAlign.center))
                      ],
                    ),
                  ),
                ),
              ],
            ),if(loader)Center(child: CircularProgressIndicator(),)
          ],
        ),
      ),
    );*/
  //new design
  final formKey = GlobalKey<FormState>();
  bool loader=false;
  int id;
  String phone,userlogin;
  @override
  void initState() {
    super.initState();
    _loadSavedData();
  }
  File _image; //variable for choosed file
  final picker = ImagePicker();
  Future<void> getImage() async {
    PickedFile imageFile = await picker.getImage(source: ImageSource.gallery);
    //var choosedimage = await ImagePicker.pickImage(source: ImageSource.gallery);
    //set source: ImageSource.camera to get image from camera
    setState(() {
      //_image = choosedimage;
      _image = File(imageFile.path);
    });
  }

  _loadSavedData() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      if(sharedPreferences.getString('email') != null && sharedPreferences.getString('email').isNotEmpty){
        id = sharedPreferences.getInt('id');
        phone = sharedPreferences.getString('phone');
        userlogin = sharedPreferences.getString('userlogin');

      }
    });
  }
  //Future<SignUpResponse> _futureJwt;
  final TextEditingController _username = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _country = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Stack(
          children:[ Scaffold(
            backgroundColor: Colors.black,
            appBar: AppBar(
              backgroundColor: Color(0xFFE18D13),
              //title: Text("Flutter Http Example"),
            ),
            body:Form(key: formKey,
              child: ListView(
                children: [
                  SizedBox(height: 40,),
                  Center(child: Text("Update Form",style: TextStyle(fontSize: 19,color: Color(0xFFE18D13),fontWeight: FontWeight.bold),)),
                  SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextFormField(style: TextStyle(color: Color(0xFFA79A9A)),
                      decoration: InputDecoration(enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white, width: 2.0),
                        borderRadius: BorderRadius.circular(25.0),
                      ),errorBorder:OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white, width: 2.0),
                        borderRadius: BorderRadius.circular(25.0),
                      ) ,disabledBorder:OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white, width: 2.0),
                        borderRadius: BorderRadius.circular(25.0),
                      ),focusedErrorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white, width: 2.0),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                        labelText: " Username",
                        labelStyle: TextStyle(
                          color:Color(0xFFA79A9A),
                        ),
                        fillColor: Colors.white,
                        focusedBorder:OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white, width: 2.0),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        hintText: 'Userame:',hintStyle: TextStyle(color: Color(0xFFA79A9A)),
                        suffixIcon: Icon(Icons.account_circle,color: Color(0xFFA79A9A),),

                      ),
                      controller: _username,
                      validator: Validators.required(
                          'Userame required'),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextFormField(style: TextStyle(color: Color(0xFFA79A9A)),
                      decoration: InputDecoration(enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white, width: 2.0),
                        borderRadius: BorderRadius.circular(25.0),
                      ),errorBorder:OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white, width: 2.0),
                        borderRadius: BorderRadius.circular(25.0),
                      ) ,disabledBorder:OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white, width: 2.0),
                        borderRadius: BorderRadius.circular(25.0),
                      ),focusedErrorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white, width: 2.0),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                        labelText: "Email",
                        labelStyle: TextStyle(
                          color:Color(0xFFA79A9A),
                        ),
                        fillColor: Colors.white,
                        focusedBorder:OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white, width: 2.0),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        hintText: 'Email:',hintStyle: TextStyle(color: Color(0xFFA79A9A)),
                        suffixIcon: Icon(Icons.email_outlined,color: Color(0xFFA79A9A),),

                      ),
                      controller: _email,
                      validator: Validators.required(
                          'Email required'),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextFormField(style: TextStyle(color: Color(0xFFA79A9A)),
                      decoration: InputDecoration(enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white, width: 2.0),
                        borderRadius: BorderRadius.circular(25.0),
                      ),errorBorder:OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white, width: 2.0),
                        borderRadius: BorderRadius.circular(25.0),
                      ) ,disabledBorder:OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white, width: 2.0),
                        borderRadius: BorderRadius.circular(25.0),
                      ),focusedErrorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white, width: 2.0),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                        labelText: "phone",
                        labelStyle: TextStyle(
                          color:Color(0xFFA79A9A),
                        ),
                        fillColor: Colors.white,
                        focusedBorder:OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white, width: 2.0),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        hintText: 'Phone:',hintStyle: TextStyle(color: Color(0xFFA79A9A)),
                        suffixIcon: Icon(Icons.phone,color: Color(0xFFA79A9A),),

                      ),
                      controller: _phone,
                      validator: Validators.required(
                          'phone is required'),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextFormField(style: TextStyle(color: Color(0xFFA79A9A)),
                      decoration: InputDecoration(enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white, width: 2.0),
                        borderRadius: BorderRadius.circular(25.0),
                      ),errorBorder:OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white, width: 2.0),
                        borderRadius: BorderRadius.circular(25.0),
                      ) ,disabledBorder:OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white, width: 2.0),
                        borderRadius: BorderRadius.circular(25.0),
                      ),focusedErrorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white, width: 2.0),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                        labelText: "Name",
                        labelStyle: TextStyle(
                          color:Color(0xFFA79A9A),
                        ),
                        fillColor: Colors.white,
                        focusedBorder:OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white, width: 2.0),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        hintText: 'Name:',hintStyle: TextStyle(color: Color(0xFFA79A9A)),
                        suffixIcon: Icon(Icons.supervised_user_circle_sharp,color: Color(0xFFA79A9A),),

                      ),
                      controller: _name,
                      validator: Validators.required(
                          'nicke name is required'),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextFormField(style: TextStyle(color: Color(0xFFA79A9A)),
                      decoration: InputDecoration(enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white, width: 2.0),
                        borderRadius: BorderRadius.circular(25.0),
                      ),errorBorder:OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white, width: 2.0),
                        borderRadius: BorderRadius.circular(25.0),
                      ) ,disabledBorder:OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white, width: 2.0),
                        borderRadius: BorderRadius.circular(25.0),
                      ),focusedErrorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white, width: 2.0),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                        labelText: "Country",
                        labelStyle: TextStyle(
                          color:Color(0xFFA79A9A),
                        ),
                        fillColor: Colors.white,
                        focusedBorder:OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white, width: 2.0),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        hintText: 'Country:',hintStyle: TextStyle(color: Color(0xFFA79A9A)),
                        suffixIcon: Icon(Icons.home_work_outlined,color: Color(0xFFA79A9A),),

                      ),
                      controller: _country,
                      validator: Validators.required(
                          'Country is required'),
                    ),
                  ),
                  SizedBox(height: 20,),
                  CircleAvatar(
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
                  SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 80),
                    child: ElevatedButton(style:ElevatedButton.styleFrom(primary: Colors.white,
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0),
                        )),
                      onPressed: () {
                        getImage();
                      },
                      child: Text('Upload profile',style: TextStyle(fontSize: 16,color: Colors.black),),
                    ),
                  ),
                  SizedBox(height: 20,),
                  //Text(userlogin.toString(),style: TextStyle(color: Colors.white),),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 80),
                    child: SizedBox(height: 50,
                      child: ElevatedButton(style:ElevatedButton.styleFrom( primary: Color(0xFF8E0E14),
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0),
                          )),
                        onPressed: () {
                          if (formKey.currentState.validate()) {
                            createUpdateState(
                                id,
                                _username.text,
                                _email.text,
                                _phone.text,
                                _name.text,
                                _country.text,
                                _image,
                                context)
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
                        child: Text('Update',style: TextStyle(fontSize: 16),),
                      ),
                    ),
                  ),

                 /* Column(
                    children: [
                      SizedBox(height: 40,),
                      Text("Update Profile",style: TextStyle(fontSize: 19,color: Colors.white),),
                      SizedBox(height: 10,),
                      Form(
                        key: formKey,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Column(
                              children: [
                                Container(color: Color(0xFF464646),
                                  child: TextFormField( style: TextStyle(color: Colors.white),
                                    controller: _firstname,
                                    validator: Validators.required(
                                        'Name is required'),
                                    decoration: InputDecoration(errorStyle: TextStyle(height: 0.5,),
                                        hintText: 'First Name:',
                                        contentPadding: EdgeInsets.only(
                                            left: 20, top: 0)),
                                  ),
                                ),
                                SizedBox(height: 10,),
                                Container(color: Color(0xFF464646),
                                  child: TextFormField(  style: TextStyle(color: Colors.white),
                                    controller: _lastname,
                                    validator: Validators.required(
                                        'Last Name is required'),
                                    decoration: InputDecoration(errorStyle: TextStyle(height: 0.5),
                                        hintText: 'Last Name:',
                                        contentPadding: EdgeInsets.only(
                                            left: 20, top: 0)),
                                  ),
                                ),
                                SizedBox(height: 10,),
                                Container(color: Color(0xFF464646),
                                  child: TextFormField(  style: TextStyle(color: Colors.white),
                                    controller: _email,
                                    validator: Validators.required(
                                        'Email is required'),
                                    decoration: InputDecoration(errorStyle: TextStyle(height: 0.5),
                                        hintText: 'Email Address:',
                                        contentPadding: EdgeInsets.only(
                                            left: 20, top: 0)),
                                  ),
                                ),
                                SizedBox(height: 10,),
                                Container(color: Color(0xFF464646),
                                  child: TextFormField(  style: TextStyle(color: Colors.white),
                                    controller: _nicke,
                                    validator: Validators.required(
                                        'nickname is required'),
                                    decoration: InputDecoration(errorStyle: TextStyle(height: 0.5),
                                        hintText: 'Nickname:',
                                        contentPadding: EdgeInsets.only(
                                            left: 20, top: 0)),
                                  ),
                                ),
                                SizedBox(height: 10,),
                                Container(color: Color(0xFF464646),
                                  child: TextFormField(  style: TextStyle(color: Colors.white),
                                    controller: _displayname,
                                    validator: Validators.required(
                                        'displayanme is required'),
                                    decoration: InputDecoration(errorStyle: TextStyle(height: 0.5),
                                        hintText: 'Displayname:',
                                        contentPadding: EdgeInsets.only(
                                            left: 20, top: 0)),
                                  ),
                                ),
                              ]
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
                      Text(userlogin.toString(),style: TextStyle(color: Colors.white),),
                      ElevatedButton(style:ElevatedButton.styleFrom( primary: Color(0xFF8E0E14) ),
                        onPressed: () {
                        if (formKey.currentState.validate()) {
                          createUpdateState(
                              _firstname.text,
                              _lastname.text,
                              _email.text,
                              phone,
                              _displayname.text,
                              //userResponse.data['display_name'],
                              //userResponse.id,
                              id,
                              userlogin,
                              //userResponse.data['user_login'],
                              //userResponse.data['user_nicename'],
                              _nicke.text,
                              context)
                              .whenComplete(() {
                            setState(() {
                              loader = false;
                            });
                          });
                          setState(() {
                            loader = true;
                          });
                          ;
                        }

                        },
                        child: Text('Update',style: TextStyle(fontSize: 16),),
                      ),
                    ],
                  ),*/
                  if(loader)Center(child: CircularProgressIndicator(),)
                ],
              ),
            ),

          ),
            Positioned(
              top: AppBar().preferredSize.height*0.2,
              left: width * 0.39865,
              child: SizedBox(
                height: height * 0.12168,
                width: width * 0.21875,
                child: Image.asset(
                  'assets/soundpic.png',
                ),
              ),
            ),
          ]
      ),
    );
  }

}
