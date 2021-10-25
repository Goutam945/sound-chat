import 'dart:io';
import 'package:sound_chat/common/index.dart';

class ReportProblem extends StatefulWidget {
  @override
  _ReportProblemState createState() => _ReportProblemState();
}

class _ReportProblemState extends State<ReportProblem> {
  @override
  void initState() {
    // SystemChrome.setEnabledSystemUIOverlays([]);
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
    // FilePickerResult result = await FilePicker.platform.pickFiles();
    //
    // if (result != null) {
    //   File file = File(result.files.single.path);
    //   setState(() {
    //     _file = file;
    //   });
    // } else {
    //   // User canceled the picker
    // }

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
                padding: EdgeInsets.only(bottom: 120, top: 50),
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  Center(
                      child: Text(
                    "Report A Problem",
                    style: TextStyle(
                        fontSize: 19,
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
                    style: TextStyle(fontSize: 16, color: Color(0xFFA79A9A)),
                  )),
                  SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      style: TextStyle(color: Color(0xFFA79A9A)),
                      decoration: InputDecoration(
                        enabledBorder: textFieldBorder,
                        errorBorder: textFieldBorder,
                        disabledBorder: textFieldBorder,
                        focusedErrorBorder: textFieldBorder,
                        labelText: "Email",
                        labelStyle: TextStyle(
                          color: Color(0xFFA79A9A),
                        ),
                        fillColor: Colors.white,
                        focusedBorder: textFieldBorder,
                        hintText: 'Enter your Email',
                        hintStyle: TextStyle(color: Color(0xFFA79A9A)),
                        //suffixIcon: Icon(Icons.alternate_email_outlined,color: Color(0xFFA79A9A),),
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
                      style: TextStyle(color: Color(0xFFA79A9A)),
                      decoration: InputDecoration(
                        enabledBorder: textFieldBorder,
                        errorBorder: textFieldBorder,
                        disabledBorder: textFieldBorder,
                        focusedErrorBorder: textFieldBorder,
                        labelText: "Subject",
                        labelStyle: TextStyle(
                          color: Color(0xFFA79A9A),
                        ),
                        fillColor: Colors.white,
                        focusedBorder: textFieldBorder,
                        hintText: 'Suject',
                        hintStyle: TextStyle(color: Color(0xFFA79A9A)),
                        //suffixIcon: Icon(Icons.message,color: Color(0xFFA79A9A),),
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
                      style: TextStyle(color: Color(0xFFA79A9A)),
                      decoration: InputDecoration(
                        enabledBorder: textFieldBorder,
                        errorBorder: textFieldBorder,
                        disabledBorder: textFieldBorder,
                        focusedErrorBorder: textFieldBorder,
                        labelText: "Message",
                        labelStyle: TextStyle(
                          color: Color(0xFFA79A9A),
                        ),
                        fillColor: Colors.white,
                        focusedBorder: textFieldBorder,
                        hintText: 'Type Message',
                        hintStyle: TextStyle(color: Color(0xFFA79A9A)),
                        //suffixIcon: Icon(Icons.message,color: Color(0xFFA79A9A),),
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
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextFormField(
                      style: TextStyle(color: Color(0xFFA79A9A)),
                      decoration: InputDecoration(
                        enabledBorder: textFieldBorder,
                        errorBorder: textFieldBorder,
                        disabledBorder: textFieldBorder,
                        focusedErrorBorder: textFieldBorder,
                        labelText: "Name",
                        labelStyle: TextStyle(
                          color: Color(0xFFA79A9A),
                        ),
                        fillColor: Colors.white,
                        focusedBorder: textFieldBorder,
                        hintText: 'Enter your Name',
                        hintStyle: TextStyle(color: Color(0xFFA79A9A)),
                        //suffixIcon: Icon(Icons.account_circle,color: Color(0xFFA79A9A),),
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
                      style: TextStyle(color: Color(0xFFA79A9A)),
                      decoration: InputDecoration(
                        enabledBorder: textFieldBorder,
                        errorBorder: textFieldBorder,
                        disabledBorder: textFieldBorder,
                        focusedErrorBorder: textFieldBorder,
                        labelText: "Contact No",
                        labelStyle: TextStyle(
                          color: Color(0xFFA79A9A),
                        ),
                        fillColor: Colors.white,
                        focusedBorder: textFieldBorder,
                        hintText: 'Enter your Contact No',
                        hintStyle: TextStyle(color: Color(0xFFA79A9A)),
                        //suffixIcon: Icon(Icons.account_circle,color: Color(0xFFA79A9A),),
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
                        style: TextStyle(color: Colors.white),
                      )),
                    ),
                  ),
                  Center(
                      child: Text(
                    // _file != null ? _file.path : 'select file',
                    _pickedImage != null ? _pickedImage.name : 'select file',
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
                            setState(() {
                              loader = true;
                            });
                            createSendmailState(
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
                              // Navigator.of(context).push(MaterialPageRoute(
                              //     builder: (context) => HomeBottomBar()));
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
    );
  }
}

// class ReportProblem extends StatefulWidget {
//   @override
//   _ReportProblemState createState() => _ReportProblemState();
// }

// class _ReportProblemState extends State<ReportProblem> {
//   @override
//   void initState() {
//     // SystemChrome.setEnabledSystemUIOverlays([]);
//     super.initState();
//   }

//   bool loader = false;
//   final formKey = GlobalKey<FormState>();
//   //Future<SignUpResponse> _futureJwt;
//   final TextEditingController _email = TextEditingController();
//   final TextEditingController _subject = TextEditingController();
//   final TextEditingController _message = TextEditingController();
//   final TextEditingController _name = TextEditingController();
//   final TextEditingController _mobile = TextEditingController();
//   InputBorder border = OutlineInputBorder(
//     borderSide: const BorderSide(color: Color(0xFFA6B3BC), width: 2.0),
//     borderRadius: BorderRadius.circular(30.0),
//   );
//   File _file;
//   Future getFile() async {
//     FilePickerResult result = await FilePicker.platform.pickFiles();

//     if (result != null) {
//       File file = File(result.files.single.path);
//       setState(() {
//         _file = file;
//       });
//     } else {
//       // User canceled the picker
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     double width = MediaQuery.of(context).size.width;
//     double height = MediaQuery.of(context).size.height;
//     return SafeArea(
//       child: Stack(
//         children: [
//           Scaffold(
//             backgroundColor: Colors.black,
//             appBar: PreferredSize(
//                 preferredSize: Size.fromHeight(55), child: Backappbar()),
//             body: Container(
//               decoration: BoxDecoration(
//                   gradient: LinearGradient(
//                       begin: Alignment.topCenter,
//                       end: Alignment.bottomCenter,
//                       colors: [
//                     Color(0xFF3F535E),
//                     Color(0xFF3A432E),
//                     //Color(0xFF0E0D13)
//                   ])),
//               child: Form(
//                 key: formKey,
//                 child: ListView(
//                   children: [
//                     SizedBox(
//                       height: 40,
//                     ),
//                     Center(
//                         child: Text(
//                       "Report A Problem",
//                       style: TextStyle(
//                           fontSize: 18,
//                           color: Color(0xFFE18D13),
//                           fontWeight: FontWeight.bold),
//                     )),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     Center(
//                         child: Text(
//                       "What issue(s) are your experiencing?",
//                       textAlign: TextAlign.center,
//                       style: TextStyle(fontSize: 12, color: Colors.white),
//                     )),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 10),
//                       child: TextFormField(
//                         style: TextStyle(
//                             color: Colors.white, fontFamily: fontfamily),
//                         decoration: InputDecoration(
//                           contentPadding: EdgeInsets.all(10),
//                           border: border,
//                           enabledBorder: border,
//                           focusedBorder: border,
//                           labelText: "Email",
//                           labelStyle: TextStyle(
//                             color: Colors.white,
//                           ),
//                           fillColor: Colors.white,
//                           hintText: 'Email:',
//                           hintStyle: TextStyle(color: Colors.white),
//                           //suffixIcon: Icon(Icons.alternate_email_outlined,color: Color(0xFFA79A9A),),
//                         ),
//                         controller: _email,
//                         validator: Validators.required('Email is required'),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 10),
//                       child: TextFormField(
//                         style: TextStyle(
//                             color: Colors.white, fontFamily: fontfamily),
//                         decoration: InputDecoration(
//                           contentPadding: EdgeInsets.all(10),
//                           border: border,
//                           enabledBorder: border,
//                           focusedBorder: border,
//                           labelText: "Subject",
//                           labelStyle: TextStyle(
//                             color: Colors.white,
//                           ),
//                           fillColor: Colors.white,
//                           hintText: 'Suject:',
//                           hintStyle: TextStyle(color: Colors.white),
//                           //suffixIcon: Icon(Icons.message,color: Color(0xFFA79A9A),),
//                         ),
//                         controller: _subject,
//                         validator: Validators.required('Subject is required'),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 10),
//                       child: TextFormField(
//                         style: TextStyle(
//                             color: Colors.white, fontFamily: fontfamily),
//                         decoration: InputDecoration(
//                           contentPadding: EdgeInsets.all(10),
//                           border: border,
//                           enabledBorder: border,
//                           focusedBorder: border,
//                           labelText: "Message",
//                           labelStyle: TextStyle(
//                             color: Colors.white,
//                           ),
//                           fillColor: Colors.white,
//                           hintText: 'Message:',
//                           hintStyle: TextStyle(color: Colors.white),
//                           //suffixIcon: Icon(Icons.message,color: Color(0xFFA79A9A),),
//                         ),
//                         maxLines: 5,
//                         controller: _message,
//                         validator: Validators.required('message is required'),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 10),
//                       child: TextFormField(
//                         style: TextStyle(
//                             color: Colors.white, fontFamily: fontfamily),
//                         decoration: InputDecoration(
//                           contentPadding: EdgeInsets.all(10),
//                           border: border,
//                           enabledBorder: border,
//                           focusedBorder: border,
//                           labelText: "Name",
//                           labelStyle: TextStyle(
//                             color: Colors.white,
//                           ),
//                           fillColor: Colors.white,
//                           hintText: 'Name:',
//                           hintStyle: TextStyle(color: Colors.white),
//                           //suffixIcon: Icon(Icons.account_circle,color: Color(0xFFA79A9A),),
//                         ),
//                         controller: _name,
//                         validator: Validators.required('Name is required'),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 10),
//                       child: TextFormField(
//                         style: TextStyle(
//                             color: Colors.white, fontFamily: fontfamily),
//                         decoration: InputDecoration(
//                           contentPadding: EdgeInsets.all(10),
//                           border: border,
//                           enabledBorder: border,
//                           focusedBorder: border,
//                           labelText: "Mobile number",
//                           labelStyle: TextStyle(
//                             color: Colors.white,
//                           ),
//                           fillColor: Colors.white,
//                           hintText: 'Mobile number:',
//                           hintStyle: TextStyle(color: Colors.white),
//                           //suffixIcon: Icon(Icons.account_circle,color: Color(0xFFA79A9A),),
//                         ),
//                         controller: _mobile,
//                         validator:
//                             Validators.required('Mobile number is required'),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     GestureDetector(
//                       onTap: () {
//                         getFile();
//                       },
//                       child: Container(
//                         height: 30,
//                         margin: EdgeInsets.only(left: 15, right: 15),
//                         decoration: BoxDecoration(
//                             color: Colors.black12,
//                             borderRadius: BorderRadius.circular(50),
//                             border: Border.all(color: Colors.white)),
//                         child: Center(
//                             child: Text(
//                           "Attach files",
//                           style: TextStyle(color: Colors.white),
//                         )),
//                       ),
//                     ),
//                     Center(
//                         child: Text(
//                       _file != null ? _file.path : 'select file',
//                       style: TextStyle(color: Colors.blue),
//                     )),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         GestureDetector(
//                           onTap: () {
//                             if (formKey.currentState.validate()) {
//                               createSendmailState(
//                                       _email.text,
//                                       _subject.text,
//                                       _message.text,
//                                       _name.text,
//                                       _file,
//                                       _mobile.text,
//                                       context)
//                                   .whenComplete(() {
//                                 Navigator.of(context).push(MaterialPageRoute(
//                                     builder: (context) => HomeBottomBar()));
//                                 setState(() {
//                                   loader = false;
//                                 });
//                               });
//                               setState(() {
//                                 loader = true;
//                               });
//                             }
//                           },
//                           child: Container(
//                             padding: EdgeInsets.symmetric(
//                                 horizontal: 40, vertical: 10),
//                             decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(30),
//                                 border: Border.all(color: Colors.white)),
//                             child: Center(
//                                 child: Text(
//                               'Send Now',
//                               textAlign: TextAlign.center,
//                               style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 20,
//                                   fontWeight: FontWeight.bold),
//                             )),
//                           ),
//                         ),
//                       ],
//                     ),
//                     SizedBox(
//                       height: 20,
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           Positioned(
//             top: AppBar().preferredSize.height * 0.2,
//             left: width * 0.39865,
//             child: SizedBox(
//               height: height * 0.12168,
//               width: width * 0.21875,
//               child: Image.asset(
//                 'assets/soundpic.png',
//               ),
//             ),
//           ),
//           if (loader)
//             Center(
//               child: CircularProgressIndicator(),
//             )
//         ],
//       ),
//     );
//   }
// }