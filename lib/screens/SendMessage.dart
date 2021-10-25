import 'dart:io';
import 'package:sound_chat/common/index.dart';

class SendMessage extends StatefulWidget {
  @override
  _SendMessageState createState() => _SendMessageState();
}

class _SendMessageState extends State<SendMessage> {
  @override
  void initState() {
    // SystemChrome.setEnabledSystemUIOverlays([]);
    super.initState();
  }

  bool loader = false;
  final formKey = GlobalKey<FormState>();
  //Future<SignUpResponse> _futureJwt;
  final TextEditingController _email = TextEditingController();
  final TextEditingController _subject = TextEditingController();
  final TextEditingController _message = TextEditingController();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _mobile = TextEditingController();
  InputBorder border = OutlineInputBorder(
    borderSide: const BorderSide(color: Color(0xFFA6B3BC), width: 2.0),
    borderRadius: BorderRadius.circular(30.0),
  );

  File _file;
  Future getFile() async {
    FilePickerResult result = await FilePicker.platform.pickFiles();

    if (result != null) {
      File file = File(result.files.single.path);
      setState(() {
        _file = file;
      });
    } else {
      // User canceled the picker
    }
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
            appBar: PreferredSize(
                preferredSize: Size.fromHeight(55), child: Backappbar()),
            body: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                    Color(0xFF3F535E),
                    Color(0xFF3A432E),
                    //Color(0xFF0E0D13)
                  ])),
              child: Form(
                key: formKey,
                child: ListView(
                  children: [
                    SizedBox(
                      height: 40,
                    ),
                    Center(
                        child: Text(
                      "Send Mesasage",
                      style: TextStyle(
                          fontSize: 18,
                          color: Color(0xFFE18D13),
                          fontWeight: FontWeight.bold),
                    )),
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                        child: Text(
                      "What issue(s) are your experiencing?",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 12, color: Colors.white),
                    )),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: TextFormField(
                        style: TextStyle(
                            color: Colors.white, fontFamily: fontfamily),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(10),
                          border: border,
                          enabledBorder: border,
                          focusedBorder: border,
                          labelText: "Email",
                          labelStyle: TextStyle(
                            color: Colors.white,
                          ),
                          fillColor: Colors.white,
                          hintText: 'Email:',
                          hintStyle: TextStyle(color: Colors.white),
                          //suffixIcon: Icon(Icons.alternate_email_outlined,color: Color(0xFFA79A9A),),
                        ),
                        controller: _email,
                        validator: Validators.required('Email is required'),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: TextFormField(
                        style: TextStyle(
                            color: Colors.white, fontFamily: fontfamily),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(10),
                          border: border,
                          enabledBorder: border,
                          focusedBorder: border,
                          labelText: "Subject",
                          labelStyle: TextStyle(
                            color: Colors.white,
                          ),
                          fillColor: Colors.white,
                          hintText: 'Suject:',
                          hintStyle: TextStyle(color: Colors.white),
                          //suffixIcon: Icon(Icons.message,color: Color(0xFFA79A9A),),
                        ),
                        controller: _subject,
                        validator: Validators.required('Subject is required'),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: TextFormField(
                        style: TextStyle(
                            color: Colors.white, fontFamily: fontfamily),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(10),
                          border: border,
                          enabledBorder: border,
                          focusedBorder: border,
                          labelText: "Message",
                          labelStyle: TextStyle(
                            color: Colors.white,
                          ),
                          fillColor: Colors.white,
                          hintText: 'Message:',
                          hintStyle: TextStyle(color: Colors.white),
                          //suffixIcon: Icon(Icons.message,color: Color(0xFFA79A9A),),
                        ),
                        maxLines: 5,
                        controller: _message,
                        validator: Validators.required('message is required'),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: TextFormField(
                        style: TextStyle(
                            color: Colors.white, fontFamily: fontfamily),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(10),
                          border: border,
                          enabledBorder: border,
                          focusedBorder: border,
                          labelText: "Name",
                          labelStyle: TextStyle(
                            color: Colors.white,
                          ),
                          fillColor: Colors.white,
                          hintText: 'Name:',
                          hintStyle: TextStyle(color: Colors.white),
                          //suffixIcon: Icon(Icons.account_circle,color: Color(0xFFA79A9A),),
                        ),
                        controller: _name,
                        validator: Validators.required('Name is required'),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: TextFormField(
                        style: TextStyle(
                            color: Colors.white, fontFamily: fontfamily),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(10),
                          border: border,
                          enabledBorder: border,
                          focusedBorder: border,
                          labelText: "Mobile number",
                          labelStyle: TextStyle(
                            color: Colors.white,
                          ),
                          fillColor: Colors.white,
                          hintText: 'Mobile number:',
                          hintStyle: TextStyle(color: Colors.white),
                          //suffixIcon: Icon(Icons.account_circle,color: Color(0xFFA79A9A),),
                        ),
                        controller: _mobile,
                        validator:
                            Validators.required('Mobile number is required'),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        getFile();
                      },
                      child: Container(
                        height: 30,
                        margin: EdgeInsets.only(left: 15, right: 15),
                        decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(color: Colors.white)),
                        child: Center(
                            child: Text(
                          "Attach files",
                          style: TextStyle(color: Colors.white),
                        )),
                      ),
                    ),
                    Center(
                        child: Text(
                      _file != null ? _file.path : 'select file',
                      style: TextStyle(color: Colors.blue),
                    )),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            if (formKey.currentState.validate()) {
                              createSendmailState(
                                      _email.text,
                                      _subject.text,
                                      _message.text,
                                      _name.text,
                                      _file,
                                      _mobile.text,
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
                              'Send Now',
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
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: AppBar().preferredSize.height * 0.2,
            left: width * 0.39865,
            child: SizedBox(
              height: height * 0.12168,
              width: width * 0.21875,
              child: Image.asset(
                'assets/soundpic.png',
              ),
            ),
          ),
          if (loader)
            Center(
              child: CircularProgressIndicator(),
            )
        ],
      ),
    );
  }
}
