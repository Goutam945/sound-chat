import 'package:sound_chat/common/index.dart';
class DesignSignup extends StatefulWidget {
  @override
  _DesignSignup createState() => _DesignSignup();
}
//SharedPreferences localStorage;
class _DesignSignup extends State<DesignSignup> {
  @override
  void initState() {
    super.initState();
  }
  final formKey = GlobalKey<FormState>();
  bool _isObscure = true;
  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  bool loader=false;
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
                  height: height * 0.04389,
                ),
                Container(
                  color: Color(0xFFC6B393),
                  child: Row(
                    children: [
                      Container(padding: EdgeInsets.only(bottom: 0),
                        color: Colors.black,
                        height: height * 0.3128,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [


                            Image.asset(
                              'assets/u.gif',
                              color: Color(0xFF6A6B6D),
                              scale: 2.2,
                            ),
                            SizedBox(height: height*0.0292,),

                            //Image.asset('assets/pass.gif',color: Color(0xFF6A6B6D),scale: 1.6,),
                            Icon(
                              Icons.email,
                              color: Color(0xFF6A6B6D),
                              size: 28,
                            ),
                            SizedBox(height: height*0.0292,),
                            Icon(
                              Icons.lock,
                              color: Color(0xFF6A6B6D),
                              size: 28,
                            ),
                            //SizedBox(height: height*0.0073,)
                          ],
                        ),
                      ),
                      Form(
                        key: formKey,
                        child: Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                color: Color(0xFFDBCBB1),
                                margin: EdgeInsets.only(top: 5),
                                child: Row(
                                  children: [
                                    Expanded(
                                        flex: 2,
                                        child: TextFormField(
                                          controller: _name,
                                          validator: Validators.required(
                                              'Name is required'),
                                          decoration: InputDecoration(errorStyle: TextStyle(height: 0.5),
                                              hintText: 'USERNAME',
                                              contentPadding: EdgeInsets.only(
                                                  left: 20, top: 0)),
                                        )),
                                  ],
                                ),
                              ),
                              Container(
                                color: Color(0xFFDBCBB1),
                                margin: EdgeInsets.only(top: 0),
                                child: Row(
                                  children: [
                                    Expanded(
                                        flex: 2,
                                        child: TextFormField(
                                          controller: _email,
                                          validator: Validators.required(
                                              'Email is required'),
                                          decoration: InputDecoration(errorStyle: TextStyle(height: 0.5),
                                              hintText: 'EMAIL',
                                              contentPadding: EdgeInsets.only(
                                                  left: 20, top: 0)),
                                        )),
                                  ],
                                ),
                              ),
                              Container(
                                color: Color(0xFFDBCBB1),
                                child: Row(
                                  children: [
                                    Expanded(
                                        flex: 2,
                                        child: TextFormField(
                                          controller: _password,
                                          obscureText: _isObscure,
                                          validator: Validators.compose([
                                            Validators.required(
                                                'Password is required'),
                                            Validators.patternString(
                                                r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$',
                                                'Invalid Password')
                                          ]),
                                          decoration: InputDecoration(errorStyle: TextStyle(height: 0.5),
                                            hintText: 'PASSWORD',
                                            contentPadding:
                                            EdgeInsets.only(left: 20, top: 0),
                                            // suffixIcon: GestureDetector(
                                            // child: Icon(_isObscure ? Icons.visibility_off : Icons.visibility),
                                            //  onTap: () {setState(() {
                                            //  _isObscure = !_isObscure;
                                            //  });
                                            // })
                                          ),
                                        )),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // if (formKey.currentState.validate()) {
                    //   createSignUpState(
                    //       _name.text, _email.text, _password.text, context).whenComplete(() {
                    //     setState(() {
                    //       loader=false;
                    //     });
                    //   });
                    //   setState(() {
                    //     loader=true;
                    //   });
                    // }
                    },
                  child: Container(
                      decoration: BoxDecoration(color: Color(0xFF0A660F),
                          // BoxShape.circle or BoxShape.retangle
                          //color: const Color(0xFF66BB6A),
                          boxShadow: [
                            BoxShadow(offset: Offset(0.0,5.0),
                              color: Color(0xFF9BB472),
                              blurRadius: 10.0,
                            ),
                          ]),
                      height: height * 0.0512,

                      padding: EdgeInsets.only(top: 5),
                      child: Text(
                        "Sign Up",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      )),
                ),
                SizedBox(
                  height: height * 0.0385,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      " Have an account? ",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                      textAlign: TextAlign.center,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => DesignLogin()));
                      },
                      child: Column(
                        children: [
                          Text(
                            "LOGIN NOW",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                            textAlign: TextAlign.center,
                          ),
                          Container(
                            height: height * 0.0008,
                            width: 100,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                // Container(margin: EdgeInsets.only(right: width*0.1215,left: width*0.559),
                //     child: Divider(color: Colors.white,thickness: 2,)),

                SizedBox(
                  height: height * 0.0219,
                ),
                Text(
                  "Become a patron today for only \$4.99 per month \n and get exclusive access to interviews with your \n favourate  artiste and past show missed",
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontStyle: FontStyle.italic),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: height * 0.0219,
                ),

                Container(
                  height: height * 0.0585,
                  color: Color(0xFFBB3514),
                  margin: EdgeInsets.only(
                      right: width * 0.24305, left: width * 0.24305),
                  child: Row(
                    children: [
                      IconButton( onPressed: (){},
                        icon: Image.asset(
                          'assets/gp.gif',
                          color: Colors.white,
                        ),
                      ),
                      Text("Sign in with Google",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                          ))
                    ],
                  ),
                ),

                SizedBox(
                  height: height * 0.02189,
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
            ),  if(loader)Center(child: CircularProgressIndicator(),)
          ],
        ),
      ),
    );
  }
}
