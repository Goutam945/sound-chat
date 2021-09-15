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
  InputBorder border = OutlineInputBorder(
    borderSide: const BorderSide(color: Color(0xFFA6B3BC), width: 2.0),
    borderRadius: BorderRadius.circular(30.0),
  );
  bool _isObscure = true;
  bool loader=false;
  File _image; //variable for choosed file

  final ImagePicker picker = ImagePicker();
  Future<void> getImage() async {
    final XFile image = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = File(image.path);
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
            appBar: AppBar(
              backgroundColor: Color(0xFF3F535E),
            ),
            body:Container( decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [Color(0xFF3F535E), Color(0xFF3A432E)])),
              child: Form(key: formKey,
                child: ListView(
                  children: [
                    SizedBox(height: 40,),
                    Center(child: Text("Complete all fields below to create your account",
                      textAlign: TextAlign.center,style: TextStyle(fontSize: 14,color: Colors.white),)),
                    SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text("Login Details",style: TextStyle(fontSize: 16,color: Colors.white),),
                    ),
                    SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: TextFormField(style: TextStyle(color: Colors.white, fontFamily: fontfamily),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(10),
                          border: border,
                          enabledBorder: border,
                          focusedBorder: border,
                          labelText: "Username",
                          labelStyle: TextStyle(
                            color:Colors.white,
                          ),
                          fillColor: Colors.white,
                          hintText: 'Username:',hintStyle: TextStyle(color: Colors.white),
                          prefixIcon: Icon(Icons.account_circle,color: Color(0xFFA6B3BC),),

                        ),
                        controller: _username,
                        validator: Validators.required(
                            'Username is required'),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: TextFormField(style: TextStyle(color: Colors.white, fontFamily: fontfamily),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(10),
                          border: border,
                          enabledBorder: border,
                          focusedBorder: border,
                          labelText: "Password",
                          labelStyle: TextStyle(
                            color:Colors.white,
                          ),
                          fillColor: Colors.white,
                          hintText: 'Password:',hintStyle: TextStyle(color: Colors.white),
                          prefixIcon: Icon(Icons.lock_outline,color: Color(0xFFA6B3BC),),
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
                      child: TextFormField(style: TextStyle(color: Colors.white, fontFamily: fontfamily),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(10),
                          border: border,
                          enabledBorder: border,
                          focusedBorder: border,
                          labelText: "Confirm Password",
                          labelStyle: TextStyle(
                            color:Colors.white,
                          ),
                          fillColor: Colors.white,
                          hintText: 'Confirm Password:',hintStyle: TextStyle(color: Colors.white),
                          prefixIcon: Icon(Icons.lock_outline,color: Color(0xFFA6B3BC),),

                        ),
                        obscureText: _isObscure,
                        validator: Validators.required(
                            'Confirm password is required'),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: TextFormField(style: TextStyle(color: Colors.white, fontFamily: fontfamily),
                        decoration:  InputDecoration(
                          contentPadding: EdgeInsets.all(10),
                          border: border,
                          enabledBorder: border,
                          focusedBorder: border,
                          labelText: "Coupon Code",
                          labelStyle: TextStyle(
                            color:Colors.white,
                          ),
                          fillColor: Colors.white,
                          hintText: 'Coupon Code:',hintStyle: TextStyle(color: Colors.white),
                          prefixIcon: Icon(Icons.card_giftcard,color: Color(0xFFA6B3BC),),

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
                  /*  Padding(
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
                    ),*/
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            if (formKey.currentState.validate())
                            {
                              setState(() {
                                loader=true;
                              });
                              createSignUpState(widget.user,widget.lid,
                                  _username.text, widget.email,widget.firtname,widget.lastname,_password.text,widget.phone,widget.country,_coupon.text,base64Encode(File(_image.path).readAsBytesSync()), context).whenComplete(() {
                                setState(() {
                                  loader=false;
                                });
                                // Navigator.of(context).push(
                                //     MaterialPageRoute(
                                //         builder: (context) =>
                                //         (widget.user['payment_type']=='payment')?PaymentDetailsMember(widget.user,widget.lid):DesignLogin()));
                              });
                            }
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 40,vertical: 10),
                            decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius
                                    .circular(
                                    30),
                                border: Border.all(
                                    color: Colors
                                        .white)),
                            child: Center(child: Text('Continue',textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),)),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 20,),


                  ],

                ),

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
