import 'package:sound_chat/common/index.dart';
import 'updateprofile.dart';
class DesignProfile extends StatefulWidget {
  final email,name;
  DesignProfile(this.email,this.name);
  @override
  _DesignProfile createState() => _DesignProfile();
}
class _DesignProfile extends State<DesignProfile> {
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
                  height: 20,
                ),
                Container(
                  height: MediaQuery.of(context).size.height/2,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(top: 30),
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width/1.2,
                        height: 45,
                        padding: EdgeInsets.only(
                            top: 4,left: 16, right: 16, bottom: 4
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                                Radius.circular(10)
                            ),
                            color: Color(0xFFDBCBB1),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 5
                              )
                            ]
                        ),
                        child: Row(
                          children: [
                            Text("User name:",style: TextStyle(fontSize: 15),),
                            Text(widget.name
                              //Text(Provider.of<LoginResponse>(context, listen: false).data['user_nicename'] //save data
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width/1.2,
                        height: 45,
                        padding: EdgeInsets.only(
                            top: 4,left: 16, right: 16, bottom: 4
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                                Radius.circular(10)
                            ),
                            color: Color(0xFFDBCBB1),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 5
                              )
                            ]
                        ),
                        child: Row(
                          children: [
                            Text("Email:",style: TextStyle(fontSize: 15),),
                            Text(widget.email
                              //Text(Provider.of<LoginResponse>(context, listen: false).data['user_email'],
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      InkWell(
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>DesignUpdate()));
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
                            child: Text('Update'.toUpperCase(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ),

                        ),
                      ),
                      SizedBox(
                        height: height * 0.07189,
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
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
