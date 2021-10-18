import 'package:sound_chat/common/index.dart';

class DesignForgotpass extends StatefulWidget {
  @override
  _DesignForgotpass createState() => _DesignForgotpass();
}

class _DesignForgotpass extends State<DesignForgotpass> {
  final TextEditingController _name = TextEditingController();
  final formKey = GlobalKey<FormState>();
  InputBorder border = OutlineInputBorder(
    borderSide: const BorderSide(color: Color(0xFFA6B3BC), width: 2.0),
    borderRadius: BorderRadius.circular(30.0),
  );

  bool loader = false;
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
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [Color(0xFF3F535E), Color(0xFF3A432E)])),
          child: Stack(
            children: [
              Form(
                key: formKey,
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Image.asset(
                      "assets/soundpic.png",
                      width: width * 0.316,
                      height: height * 0.1902,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    /*Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: TextFormField(style: TextStyle(color: Colors.white,fontFamily: fontfamily),
                        controller: _name,
                        validator: Validators.required(
                            'MobileNumber is required'),
                        decoration: InputDecoration(
                            errorStyle: TextStyle(height: 0.5),
                            prefixIcon:  Icon(
                              Icons.phone_android,
                              color: Color(0xFFA6B3BC),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            hintText: 'MobileNumber',hintStyle: TextStyle(color: Colors.white),
                            contentPadding: EdgeInsets.only(
                                left: 20, top: 15)),
                      ),
                    ),*/
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: TextFormField(
                        style: TextStyle(
                            color: Colors.white, fontFamily: fontfamily),
                        controller: _name,
                        validator: Validators.required('MobileNo. is required'),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(10),
                          border: border,
                          enabledBorder: border,
                          focusedBorder: border,
                          fillColor: Colors.white,
                          prefixIcon: Icon(
                            Icons.phone_android,
                            color: Color(0xFFA6B3BC),
                          ),
                          hintText: 'MobileNumber',
                          hintStyle: TextStyle(
                              color: Colors.white, fontFamily: fontfamily),
                        ),
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
                              createForgotResponse(_name.text, context)
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
                              'Reset Password',
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
                      height: 40,
                    ),
                    // GestureDetector(
                    //     onTap: () {
                    //       Navigator.of(context).pop();
                    //     },
                    //     child: SizedBox(
                    //         height: 60,
                    //         width: 60,
                    //         child: Image.asset(
                    //           "assets/backbutton.png",
                    //           color: Colors.white,
                    //           fit: BoxFit.fill,
                    //         ))),
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
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
