import 'package:sound_chat/common/index.dart';
import 'DesignUpdate.dart';

class DesignForgotpass extends StatefulWidget {
  @override
  _DesignForgotpass createState() => _DesignForgotpass();
}
class _DesignForgotpass extends State<DesignForgotpass> {
  final TextEditingController _name = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool _isObscure = true;
  bool loader=false;
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
       /* body: Stack(
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
                  height: 20,
                ),
                Form(
                  key: formKey,
                  child: Container(
                    height: MediaQuery.of(context).size.height/2,
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.only(top: 62),
                    child: Column(
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width/1.2,
                          height: 45,
                          padding: EdgeInsets.only(
                              top: 4,left: 16, right: 16, bottom: 4
                          ),
                          // decoration: BoxDecoration(
                          //     borderRadius: BorderRadius.all(
                          //         Radius.circular(10)
                          //     ),
                          //     color: Colors.white,
                          //     boxShadow: [
                          //       BoxShadow(
                          //           color:  Color(0xFF0A660F),
                          //           blurRadius: 5
                          //       )
                          //     ]
                          // ),
                          child: TextFormField(controller: _name,
                            validator: Validators.required(
                                'Name is required'),
                            decoration: InputDecoration(
                              //border: InputBorder.none,
                              hintText: 'Username',
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        InkWell(
                          onTap: (){
                            if (formKey.currentState.validate()) {
                              createForgotResponse(_name.text, context).whenComplete(() {
                                setState(() {
                                  loader=false;
                                });
                              });
                              setState(() {
                                loader=true;
                              });
                            }
                          },
                          child: Container(
                            height: 45,
                            width: MediaQuery.of(context).size.width/1.2,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Color(0xFF0A660F),
                                    Color(0xFF0A660F),
                                  ],
                                ),
                                borderRadius: BorderRadius.all(
                                    Radius.circular(10)
                                )
                            ),
                            child: Center(
                              child: Text('Forgot password'.toUpperCase(),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ),

                          ),
                        ),
                      ],
                    ),
                  ),
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
            ),if(loader)Center(child: CircularProgressIndicator(),)
          ],
        ),*/
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
              child: Column(
                children: [
                  SizedBox(height: 10,),
                  Image.asset(
                    "assets/soundpic.png",
                    width: width * 0.316,
                    height: height * 0.1902,
                  ),
//                  SizedBox(height: 95,),
//                  Container(
//                    height: height * 0.0585,
//                    child: Row(
//                      mainAxisAlignment: MainAxisAlignment.center,
//                      children: [
//                        Text(
//                          "SOUNDCHAT RADIO",
//                          style: TextStyle(color: Colors.white, fontSize: 36),
//                          textAlign: TextAlign.center,
//                        )
//                      ],
//                    ),
//                  ),
                  SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: TextFormField(style: TextStyle(color: Color(0xFFA79A9A)),
                      controller: _name,
                      validator: Validators.required(
                          'MobileNumber is required'),
                      decoration: InputDecoration(
                          errorStyle: TextStyle(height: 0.5),
                          prefixIcon:  Image.asset(
                            'assets/u.gif',
                            color: Color(0xFF6A6B6D),
                            scale: 2.2,
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          hintText: 'MobileNumber',hintStyle: TextStyle(color: Color(0xFFA79A9A)),
                          contentPadding: EdgeInsets.only(
                              left: 20, top: 15)),
                    ),
                  ),
                  SizedBox(height: 30,),
                  Container(height: 60,width: width,
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: ElevatedButton(style:ElevatedButton.styleFrom( primary: Colors.orange,
//                      shape: new RoundedRectangleBorder(
//                    borderRadius: new BorderRadius.circular(30.0),)
                    ),
                      onPressed: () {
                        if (formKey.currentState.validate()) {
                          createForgotResponse(_name.text, context).whenComplete(() {
                            setState(() {
                              loader=false;
                            });
                          });
                          setState(() {
                            loader=true;
                          });
                        }
                      },
                      child: Text('Reset Password',style: TextStyle(fontSize: 20),),
                    ),
                  ),
                  SizedBox(height: 40,),
                  GestureDetector(
                      onTap: () {
                    Navigator.of(context).pop();
                  },
                 child: SizedBox(
                      height: 60,
                      width: 60,
                      child: Image.asset(
                        "assets/backbutton.png",color: Color(0xFF66BA5F),
                        fit: BoxFit.fill,
                      ))),
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
