import 'package:http/http.dart' as http;
import 'package:sound_chat/common/index.dart';

import 'FollowUs.dart';
import 'OfficeContact.dart';
import 'ReportProblem.dart';
import 'RequestLines.dart';
import 'SendMessage.dart';
class Contact extends StatefulWidget {
  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  String data;
  var superherosLength;
  List<bool>butoncolor=[for(int i=0;i<5;i++)true];
  @override
  void initState() {
    super.initState();
    // getData();
  }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Stack(
          children:[ Scaffold(
            backgroundColor: Colors.black,
            appBar: AppBar(
              backgroundColor: Color(0xFFE18D13),
              //title: Text("Flutter Http Example"),
            ),
            body:ListView(
              children: [
                SizedBox(height: 40,),
                Center(child: Text("Contact Us",style: TextStyle(fontSize: 19,color: Color(0xFFE18D13),fontWeight: FontWeight.bold),)),
                SizedBox(height: 20,),
                Center(child: Text("How can we help you today?",textAlign: TextAlign.center,style: TextStyle(fontSize: 16,color: Color(0xFFA79A9A)),)),
                SizedBox(height: 20,),
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) =>
                                RequestLines()));
                    setState(() {
                      butoncolor=butoncolor.asMap().entries.map((e) => e.key==0 ? false:true).toList();
                    });
                  },
                  child: Container(height: 40,margin: EdgeInsets.only(left: 15,right: 15),
                    decoration: BoxDecoration(color: butoncolor[0] ?Colors.black:Color(0xFFE18D13),
                        borderRadius: BorderRadius.circular(50),
                        border:Border.all(color: Colors.white)),
                    child: Center(
                      child: Text("Studio Request Lines",textAlign: TextAlign.center,style: TextStyle(color: Colors.white, fontSize: 18,),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                GestureDetector(onTap: (){
                  Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) =>
                              OfficeContact()));
                  setState(() {
                    butoncolor=butoncolor.asMap().entries.map((e) => e.key==1 ? false:true).toList();
                  });
                },
                  child: Container(height: 40,margin: EdgeInsets.only(left: 15,right: 15),
                    decoration: BoxDecoration(color: butoncolor[1] ?Colors.black:Color(0xFFE18D13),
                        borderRadius: BorderRadius.circular(50),
                        border:Border.all(color: Colors.white)),
                    child: Center(
                      child: Text("Office Contact Details",textAlign: TextAlign.center,style: TextStyle(color: Colors.white, fontSize: 18,),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                GestureDetector(onTap: (){
                  Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) =>
                              FollowUs()));
                  setState(() {
                    butoncolor=butoncolor.asMap().entries.map((e) => e.key==2 ? false:true).toList();
                  });
                },
                  child: Container(height: 40,margin: EdgeInsets.only(left: 15,right: 15),
                    decoration: BoxDecoration(color: butoncolor[2] ?Colors.black:Color(0xFFE18D13),
                        borderRadius: BorderRadius.circular(50),
                        border:Border.all(color: Colors.white)),
                    child: Center(
                      child: Text("Follow us on Social Media",textAlign: TextAlign.center,style: TextStyle(color: Colors.white, fontSize: 18,),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                GestureDetector(onTap: (){
                  Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) =>
                              ReportProblem()));
                  setState(() {
                    butoncolor=butoncolor.asMap().entries.map((e) => e.key==3 ? false:true).toList();
                  });
                },
                  child: Container(height: 40,margin: EdgeInsets.only(left: 15,right: 15),
                    decoration: BoxDecoration(color: butoncolor[3] ?Colors.black:Color(0xFFE18D13),
                        borderRadius: BorderRadius.circular(50),
                        border:Border.all(color: Colors.white)
                    ),
                    child: Center(
                      child: Text("Report A Problem",textAlign: TextAlign.center,style: TextStyle(color: Colors.white, fontSize: 18,),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                GestureDetector(onTap: (){
                  Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) =>
                              SendMessage()));
                  setState(() {
                    butoncolor=butoncolor.asMap().entries.map((e) => e.key==4 ? false:true).toList();
                  });
                },
                  child: Container(height: 40,margin: EdgeInsets.only(left: 15,right: 15),
                    decoration: BoxDecoration(color: butoncolor[4] ?Colors.black:Color(0xFFE18D13),
                        borderRadius: BorderRadius.circular(50),border:Border.all(color: Colors.white)
                    ),

                    child: Center(
                      child: Text("Send A Message",textAlign: TextAlign.center,style: TextStyle(color: Colors.white, fontSize: 18,),
                      ),
                    ),
                  ),
                ),

                /*Column(
                  children: [
                    SizedBox(height: 40,),
                    Text("Contact Us",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
                    SizedBox(height: 10,),
                    Text("How can we help you today?",style: TextStyle(fontSize: 16,color: Colors.white),),
                    SizedBox(height: 10,),
                    GestureDetector(
                      onTap: (){
                        Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) =>
                                    RequestLines()));
                      },
                      child: Container(color: Color(0xFFE18D13),height: 40,margin: EdgeInsets.only(left: 15,right: 15),
                        child: Center(
                          child: Text("Studio Request Lines",textAlign: TextAlign.center,style: TextStyle(color: Colors.white, fontSize: 20,),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    GestureDetector(onTap: (){
                      Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) =>
                                  OfficeContact()));
                    },
                      child: Container(color: Color(0xFFE18D13),height: 40,margin: EdgeInsets.only(left: 15,right: 15),
                        child: Center(
                          child: Text("Office Contact Details",textAlign: TextAlign.center,style: TextStyle(color: Colors.white, fontSize: 20,),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    GestureDetector(onTap: (){
                      Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) =>
                                  FollowUs()));
                    },
                      child: Container(color: Color(0xFFE18D13),height: 40,margin: EdgeInsets.only(left: 15,right: 15),
                        child: Center(
                          child: Text("Follow us on Social Media",textAlign: TextAlign.center,style: TextStyle(color: Colors.white, fontSize: 20,),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    GestureDetector(onTap: (){
                      Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) =>
                                  ReportProblem()));
                    },
                      child: Container(color: Color(0xFFE18D13),height: 40,margin: EdgeInsets.only(left: 15,right: 15),
                        child: Center(
                          child: Text("Report A Problem",textAlign: TextAlign.center,style: TextStyle(color: Colors.white, fontSize: 20,),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    GestureDetector(onTap: (){
                      Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) =>
                                  SendMessage()));
                    },
                      child: Container(color: Color(0xFFE18D13),height: 40,margin: EdgeInsets.only(left: 15,right: 15),
                        child: Center(
                          child: Text("Send A Message",textAlign: TextAlign.center,style: TextStyle(color: Colors.white, fontSize: 20,),
                          ),
                        ),
                      ),
                    ),
                    // Divider(
                    //   color: Colors.black,
                    // ),
                  ],
                ),*/

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
          ]
      ),
    );
  }
}
