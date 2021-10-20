import 'package:sound_chat/common/index.dart';

class ChangePassword extends StatefulWidget {
  @override
  _ChangePassword createState() => _ChangePassword();
}

class _ChangePassword extends State<ChangePassword> {
  final TextEditingController _currentpassword = TextEditingController();
  final TextEditingController _newpassword = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool _isObscure = true;
  bool loader = false;
  int id;
  @override
  void initState() {
    super.initState();
    _loadSavedData();
  }

  _loadSavedData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      if (sharedPreferences.getString('email') != null &&
          sharedPreferences.getString('email').isNotEmpty) {
        id = sharedPreferences.getInt('id');
      }
    });
  }

  InputBorder border = OutlineInputBorder(
    borderSide: const BorderSide(color: Color(0xFFA6B3BC), width: 2.0),
    borderRadius: BorderRadius.circular(30.0),
  );
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
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: TextFormField(
                        style: TextStyle(
                            color: Colors.white, fontFamily: fontfamily),
                        controller: _currentpassword,
                        obscureText: _isObscure,
                        validator:
                            Validators.required('currentpassword is required'),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(10),
                          border: border,
                          enabledBorder: border,
                          focusedBorder: border,
                          errorStyle: TextStyle(height: 0.5),
                          prefixIcon: Icon(
                            Icons.lock,
                            size: 28,
                            color: Color(0xFFA6B3BC),
                          ),
                          hintText: 'Enter current password',
                          hintStyle: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: TextFormField(
                        style: TextStyle(
                            color: Colors.white, fontFamily: fontfamily),
                        controller: _newpassword,
                        obscureText: _isObscure,
                        validator:
                            Validators.required('newpassword is required'),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(10),
                          border: border,
                          enabledBorder: border,
                          focusedBorder: border,
                          errorStyle: TextStyle(height: 0.5),
                          prefixIcon: Icon(
                            Icons.lock,
                            size: 28,
                            color: Color(0xFFA6B3BC),
                          ),
                          hintText: 'Enter new password',
                          hintStyle: TextStyle(color: Colors.white),
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
                              createChangepasswrdState(
                                      id,
                                      _currentpassword.text,
                                      _newpassword.text,
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
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 40, vertical: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(color: Colors.white)),
                            child: Center(
                                child: Text(
                              'Change',
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
                    //           "assets/backbutton.png",color: Color(0xFF66BA5F),
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
