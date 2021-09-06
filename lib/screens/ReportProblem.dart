import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:sound_chat/api/sendmail.dart';
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
  bool loader=false;
  //Future<SignUpResponse> _futureJwt;
  final TextEditingController _email = TextEditingController();
  final TextEditingController _subject = TextEditingController();
  final TextEditingController _message = TextEditingController();
  final TextEditingController _name = TextEditingController();
  File _file;
  Future getFile()async{
    File file = (await FilePicker.platform) as File;

    setState(() {
      _file = file;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Stack(
          children:[ Scaffold(
            backgroundColor: Colors.black,
            appBar: PreferredSize(preferredSize: Size.fromHeight(55),
                child: Backappbar()),
            body:ListView(
              children: [
                SizedBox(height: 40,),
                Center(child: Text("Report A Problem",style: TextStyle(fontSize: 19,color: Color(0xFFE18D13),fontWeight: FontWeight.bold),)),
                SizedBox(height: 20,),
                Center(child: Text("What issue(s) are your experiencing?",textAlign: TextAlign.center,style: TextStyle(fontSize: 16,color: Color(0xFFA79A9A)),)),
                SizedBox(height: 20,),
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
                      //suffixIcon: Icon(Icons.alternate_email_outlined,color: Color(0xFFA79A9A),),

                    ),
                    controller: _email,
                    validator: Validators.required(
                        'Email is required'),
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
                      labelText: "Subject",
                      labelStyle: TextStyle(
                        color:Color(0xFFA79A9A),
                      ),
                      fillColor: Colors.white,
                      focusedBorder:OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white, width: 2.0),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      hintText: 'Suject:',hintStyle: TextStyle(color: Color(0xFFA79A9A)),
                      //suffixIcon: Icon(Icons.message,color: Color(0xFFA79A9A),),

                    ),
                    controller: _subject,
                    validator: Validators.required(
                        'Subject is required'),
                  ),
                ),
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextFormField(
                    style: TextStyle(color: Color(0xFFA79A9A)),
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
                      labelText: "Message",
                      labelStyle: TextStyle(
                        color:Color(0xFFA79A9A),
                      ),
                      fillColor: Colors.white,
                      focusedBorder:OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white, width: 2.0),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      hintText: 'Message:',hintStyle: TextStyle(color: Color(0xFFA79A9A)),
                      //suffixIcon: Icon(Icons.message,color: Color(0xFFA79A9A),),

                    ),
                    maxLines: 5,
                    controller: _message,
                    validator: Validators.required(
                        'message is required'),
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
                      //suffixIcon: Icon(Icons.account_circle,color: Color(0xFFA79A9A),),

                    ),
                    controller: _name,
                    validator: Validators.required(
                        'Name is required'),
                  ),
                ),
                SizedBox(height: 20,),
                GestureDetector(
                  onTap: (){
                    getFile();
                  },
                  child: Container(height: 30,margin: EdgeInsets.only(left: 15,right: 15),
                    decoration: BoxDecoration(color: Colors.black,borderRadius: BorderRadius.circular(50),
                        border:Border.all(color: Colors.white)),
                    child: Center(child: Text("Attach files",style: TextStyle(color: Colors.white),)),
                  ),
                ),
                Center(child: Text(_file!=null?_file.path:'select file',style: TextStyle(color: Colors.blue),)),
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 60),
                  child: SizedBox(height: 50,
                    child: ElevatedButton(style:ElevatedButton.styleFrom( primary: Color(0xFF8E0E14),shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0),) ),
                      onPressed: () {
                        createSendmailState(_email.text,_subject.text,_message.text,_name.text,_file,context).whenComplete(() {
                          Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) =>
                                      NewMenuScreen()));
                          setState(() {
                            loader=false;
                          });
                        });
                        setState(() {
                          loader=true;
                        });
                      },
                      child: Text('Send Now',style: TextStyle(fontSize: 16),),
                    ),
                  ),
                ),

                /*Column(
                  children: [
                    SizedBox(height: 40,),
                    Text("Report A Problem",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
                    SizedBox(height: 10,),
                    Text("What issue(s) are your experiencing?",style: TextStyle(fontSize: 16,color: Colors.white),),
                    SizedBox(height: 10,),
                    Container(color: Color(0xFF464646),height: 40,margin: EdgeInsets.only(left: 15,right: 15),
                      child: Center(
                        child: TextFormField(style: TextStyle(color: Colors.white),
                          controller: _email,
                          validator: Validators.required(
                              'email is required'),
                          decoration: InputDecoration(errorStyle: TextStyle(height: 0.5),
                              hintText: 'Email Id:',
                              contentPadding: EdgeInsets.only(
                                  left: 20, top: 0)),
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Container(color: Color(0xFF464646),height: 40,margin: EdgeInsets.only(left: 15,right: 15),
                      child: Center(
                        child: TextFormField(style: TextStyle(color: Colors.white),
                          controller: _subject,
                          validator: Validators.required(
                              'Subject is required'),
                          decoration: InputDecoration(errorStyle: TextStyle(height: 0.5),
                              hintText: 'Subject:',
                              contentPadding: EdgeInsets.only(
                                  left: 20, top: 0)),
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Container(color: Color(0xFF464646),height: 150,margin: EdgeInsets.only(left: 15,right: 15),
                      child: TextFormField(style: TextStyle(color: Colors.white),
                        controller: _message,
                        maxLines: null,
                        expands: true,
                        keyboardType: TextInputType.multiline,
                        validator: Validators.required(
                            'Message is required'),
                        decoration: InputDecoration(errorStyle: TextStyle(height: 0.5),
                            hintText: 'Message:',
                            border: InputBorder.none,

                            contentPadding: EdgeInsets.only(
                                left: 20, top: 0)),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Container(color: Color(0xFF464646),height: 40,margin: EdgeInsets.only(left: 15,right: 15),
                      child: Center(
                        child: TextFormField(style: TextStyle(color: Colors.white),
                          controller: _name,
                          validator: Validators.required(
                              'name is required'),
                          decoration: InputDecoration(errorStyle: TextStyle(height: 0.5),
                              hintText: 'Your Name:',
                              contentPadding: EdgeInsets.only(
                                  left: 20, top: 0)),
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    GestureDetector(
                      onTap: (){
                        getFile();
                      },
                      child: Container(height: 30,margin: EdgeInsets.only(left: 15,right: 15),
                        decoration: BoxDecoration(
                            color: Color(0xFF464646),
                            border: Border.all(color: Color(0xFFE18D13))
                        ),
                        child: Center(child: Text("Attach files",style: TextStyle(color: Colors.white),)),
                      ),
                    ),
                    Text(_file!=null?_file.path:'select file',style: TextStyle(color: Colors.blue),),
                    SizedBox(height: 20,),
                    ElevatedButton(style:ElevatedButton.styleFrom( primary: Color(0xFF8E0E14) ),
                      onPressed: () {
                        createSendmailState(_email.text,_subject.text,_message.text,_name.text,_file,context).whenComplete(() {
                          Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) =>
                                      NewMenuScreen()));
                          setState(() {
                            loader=false;
                          });
                        });
                        setState(() {
                          loader=true;
                        });
                      },
                      child: Text('Send Now',style: TextStyle(fontSize: 16),),
                    ),
                  ],
                ),*/
                if(loader)Center(child: CircularProgressIndicator(),)
              ],
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
          ],

      ),
    );
  }
}
