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
  InputBorder border = OutlineInputBorder(
    borderSide: const BorderSide(color: Color(0xFFA6B3BC), width: 2.0),
    borderRadius: BorderRadius.circular(30.0),
  );
  File _file;
  Future getFile()async{
    FilePickerResult result = await FilePicker.platform.pickFiles();

    if(result != null) {
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
          children:[ Scaffold(
            backgroundColor: Colors.black,
            appBar: PreferredSize(preferredSize: Size.fromHeight(55),
                child: Backappbar()),
            body:ListView(
              children: [
                SizedBox(height: 40,),
                Center(child: Text("Report A Problem",style: TextStyle(fontSize: 18,color: Color(0xFFE18D13),fontWeight: FontWeight.bold),)),
                SizedBox(height: 20,),
                Center(child: Text("What issue(s) are your experiencing?",textAlign: TextAlign.center,style: TextStyle(fontSize: 12,color: Colors.white),)),
                SizedBox(height: 20,),
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextFormField(style: TextStyle(color: Colors.white),
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
                      hintText: 'Email:',hintStyle: TextStyle(color: Colors.white),
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
                  child: TextFormField(style: TextStyle(color: Colors.white),
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
                      hintText: 'Suject:',hintStyle: TextStyle(color: Colors.white),
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
                    style: TextStyle(color: Colors.white),
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
                      hintText: 'Message:',hintStyle: TextStyle(color: Colors.white),
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
                  child: TextFormField(style: TextStyle(color: Colors.white),
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
                      hintText: 'Name:',hintStyle: TextStyle(color: Colors.white),
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
