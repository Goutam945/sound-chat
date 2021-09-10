import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:sound_chat/api/all%20_orders.dart';
import 'package:sound_chat/api/cancel_subcription.dart';
import 'package:sound_chat/api/membership.dart';
import 'package:sound_chat/api/subcribtion_lable.dart';
import 'package:sound_chat/common/index.dart';
import 'package:sound_chat/screens/schedule%20design.dart';
import 'contactas.dart';
import 'couponcode.dart';
import 'Myaccountprofile.dart';
import 'newlogin.dart';
import 'ordertracking.dart';
import 'orderdeatail.dart';
import '../Testing firebse/Otptest.dart';
import 'socketexample.dart';
import 'subcriptionplans.dart';
import 'termsConditions.dart';

class NewMenuScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<NewMenuScreen> {
  final _advancedDrawerController = AdvancedDrawerController();
  AudioPlayer audioPlayer = new AudioPlayer(
      playerId: 'Soundchat Radio', mode: PlayerMode.MEDIA_PLAYER);
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  String email;
  String name;

  bool checklogin = true;
  bool checksignbutton = false;
  bool loader = false;
  int id;
  int staticlibid = 2;
  dynamic data;

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

  Future<void> showMyDialog() async {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.WARNING,
      animType: AnimType.BOTTOMSLIDE,
      btnOkColor: Colors.orange,
      title: 'Are You Sure',
      desc: 'Logout?',
      btnCancelOnPress: () {
        Navigator.of(context).pop();
      },
      btnOkOnPress: () {
        remove();
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => NewMenuScreen()));
        Toast.show("Successfully Logout", context,
            duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
        setState(() {
          checklogin = false;
          checksignbutton = true;
        });
        print(email);
      },
    )..show();
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
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => NewMenuScreen()));
                Toast.show("Successfully Logout", context,
                    duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
                setState(() {
                  checklogin = false;
                  checksignbutton = true;
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
    if (Provider.of<SubcriptionlevalResponse>(context, listen: false).data !=
        null)
      data = Provider.of<SubcriptionlevalResponse>(context, listen: false)
          .data['response'];
    return AdvancedDrawer(
      backdropColor: Color(0xFF111111),
      controller: _advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 700),
      childDecoration: const BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(16)),
      ),
      child: SafeArea(
        child: Stack(
          children: [
            Scaffold(
              backgroundColor: Color(0xFF111111),
              appBar: AppBar(
                backgroundColor: Color(0xFFE18D13),
                leading: IconButton(
                  onPressed: _handleMenuButtonPressed,
                  icon: ValueListenableBuilder<AdvancedDrawerValue>(
                    valueListenable: _advancedDrawerController,
                    builder: (context, value, child) {
                      return Icon(
                        value.visible ? Icons.clear : Icons.menu,
                      );
                    },
                  ),
                ),
              ),
              body: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                        // Navigator.of(context).push(MaterialPageRoute(builder: (context)=> (email==null)?NewLogin():LivechatRoom()));
                                        Navigator.push(
                                            context,
                                            PageTransition(
                                                type: PageTransitionType
                                                    .rightToLeft,
                                                child: (email == null)
                                                    ? NewLogin()
                                                    : LivechatRoom()));
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Column(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 5, left: 80),
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
                                            audioPlayer.pause();
                                            Navigator.push(
                                                context,
                                                PageTransition(
                                                    type: PageTransitionType
                                                        .rightToLeft,
                                                    child: AllHomeInterview()));
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
                      SizedBox(
                        height: 10,
                      ),
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                        Navigator.push(
                                            context,
                                            PageTransition(
                                                type: PageTransitionType
                                                    .rightToLeft,
                                                child: Shopping()));
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
                                        // Navigator.of(context).push(
                                        //     MaterialPageRoute(
                                        //         builder: (context) =>
                                        //             GalleryDesign()));
                                        Navigator.push(
                                            context,
                                            PageTransition(
                                                type: PageTransitionType
                                                    .rightToLeft,
                                                child: GalleryDesign()));
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
                                      //         builder: (context) => (email ==
                                      //                 null)
                                      //             ? NewLogin()
                                      //             : MyAccount(email, name)));
                                      Navigator.push(context,
                                          PageTransition(type:
                                          PageTransitionType.rightToLeft, child:(email==null)?NewLogin():MyAccount(email,name)));
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
                                        Navigator.push(
                                            context,
                                            PageTransition(
                                                type: PageTransitionType
                                                    .rightToLeft,
                                                child: PodcastSchedule()));
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
                                            //scale: 2.5,
                                          )),
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            PageTransition(
                                                type: PageTransitionType
                                                    .rightToLeft,
                                                child: ScheduleDesign()));
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
              top: AppBar().preferredSize.height * 0.1,
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
      ),
      drawer: SafeArea(
        child: Container(
          color: Color(0xFF111111),
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        ' MORE OPTIONS',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontStyle: FontStyle.italic,
                          decoration: TextDecoration.underline,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    //for(int i=1;i<=data.length;i++)
                    //Text(data['$i']["level_id"].toString())
                  ],
                ),
                decoration: BoxDecoration(
                  color: Color(0xFFE18D13),
                ),
              ),
              if (checklogin)
                ListTile(
                  leading: Icon(Icons.account_circle, color: Colors.white70),
                  title: Text('MyAccount',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.normal)),
                  onTap: () => {
                    /*setState(() {
                                    loader=true;
                                  }),
                          createSubcriptionlevalState(id,context).whenComplete((){
                        Navigator.of(context).push(MaterialPageRoute(
                             builder: (context) => MyAccount(email,name))).whenComplete(() =>   Navigator.of(context).pop());
                        setState(() {
                              loader=false;
                            });
                        })*/
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => MyAccount(email, name))),
                  },
                ),
              if (checklogin)
                ListTile(
                  leading:
                      Icon(Icons.shopping_cart_outlined, color: Colors.white70),
                  title: Text('My Order',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.normal)),
                  onTap: () => {
                    setState(() {
                      loader = true;
                    }),
                    createAllOrderState(id, context).whenComplete(() {
                      setState(() {
                        loader = false;
                      });
                    }),
                  },
                ),
              if (checklogin)
                ListTile(
                  leading: Icon(Icons.location_on, color: Colors.white70),
                  title: Text('Order Tracking',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.normal)),
                  onTap: () => {
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.rightToLeft,
                            child: StepperDemo())),
                  },
                ),
              if (checklogin)
                ListTile(
                  leading: Icon(Icons.subscriptions, color: Colors.white70),
                  title: Text('Cancel Subscription',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.normal)),
                  onTap: () => {
                    setState(() {
                      loader = true;
                    }),
                    createCancelsubcripState(id.toString(), context)
                        .whenComplete(() {
                      setState(() {
                        loader = false;
                      });
                    }),
                  },
                ),
              // if(checklogin)
              ListTile(
                leading: Icon(
                  Icons.notification_important,
                  color: Colors.white70,
                ),
                title: Text(
                  'Notification',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.normal),
                ),
                onTap: () => {
                 /* Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.rightToLeft,
                          child: ChatPage()))*/
                },
              ),
              // if(checklogin)
              ListTile(
                  leading: Icon(Icons.inbox, color: Colors.white70),
                  title: Text('Terms & Condition',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.normal)),
                  onTap: () => Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.rightToLeft,
                          child: TermsConditions()))),

              if (checksignbutton)
                ListTile(
                    leading: Icon(
                      Icons.subscriptions,
                      color: Colors.white70,
                    ),
                    title: Text(
                      'Subscription Plans',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.normal),
                    ),
                    onTap: () => Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.rightToLeft,
                            child: Subscriptionplans()))),
              /*if(checklogin)
                      ListTile(
                          leading: Icon(Icons.menu_book,color: Colors.white70),
                          title: Text('My Couponcode',style: TextStyle(color: Colors.white,fontWeight: FontWeight.normal)),
                          onTap: () =>
                                       Navigator.push(context,
                                       PageTransition(type:
                                       PageTransitionType.rightToLeft, child: Couponcode()))..whenComplete(() =>   Navigator.of(context).pop())
                      ),*/
              // if(checklogin)
              ListTile(
                  leading: Icon(Icons.contact_phone, color: Colors.white70),
                  title: Text('Contact Page',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.normal)),
                  onTap: () => Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.rightToLeft,
                          child: Contact()))),
//
              if (checklogin)
                ListTile(
                    leading: Icon(Icons.logout, color: Colors.white70),
                    title: Text('Logout',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.normal)),
                    onTap: showMyDialog),
              /*ListTile(
                leading: Icon(Icons.thirteen_mp, color: Colors.white70),
                title: Text('otptesting',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.normal)),
                onTap: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.rightToLeft,
                          child: otpmsg()));
                },
              ),*/
              if (checksignbutton)
                ListTile(
                  leading: Icon(Icons.login, color: Colors.white70),
                  title: Text('Login',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.normal)),
                  onTap: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.rightToLeft,
                            child: NewLogin()));
                  },
                ),
              if (loader)
                Center(
                  child: CircularProgressIndicator(),
                ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleMenuButtonPressed() {
    // NOTICE: Manage Advanced Drawer state through the Controller.
    // _advancedDrawerController.value = AdvancedDrawerValue.visible();
    _advancedDrawerController.showDrawer();
  }
}
