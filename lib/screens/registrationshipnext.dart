import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:sound_chat/common/index.dart';

class Registrationshipnext extends StatefulWidget {
  final lid,user,firtname,lastname,email,phone,country;
  Registrationshipnext(this.lid,this.user,this.firtname,this.lastname,this.email,this.phone,this.country);
  @override
  _SignupnextPageState createState() => _SignupnextPageState();
}

class _SignupnextPageState extends State<Registrationshipnext> {
  bool value=false;

  @override
  void initState() {
    // SystemChrome.setEnabledSystemUIOverlays([]);
    super.initState();
  }

  //Future<SignUpResponse> _futureJwt;
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _coupon = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool _isObscure = true;
  bool loader=false;
// File _image;
// final picker = ImagePicker();
//
// Future getImage() async {
//   final pickedFile = await picker.getImage(source: ImageSource.gallery);
//
//   setState(() {
//     if (pickedFile != null) {
//       _image = File(pickedFile.path);
//       print(_image);
//     } else {
//       print('No image selected.');
//     }
//   });
// }
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

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Stack(
          children:[
            Scaffold(
            backgroundColor: Colors.black,
            // appBar: AppBar(
            //   backgroundColor: Color(0xFFE18D13),
            //   //title: Text("Flutter Http Example"),
            // ),
            appBar: AppBar(
              backgroundColor: Colors.black,
            ),
            body:Form(key: formKey,
              child: ListView(
                children: [
                  // SizedBox(height: 10,),
                  // Image.asset(
                  //   "assets/soundpic.png",
                  //   width: width * 0.316,
                  //   height: height * 0.1902,
                  // ),
                 // Center(child: Text("Member Registration",style: TextStyle(fontSize: 19,color: Color(0xFFE18D13),fontWeight: FontWeight.bold),)),
                  SizedBox(height: 40,),
                  Center(child: Text("Complete all fields below to create your account",textAlign: TextAlign.center,style: TextStyle(fontSize: 16,color: Color(0xFFA79A9A)),)),
                  SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text("Login Details",style: TextStyle(fontSize: 16,color: Colors.white),),
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
                        labelText: "Username",
                        labelStyle: TextStyle(
                          color:Color(0xFFA79A9A),
                        ),
                        fillColor: Colors.white,
                        focusedBorder:OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white, width: 2.0),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        hintText: 'Username:',hintStyle: TextStyle(color: Color(0xFFA79A9A)),
                        suffixIcon: Icon(Icons.account_circle,color: Color(0xFFA79A9A),),

                      ),
                      controller: _username,
                      validator: Validators.required(
                          'Username is required'),
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
                        labelText: "Password",
                        labelStyle: TextStyle(
                          color:Color(0xFFA79A9A),
                        ),
                        fillColor: Colors.white,
                        focusedBorder:OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white, width: 2.0),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        hintText: 'Password:',hintStyle: TextStyle(color: Color(0xFFA79A9A)),
                        suffixIcon: Icon(Icons.lock_outline,color: Color(0xFFA79A9A),),

                      ),
                      obscureText: _isObscure,
                      controller: _password,
                      validator: Validators.required(
                          'password is required'),
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
                        labelText: "Confirm Password",
                        labelStyle: TextStyle(
                          color:Color(0xFFA79A9A),
                        ),
                        fillColor: Colors.white,
                        focusedBorder:OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white, width: 2.0),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        hintText: 'Confirm Password:',hintStyle: TextStyle(color: Color(0xFFA79A9A)),
                        suffixIcon: Icon(Icons.lock_outline,color: Color(0xFFA79A9A),),

                      ),
                      obscureText: _isObscure,
                      validator: Validators.required(
                          'Confirm password is required'),
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
                        labelText: "Coupon Code",
                        labelStyle: TextStyle(
                          color:Color(0xFFA79A9A),
                        ),
                        fillColor: Colors.white,
                        focusedBorder:OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white, width: 2.0),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        hintText: 'Coupon Code:',hintStyle: TextStyle(color: Color(0xFFA79A9A)),
                        suffixIcon: Icon(Icons.card_giftcard,color: Color(0xFFA79A9A),),

                      ),
                      controller: _coupon,
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Theme(
                        child: Checkbox(value: value,
                            onChanged: (value1){
                              setState(() {
                                value=!value;
                              });
                            }),
                        data: ThemeData(
                          primarySwatch: Colors.blue,
                          unselectedWidgetColor: Color(0xFF8E0E14), // Your color
                        ),
                      ),
                      Text("Accept our terms & Conditions",style: TextStyle(fontSize: 15,color: Colors.white),)
                    ],
                  ),
                  SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 80),
                    child: SizedBox(height: 50,
                      child: ElevatedButton(
                        style:ElevatedButton.styleFrom( primary: Color(0xFF8E0E14),
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0),
                          )
                      ),
                        onPressed: () {
                          if (formKey.currentState.validate())
                          {
                            setState(() {
                              loader=true;
                            });
                            createSignUpState(widget.user,widget.lid,
                                _username.text, widget.email,widget.firtname,widget.lastname,_password.text,widget.phone,widget.country,_coupon.text,_image, context).whenComplete(() {
                              setState(() {
                                loader=false;
                              });
                              // Navigator.of(context).push(
                              //     MaterialPageRoute(
                              //         builder: (context) =>
                              //         (widget.user['payment_type']=='payment')?PaymentDetailsMember(widget.user,widget.lid):DesignLogin()));
                            });
                          }
                          // Navigator.of(context).push(
                          //     MaterialPageRoute(
                          //         builder: (context) =>
                          //         (widget.user['payment_type']=='payment')?PaymentDetailsMember(widget.user,widget.lid):DesignLogin()));
                        },
                        child: Text('Continue',style: TextStyle(fontSize: 16),),
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),



                  /* Column(
                    children: [
                      SizedBox(height: 30,),
                      Text("Member Registration",style: TextStyle(fontSize: 19,color: Colors.white),),
                      SizedBox(height: 10,),
                      Text("Complete all fields below to create your account:",style: TextStyle(fontSize: 16,color: Colors.white),),
                      SizedBox(height: 10,),
                      Text("Login Details",style: TextStyle(fontSize: 19,color: Colors.white),),
                      SizedBox(height: 10,),
                      Form(
                        key: formKey,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Column(
                            children: [
                          Container(color: Color(0xFF464646),
                            child: Center(
                              child: TextFormField(style: TextStyle(color: Colors.white),
                                controller: _username,
                                validator: Validators.required(
                                    'Username is required'),
                                decoration: InputDecoration(errorStyle: TextStyle(height: 0.5),
                                    hintText: 'Username:',
                                    contentPadding: EdgeInsets.only(
                                        left: 20, top: 0)),
                              ),
                            ),
                          ),
                          SizedBox(height: 10,),
                          Container(color: Color(0xFF464646),
                            child: Center(
                              child: TextFormField(style: TextStyle(color: Colors.white),
                                controller: _password,
                                obscureText: _isObscure,
                                validator: Validators.required(
                                    'Password is required'),
                                decoration: InputDecoration(errorStyle: TextStyle(height: 0.5),
                                    hintText: 'Password:',
                                    contentPadding: EdgeInsets.only(
                                        left: 20, top: 0)),
                              ),
                            ),
                          ),
                          SizedBox(height: 10,),
                          Container(color: Color(0xFF464646),
                            child: Center(
                              child: TextFormField(style: TextStyle(color: Colors.white),
                                obscureText: _isObscure,
                                validator: Validators.required(
                                    'Confirm Password is required'),
                                decoration: InputDecoration(errorStyle: TextStyle(height: 0.5),
                                    hintText: 'Confirm Password:',
                                    contentPadding: EdgeInsets.only(
                                        left: 20, top: 0)),
                              ),
                            ),
                          ),
                            SizedBox(height: 10,),
                            Container(color: Color(0xFF464646),
                              child: Center(
                                child: TextFormField(style: TextStyle(color: Colors.white),
                                  controller: _coupon,
                                  decoration: InputDecoration(errorStyle: TextStyle(height: 0.5),
                                      hintText: 'Coupon:',
                                      contentPadding: EdgeInsets.only(
                                          left: 20, top: 0)),
                                ),
                              ),
                            ),
                          SizedBox(height: 10,),
                          CircleAvatar(radius: 50,backgroundColor: Colors.green,
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
                          ElevatedButton(style:ElevatedButton.styleFrom( primary: Color(0xFFF3813A) ),
                            onPressed: () {
                              getImage();
                            },
                            child: Text('Upload profile photo',style: TextStyle(fontSize: 16),),
                          ),
                          ],),
                        ),
                      ),
                      Row(mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Theme(
                            child: Checkbox(value: value,
                                onChanged: (value1){
                              setState(() {
                                value=!value;
                              });
                            }),
                            data: ThemeData(
                              primarySwatch: Colors.blue,
                              unselectedWidgetColor: Color(0xFF8E0E14), // Your color
                            ),
                          ),
                          Text("Accept our terms & Conditions",style: TextStyle(fontSize: 15,color: Colors.white),)
                        ],
                      ),
                      ElevatedButton(style:ElevatedButton.styleFrom( primary: Color(0xFF8E0E14) ),
                        onPressed: () {
                          if (formKey.currentState.validate()) {
                            createSignUpState(
                                _username.text, widget.email,widget.firtname,widget.lastname,_password.text,widget.phone,widget.country,_coupon.text,_image, context).whenComplete(() {
                              setState(() {
                                loader=false;
                              });
                              Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) =>
                                      (widget.user=='Free user')?DesignLogin():PaymentDetailsMember()));
                            });
                            setState(() {
                              loader=true;
                            });
                          }



                        },
                        child: Text('Continue',style: TextStyle(fontSize: 16),),
                      ),

                    ],
                  ),*/

                ],

              ),

            ),


          ),
            if(loader)Center(child: CircularProgressIndicator(),),
            Positioned(
              top: AppBar().preferredSize.height*0.1,
              left: width * 0.39865,
              child: SizedBox(
                height: height * 0.13168,
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
