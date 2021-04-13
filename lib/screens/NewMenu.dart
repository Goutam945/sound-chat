import 'package:sound_chat/common/index.dart';

import 'ContactAs.dart';
import 'Myaccountprofile.dart';
import 'NewLogin.dart';
import 'OrderTracking.dart';
import 'TermsConditions.dart';
class NewMenuScreen extends StatefulWidget {
  @override
  _NewMenuScreenState createState() => _NewMenuScreenState();
}

class _NewMenuScreenState extends State<NewMenuScreen> {
  AudioStream stream = new AudioStream('https://s2.voscast.com:9059/stream');
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  String email;
  String name ;
  bool checklogin = true;
  bool checksignbutton=false;

  void initState() {
    super.initState();
    _loadSavedData();
  }

  _loadSavedData() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      if(sharedPreferences.getString('email') != null && sharedPreferences.getString('email').isNotEmpty){
        email = sharedPreferences.getString('email');
        name = sharedPreferences.getString('name');
        checklogin=true;
        checksignbutton=false;
      }else{
        checklogin=false;
        checksignbutton=true;
      }
    });
  }

  void remove()async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('AlertDialog'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Are You Sure'),
                Text('Logout?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Yes'),
              onPressed: () {
                remove();
               // Navigator.of(context).pop();
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>NewMenuScreen()));
                Toast.show("Successfully Logout", context,
                duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
                setState(() {
                  checklogin=false;
                  checksignbutton=true;
                });
                print(email);
              },
            ),
            TextButton(
              child: Text('No'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],

        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Stack(
        children: [
          Scaffold(
            backgroundColor: Color(0xFF111111),
            appBar: AppBar(
              backgroundColor: Color(0xFFE18D13),
            ),
            drawer: Drawer(
              child: Container(color: Color(0xFF111111),
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: <Widget>[
                    DrawerHeader(
                      child: Column(mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Align( alignment: Alignment.centerLeft,
                            child: Text(
                              ' MORE OPTIONS',
                              style: TextStyle(color: Colors.white, fontSize: 20,fontStyle: FontStyle.italic,decoration: TextDecoration.underline,),textAlign: TextAlign.start,
                            ),
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                          color: Color(0xFFE18D13),
                          // image: DecorationImage(
                          //     fit: BoxFit.fill,
                          //     image: AssetImage('assets/images/cover.jpg'))
                      ),
                    ),
                    if(checklogin)
                      ListTile(
                        leading: Icon(Icons.account_circle,color: Colors.white70),
                        title: Text('MyAccount',style: TextStyle(color: Colors.white,fontWeight: FontWeight.normal)),
                        onTap: () => {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => MyAccount(email,name))).whenComplete(() =>   Navigator.of(context).pop()),

                        },
                      ),
                    if(checklogin)
                      ListTile(
                      leading: Icon(Icons.location_on,color: Colors.white70),
                      title: Text('Order Tracking',style: TextStyle(color: Colors.white,fontWeight: FontWeight.normal)),
                      onTap: () => {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => StepperDemo())).whenComplete(() =>   Navigator.of(context).pop()),
                      
                      },
                    ),
                    if(checklogin)
                    ListTile(
                      leading: Icon(Icons.subscriptions,color: Colors.white70),
                      title: Text('Cancel Subscription',style: TextStyle(color: Colors.white,fontWeight: FontWeight.normal)),
                      onTap: () => {Navigator.of(context).pop()},
                    ),
                    if(checklogin)
                    ListTile(
                      leading: Icon(Icons.inbox,color: Colors.white70),
                      title: Text('Terms & Condition',style: TextStyle(color: Colors.white,fontWeight: FontWeight.normal)),
                      onTap: () =>Navigator.of(context).push(MaterialPageRoute(builder: (context)=>TermsConditions()))
                    ),
                    if(checklogin)
                    ListTile(
                      leading: Icon(Icons.notification_important,color: Colors.white70,),
                      title: Text('Notification',style: TextStyle(color: Colors.white,fontWeight: FontWeight.normal),),
                      onTap: () => {},
                    ),
                    if(checklogin)
                    ListTile(
                      leading: Icon(Icons.contact_phone,color: Colors.white70),
                      title: Text('Contact us',style: TextStyle(color: Colors.white,fontWeight: FontWeight.normal)),
                      onTap: () =>  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Contact()))..whenComplete(() =>   Navigator.of(context).pop())
                    ),
                    if(checklogin)
                    ListTile(
                      leading: Icon(Icons.settings,color: Colors.white70),
                      title: Text('Settings',style: TextStyle(color: Colors.white,fontWeight: FontWeight.normal)),
                      onTap: () => {Navigator.of(context).pop()},
                    ),
                    if(checklogin)
                    ListTile(
                      leading: Icon(Icons.logout,color: Colors.white70),
                      title: Text('Logout',style: TextStyle(color: Colors.white,fontWeight: FontWeight.normal)),
                      onTap:
                       // remove()
                      _showMyDialog
                    ),
                    if(checksignbutton)
                    ListTile(
                        leading: Icon(Icons.login,color: Colors.white70),
                        title: Text('Login',style: TextStyle(color: Colors.white,fontWeight: FontWeight.normal)),
                        onTap: (){
                         // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>DesignLogin()));
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>NewLogin()));
                        },

                    ),
                  ],
                ),
              ),

            ),
            body: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Container(
                      height: height * 0.0044,
                      width: width,
                      color: Color(0xFF780001),
                    ),
                    SizedBox(
                      //height: height * 0.20994,
                      width: width * 1.06946,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 23),
                            child: Container(
                              child: Column(
                                children: [
                                  GestureDetector(
                                    child: SizedBox(
                                      //height: height * 0.17558,
                                        width: width * 0.3645,
                                        child: Image.asset(
                                          'assets/livechat.png',
                                          fit: BoxFit.fill,
                                        )),
                                    onTap: () {
                                      // Navigator.of(context).push(MaterialPageRoute(
                                      //     builder: (context) => LivechatRoom()));
                                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=> (email==null)?NewLogin():LivechatRoom()));
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 5, left: 80),
                                child: Text(
                                  "MENU",
                                  style: TextStyle(
                                      color: Color(0xFF8A8989), fontSize: 24),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Container(
                                  child: Column(
                                    children: [
                                      GestureDetector(
                                        child: SizedBox(
                                          //height: height * 0.1463,
                                            width: width * 0.5833,
                                            child: Image.asset(
                                              'assets/inteview.png',
                                              fit: BoxFit.fill,
                                            )),
                                        onTap: () {
                                          stream.stop();
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      AllHomeInterview()));
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: width * 0.60965,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  GestureDetector(
                                    child: SizedBox(
                                      //height: height * 0.2414,
                                        width: width * 0.291667,
                                        child: Image.asset(
                                          'assets/shopping.png',
                                          fit: BoxFit.fill,
                                        )),
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                              Shopping()));
                                    },
                                  ),
                                  GestureDetector(
                                    child: SizedBox(
                                      // height: height * 0.2414,
                                        width: width * 0.291667,
                                        child: Image.asset(
                                          'assets/photogallery.png',
                                          fit: BoxFit.fill,
                                        )),
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  GalleryDesign()));
                                    },
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Container(
                                child: GestureDetector(
                                  child: SizedBox(
                                    // height: height * 0.1756,
                                      width: width * 0.6076,
                                      child: Image.asset(
                                        'assets/profile.png',
                                        fit: BoxFit.fill,
                                      )),
                                  onTap: () {
                                    // Navigator.of(context).push(
                                    //     MaterialPageRoute(
                                    //         builder: (context) =>
                                    //             Subscription()));
                                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=> (email==null)?NewLogin():MyAccount(email,name)));
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              child: Column(
                                children: [
                                  GestureDetector(
                                    child: SizedBox(
                                      //height: height * 0.2926,
                                      width: width * 0.34027,
                                      child: Image.asset(
                                        'assets/podcast.png',
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  PodcastSchedule()));
                                    },
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(top: 5),
                              child: Column(
                                children: [
                                  GestureDetector(
                                    child: SizedBox(
                                      //height: height * 0.1316,
                                        width: width * 0.36458,
                                        child: Image.asset(
                                          'assets/time.png',
                                          scale: 2.5,
                                        )),
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ScheduleDesign()));
                                    },

                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
               /* Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 1),
                        child: Text("MORE OPTIONS",
                            style: TextStyle(
                                color: Color(0xFF8A8989),
                                fontSize: 24,
                                fontStyle: FontStyle.italic)),
                      ),
                      SizedBox(
                        width: width * 0.39009,
                        child: Divider(
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.3,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.circle,
                                  color: Color(0xFF535353),
                                  size: 5,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "Push Notifications",
                                  style: TextStyle(
                                    color: Color(0xFF535353),
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.circle,
                                  color: Color(0xFF535353),
                                  size: 5,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "Acount Settings",
                                  style: TextStyle(
                                    color: Color(0xFF535353),
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.circle,
                                  color: Color(0xFF535353),
                                  size: 5,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "App Settings",
                                  style: TextStyle(
                                    color: Color(0xFF535353),
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.circle,
                                  color: Color(0xFF535353),
                                  size: 5,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "Menu Layout",
                                  style: TextStyle(
                                    color: Color(0xFF535353),
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.circle,
                                  color: Color(0xFF535353),
                                  size: 5,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "Chat Settings",
                                  style: TextStyle(
                                    color: Color(0xFF535353),
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.circle,
                                  color: Color(0xFF535353),
                                  size: 5,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "Dark Mode",
                                  style: TextStyle(
                                    color: Color(0xFF535353),
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.circle,
                                  color: Color(0xFF535353),
                                  size: 5,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "Language",
                                  style: TextStyle(
                                    color: Color(0xFF535353),
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.circle,
                                  color: Color(0xFF535353),
                                  size: 5,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "Contact Us",
                                  style: TextStyle(
                                    color: Color(0xFF535353),
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.circle,
                                  color: Color(0xFF535353),
                                  size: 5,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "Cancel Subscription",
                                  style: TextStyle(
                                    color: Color(0xFF535353),
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.circle,
                                  color: Color(0xFF535353),
                                  size: 5,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "EULA & Privacy",
                                  style: TextStyle(
                                    color: Color(0xFF535353),
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.circle,
                                  color: Color(0xFF535353),
                                  size: 5,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "Terms & Condition",
                                  style: TextStyle(
                                    color: Color(0xFF535353),
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.circle,
                                  color: Color(0xFF535353),
                                  size: 5,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "Refund Policy",
                                  style: TextStyle(
                                    color: Color(0xFF535353),
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.circle,
                                  color: Color(0xFF535353),
                                  size: 5,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "lose Account",
                                  style: TextStyle(
                                    color: Color(0xFF535353),
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.circle,
                                  color: Color(0xFF535353),
                                  size: 5,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "Order Tracking",
                                  style: TextStyle(
                                    color: Color(0xFF535353),
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),*/
                Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "@ Copyright 2021 Irish & Chin Inc.",
                        style: TextStyle(
                          color: Color(0xFF535353),
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: AppBar().preferredSize.height*0.1,
            left: width * 0.39865,
            child: SizedBox(
              height: height * 0.13168,
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
