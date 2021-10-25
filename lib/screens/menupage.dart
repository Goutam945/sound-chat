import 'package:sound_chat/common/index.dart';

class NewMenupage extends StatefulWidget {
  const NewMenupage({Key key}) : super(key: key);

  @override
  _NewMenupageState createState() => _NewMenupageState();
}

class _NewMenupageState extends State<NewMenupage> {
  Color tilecolor = Colors.white30.withOpacity(0.1);
  String email;
  String name;

  bool checklogin = true;
  bool checksignbutton = false;
  bool loader = false;
  int id;
  int staticlibid = 2;
  dynamic data;
  double fontSize = 12;

  void initState() {
    super.initState();
    _loadSavedData();
  }

  _loadSavedData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      if (sharedPreferences.getString('email') != null &&
          sharedPreferences.getString('email').isNotEmpty) {
        email = sharedPreferences.getString('email');
        name = sharedPreferences.getString('name');
        id = sharedPreferences.getInt('id');
        checklogin = true;
        checksignbutton = false;
      } else {
        checklogin = false;
        checksignbutton = true;
      }
    });
  }

  void remove() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
          extendBody: true,
          body: Container(
            // padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                  Color(0xFF481621),
                  Color(0xFF24162F),
                  //Color(0xFF0E0D13)
                ])),
            child: ListView(
              children: [
                ListTile(
                  tileColor: tilecolor,
                  leading: Image.asset(
                    'assets/tvinterview.png',
                  ),
                  title: Text(
                    "TV Interview",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: fontfamily,
                        color: Colors.white),
                  ),
                  subtitle: Text(
                    "Explore SoundChat catalog of exclusive interviews with your favourite artise and sound systems",
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: fontfamily,
                        color: Colors.white),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.rightToLeft,
                            child: AllHomeInterview()));
                  },
                ),
                SizedBox(
                  height: 5,
                ),
                ListTile(
                  tileColor: tilecolor,
                  leading: Image.asset(
                    'assets/radiopodcast.png',
                  ),
                  title: Text(
                    "Radio Podcast",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: fontfamily,
                        color: Colors.white),
                  ),
                  subtitle: Text(
                    "Miss a live show? Replay all your favourite show with a paid subscription package at your convenience.",
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: fontfamily,
                        color: Colors.white),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.rightToLeft,
                            child: PodcastSchedule()));
                  },
                ),
                SizedBox(
                  height: 5,
                ),
                ListTile(
                  tileColor: tilecolor,
                  leading: Image.asset(
                    'assets/chatstore.png',
                  ),
                  title: Text(
                    "Soundchat Store",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: fontfamily,
                        color: Colors.white),
                  ),
                  subtitle: Text(
                    "Shop for shoudhat merchandise ans show your support for the network and while repping your showbroadcaster.",
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: fontfamily,
                        color: Colors.white),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.rightToLeft,
                            child: Shopping()));
                  },
                ),
                SizedBox(
                  height: 5,
                ),
                ListTile(
                  tileColor: tilecolor,
                  leading: Image.asset(
                    'assets/gallery.png',
                  ),
                  title: Text(
                    "SoundChat Gallery",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: fontfamily,
                        color: Colors.white),
                  ),
                  subtitle: Text(
                    "Take a trip down memory lane with SoundCaht Gallery,revisit moments that made us who we are today",
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: fontfamily,
                        color: Colors.white),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.rightToLeft,
                            child: GalleryDesign()));
                  },
                ),
                SizedBox(
                  height: 5,
                ),
                ListTile(
                  tileColor: tilecolor,
                  leading: Image.asset(
                    'assets/programguid.png',
                  ),
                  title: Text(
                    "Programe Guide",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: fontfamily,
                        color: Colors.white),
                  ),
                  subtitle: Text(
                    "The the line up for all our daily programs,set reminders and get alerts when your show is schedule to start.",
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: fontfamily,
                        color: Colors.white),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.rightToLeft,
                            child: ScheduleDesign()));
                  },
                ),
                SizedBox(
                  height: 5,
                ),
                ListTile(
                  tileColor: tilecolor,
                  leading: Image.asset(
                    'assets/profileuser.png',
                  ),
                  title: Text(
                    "Profile & Setting",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: fontfamily,
                        color: Colors.white),
                  ),
                  subtitle: Text(
                    "Manage your account subscription and how this app works on your mobile device.",
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: fontfamily,
                        color: Colors.white),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.rightToLeft,
                            child: (email == null) ? NewLogin() : MyAccount()));
                  },
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  width: width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 5, right: 5, top: 2),
                        color: Colors.black,
                        height: height * 0.0366,
                        child: Text("More Options",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              fontFamily: fontfamily,
                            )),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      if (loader)
                        Center(
                          child: CircularProgressIndicator(),
                        ),
                      SizedBox(
                        width: width,
                        height: 200,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    //Icon(Icons.circle,color: Colors.white,size: 5,),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        if (email == null)
                                          Navigator.push(
                                              context,
                                              PageTransition(
                                                  type: PageTransitionType
                                                      .rightToLeft,
                                                  child: NewLogin()));
                                        else {
                                          setState(() {
                                            loader = true;
                                          });
                                          createAllOrderState(id, context)
                                              .whenComplete(() {
                                            setState(() {
                                              loader = false;
                                            });
                                          });
                                        }
                                      },
                                      child: Text(
                                        "My Orders",
                                        style: TextStyle(
                                            fontSize: fontSize,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: fontfamily,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                                // Row(
                                //   children: [
                                //     SizedBox(
                                //       width: 5,
                                //     ),
                                //     Text(
                                //       "Track Order",
                                //       style: TextStyle(
                                //           fontSize: fontSize,
                                //           fontWeight: FontWeight.bold,
                                //           fontFamily: fontfamily,
                                //           color: Colors.white),
                                //     ),
                                //   ],
                                // ),
                                // Row(
                                //   children: [
                                //     SizedBox(
                                //       width: 5,
                                //     ),
                                //     Text(
                                //       "My Coupan",
                                //       style: TextStyle(
                                //           fontSize: fontSize,
                                //           fontWeight: FontWeight.bold,
                                //           fontFamily: fontfamily,
                                //           color: Colors.white),
                                //     ),
                                //   ],
                                // ),

                                Row(
                                  children: [
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "Notification",
                                      style: TextStyle(
                                          fontSize: fontSize,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: fontfamily,
                                          color: Colors.white),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 5,
                                    ),
                                    GestureDetector(
                                      onTap: () => Navigator.push(
                                          context,
                                          PageTransition(
                                              type: PageTransitionType
                                                  .rightToLeft,
                                              child: TermsConditions())),
                                      child: Text(
                                        "Terms & Conditions",
                                        style: TextStyle(
                                            fontSize: fontSize,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: fontfamily,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                                // Row(
                                //   children: [
                                //     SizedBox(
                                //       width: 5,
                                //     ),
                                //     Text(
                                //       "Profile",
                                //       style: TextStyle(
                                //           fontSize: fontSize,
                                //           fontWeight: FontWeight.bold,
                                //           fontFamily: fontfamily,
                                //           color: Colors.white),
                                //     ),
                                //   ],
                                // ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 5,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            PageTransition(
                                                type: PageTransitionType
                                                    .rightToLeft,
                                                child: Refundpolicy()));
                                      },
                                      child: Text(
                                        "Refund Policy",
                                        style: TextStyle(
                                            fontSize: fontSize,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: fontfamily,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Container(
                              height: 150,
                              width: 2,
                              color: Colors.white,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "Contact Us",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: fontfamily,
                                          color: Colors.white),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 5,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    RequestLines()));
                                      },
                                      child: Text(
                                        "Studio Request Lines",
                                        style: TextStyle(
                                            fontSize: fontSize,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: fontfamily,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 5,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    OfficeContact()));
                                      },
                                      child: Text(
                                        "Office Contact Details",
                                        style: TextStyle(
                                            fontSize: fontSize,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: fontfamily,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 5,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    FollowUs()));
                                      },
                                      child: Text(
                                        "Follow Us On Social Media",
                                        style: TextStyle(
                                            fontSize: fontSize,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: fontfamily,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 5,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ReportProblem()));
                                      },
                                      child: Text(
                                        "ReportA Problem",
                                        style: TextStyle(
                                            fontSize: fontSize,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: fontfamily,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 5,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ReportProblem()));
                                      },
                                      child: Text(
                                        "Send a Genral Message ",
                                        style: TextStyle(
                                            fontSize: fontSize,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: fontfamily,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                                // Row(
                                //   children: [
                                //     SizedBox(
                                //       width: 5,
                                //     ),
                                //     Text(
                                //       "Advertise With  SoundChat",
                                //       style: TextStyle(
                                //           fontSize: fontSize,
                                //           fontWeight: FontWeight.bold,
                                //           fontFamily: fontfamily,
                                //           color: Colors.white),
                                //     ),
                                //   ],
                                // ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
