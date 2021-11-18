import 'dart:io';

import 'package:sound_chat/api/advertiesment_request.dart';
import 'package:sound_chat/common/index.dart';

class AdvertisesmentSoundchat extends StatefulWidget {
  const AdvertisesmentSoundchat({Key key}) : super(key: key);

  @override
  _AdvertisesmentSoundchatState createState() =>
      _AdvertisesmentSoundchatState();
}

class _AdvertisesmentSoundchatState extends State<AdvertisesmentSoundchat> {
  @override
  void initState() {
    super.initState();
  }

  bool loader = false;
  final formKey = GlobalKey<FormState>();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _subject = TextEditingController();
  final TextEditingController _message = TextEditingController();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _contact = TextEditingController();

  // File _file;
  XFile _pickedImage;
  final ImagePicker _picker = ImagePicker();
  OutlineInputBorder textFieldBorder = OutlineInputBorder(
    borderSide: const BorderSide(color: Colors.white, width: 1.0),
    borderRadius: BorderRadius.circular(25.0),
  );

  Future getFile() async {
    final XFile image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _pickedImage = image;
      });
    } else {
      print("user cancelled the picker");
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Scaffold(
          backgroundColor: Color(0xFF481621),
          extendBody: true,
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
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                padding: EdgeInsets.only(bottom: 40, top: 25),
                children: [
                  Center(
                      child: Text(
                    "Advertise With  SoundChat",
                    style: TextStyle(
                        fontSize: 19,
                        fontFamily: fontfamily,
                        color: Color(0xFFE18D13),
                        fontWeight: FontWeight.w500),
                  )),
                  SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextFormField(
                      style: TextStyle(
                          color: Colors.white, fontFamily: fontfamily),
                      decoration: InputDecoration(
                        enabledBorder: textFieldBorder,
                        errorBorder: textFieldBorder,
                        disabledBorder: textFieldBorder,
                        focusedErrorBorder: textFieldBorder,
                        labelText: "Name",
                        labelStyle: TextStyle(
                          color: Colors.white,
                        ),
                        fillColor: Colors.white,
                        focusedBorder: textFieldBorder,
                        hintText: 'Enter your Name',
                        hintStyle: TextStyle(color: Colors.white),
                        //suffixIcon: Icon(Icons.account_circle,color: Colors.white,),
                      ),
                      controller: _name,
                      validator: (value) {
                        if (value.trim().isEmpty) {
                          return "Name is empty";
                        } else
                          return null;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextFormField(
                      keyboardType: TextInputType.phone,
                      style: TextStyle(
                          color: Colors.white, fontFamily: fontfamily),
                      decoration: InputDecoration(
                        enabledBorder: textFieldBorder,
                        errorBorder: textFieldBorder,
                        disabledBorder: textFieldBorder,
                        focusedErrorBorder: textFieldBorder,
                        labelText: "Contact No",
                        labelStyle: TextStyle(
                          color: Colors.white,
                        ),
                        fillColor: Colors.white,
                        focusedBorder: textFieldBorder,
                        hintText: 'Enter your Contact No',
                        hintStyle: TextStyle(color: Colors.white),
                        //suffixIcon: Icon(Icons.account_circle,color: Colors.white,),
                      ),
                      controller: _contact,
                      validator: (value) {
                        if (value.trim().isEmpty) {
                          return "Contact Number is empty";
                        }
                        // if (!validatePhone(value)) {
                        //   return 'Please enter a valid number';
                        // }
                        else
                          return null;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      style: TextStyle(
                          color: Colors.white, fontFamily: fontfamily),
                      decoration: InputDecoration(
                        enabledBorder: textFieldBorder,
                        errorBorder: textFieldBorder,
                        disabledBorder: textFieldBorder,
                        focusedErrorBorder: textFieldBorder,
                        labelText: "Email",
                        labelStyle: TextStyle(
                          color: Colors.white,
                        ),
                        fillColor: Colors.white,
                        focusedBorder: textFieldBorder,
                        hintText: 'Enter your Email',
                        hintStyle: TextStyle(color: Colors.white),
                        //suffixIcon: Icon(Icons.alternate_email_outlined,color: Colors.white,),
                      ),
                      controller: _email,
                      validator: (value) {
                        if (value.trim().isEmpty) {
                          return "Email is empty";
                        }
                        if (!validateEmail(value)) {
                          return 'Please Enter a valid Email ID';
                        } else
                          return null;
                      },
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
                        enabledBorder: textFieldBorder,
                        errorBorder: textFieldBorder,
                        disabledBorder: textFieldBorder,
                        focusedErrorBorder: textFieldBorder,
                        labelText: "Subject",
                        labelStyle: TextStyle(
                          color: Colors.white,
                        ),
                        fillColor: Colors.white,
                        focusedBorder: textFieldBorder,
                        hintText: 'Enter Subject',
                        hintStyle: TextStyle(color: Colors.white),
                        //suffixIcon: Icon(Icons.message,color: Colors.white,),
                      ),
                      controller: _subject,
                      validator: (value) {
                        if (value.trim().isEmpty) {
                          return "Subject is empty";
                        } else
                          return null;
                      },
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
                        enabledBorder: textFieldBorder,
                        errorBorder: textFieldBorder,
                        disabledBorder: textFieldBorder,
                        focusedErrorBorder: textFieldBorder,
                        labelText: "Message",
                        labelStyle: TextStyle(
                          color: Colors.white,
                        ),
                        fillColor: Colors.white,
                        focusedBorder: textFieldBorder,
                        hintText: 'Type Message',
                        hintStyle: TextStyle(color: Colors.white),
                        //suffixIcon: Icon(Icons.message,color: Colors.white,),
                      ),
                      maxLines: 5,
                      controller: _message,
                      validator: (value) {
                        if (value.trim().isEmpty) {
                          return "Message is empty";
                        } else
                          return null;
                      },
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
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: Colors.white)),
                      child: Center(
                          child: Text(
                        "Attach files",
                        style: TextStyle(
                            color: Colors.white, fontFamily: fontfamily),
                      )),
                    ),
                  ),
                  Center(
                      child: Text(
                    // _file != null ? _file.path : 'select file',
                    _pickedImage != null ? _pickedImage.name : 'select file',
                    style:
                        TextStyle(color: Colors.blue, fontFamily: fontfamily),
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
                            setState(() {
                              loader = true;
                            });
                            createAdvertisementState(
                                    _email.text,
                                    _subject.text,
                                    _message.text,
                                    _name.text,
                                    (_pickedImage != null)
                                        ? File(_pickedImage.path)
                                        : null,
                                    _contact.text,
                                    context)
                                .whenComplete(() {
                              setState(() {
                                loader = false;
                              });
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
        if (loader)
          Center(
            child: CircularProgressIndicator(),
          ),
        Positioned(
          top: AppBar().preferredSize.height * 0.5,
          left: width * 0.39865,
          child: SizedBox(
            height: height * 0.10168,
            width: width * 0.20275,
            child: Image.asset(
              'assets/soundpic.png',
            ),
          ),
        ),
      ],
    );
  }
}
