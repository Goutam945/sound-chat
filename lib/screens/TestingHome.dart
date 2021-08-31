import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:sound_chat/api/all%20_orders.dart';
import 'package:sound_chat/api/cancel_subcription.dart';
import 'package:sound_chat/api/subcribtion_lable.dart';
import 'package:sound_chat/common/appConfig.dart';
import 'package:sound_chat/common/index.dart';
import 'ContactAs.dart';
import 'ListenRadio.dart';
import 'Myaccountprofile.dart';
import 'NewLogin.dart';
import 'OrderTracking.dart';
import 'SocketExample.dart';
import 'Subcriptionplans.dart';
import 'TermsConditions.dart';
import 'UpdateHome.dart';
class MyBottomBarDemo extends StatefulWidget {
  @override
  _MyBottomBarDemoState createState() => new _MyBottomBarDemoState();
}

class _MyBottomBarDemoState extends State<MyBottomBarDemo> with WidgetsBindingObserver {

  List<Widget> tabPages = [
   // ListenRadio(),
    Updatehome(),
    AllHomeInterview(),
    PodcastSchedule(),
   // Shopping(),
    Container(),
    GalleryDesign(),

  ];
  @override
  void initState(){
    super.initState();
    _loadSavedData();
  }
  @override
  void dispose() {
   // _pageController.dispose();
    super.dispose();
  }

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
       // Navigator.of(context).pop();
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => MyBottomBarDemo()));
      },
      btnOkOnPress: () {
        remove();
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => MyBottomBarDemo()));
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

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    if (Provider.of<SubcriptionlevalResponse>(context, listen: false).data != null)
      data = Provider.of<SubcriptionlevalResponse>(context, listen: false).data['response'];
    return AdvancedDrawer(
      backdropColor: Color(0xFF111111),
      controller: _advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 700),
      childDecoration: const BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(16)),
      ),

      child: WillPopScope(
        onWillPop: () async {
          if (Provider.of<OverlayHandlerProvider>(context, listen: false)
              .overlayActive) {
            Provider.of<OverlayHandlerProvider>(context, listen: false)
                .enablePip(1.77);
            return false;
          }
          return true;
        },
        child: SafeArea(
          child: Scaffold(
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
                actions: [
                  /*IconButton(
                    icon: Padding(
                      padding: const EdgeInsets.only(right: 5),
                      child: Icon(Icons.chat, size: 30,color:Colors.white ,),
                      // Image.asset(
                      //   'assets/chat.png',
                      // ),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType
                                  .rightToLeft,
                              child: (email == null)
                                  ? NewLogin()
                                  : LivechatRoom()));
                    },
                  ),*/
                ],
              ),

            bottomNavigationBar:CurvedNavigationBar(
              backgroundColor: Color(0xFF2F3F51),
              color: Color(0xFFE18D13),
              buttonBackgroundColor:Color(0xFFE18D13),
              animationCurve: Curves.easeInOut,
              height: 60,
              index:pageIndex ,
              items: <Widget>[
                Icon(Icons.home, size: 25,color:Colors.white,),
                Icon(Icons.tv_outlined, size: 25,color:Colors.white),
                Image.asset(
                  'assets/micro.png',scale: 20,
                  color:Colors.white,
                ),
                Icon(Icons.live_tv_outlined, size: 25,color:Colors.white),
                Icon(CupertinoIcons.photo_fill_on_rectangle_fill, size: 25,color:Colors.white),
              ],
              onTap: (index) {

                 switch(index){
                  case 3:
                     OverlayService().addVideosOverlay(context, VideoPlayerPage());
                     setState(() {
                       pageIndex=0;
                       index=0;

                     });
                     break;
                 }
                setState(() {
                  pageIndex=index;
                });
              },
            ),

            body:tabPages[pageIndex]
          ),
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
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    CircleAvatar(
                      backgroundImage: NetworkImage('https://pixel.nymag.com/imgs/daily/vulture/2017/06/14/14-tom-cruise.w700.h700.jpg'),
                      radius: 40.0,
                    ),
                    Text(name.toString(),style: TextStyle(color: Colors.white,fontSize: titlefontsize),),
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
                          color: Colors.white, fontWeight: FontWeight.normal,fontSize: subtitlefontsize)),
                  onTap: () => {
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
                          color: Colors.white,fontSize: subtitlefontsize)),
                 /* onTap: () => {
                    setState(() {
                      loader = true;
                    }),
                    createAllOrderState(id, context).whenComplete(() {
                      setState(() {
                        loader = false;
                      });
                    }),
                  },*/
                ),
              if (checklogin)
                ListTile(
                  leading: Icon(Icons.location_on, color: Colors.white70),
                  title: Text('Order Tracking',
                      style: TextStyle(
                          color: Colors.white,fontSize: subtitlefontsize)),
                  /*onTap: () => {
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.rightToLeft,
                            child: StepperDemo())),
                  },*/
                ),
              if (checklogin)
                ListTile(
                  leading: Icon(Icons.subscriptions, color: Colors.white70),
                  title: Text('Cancel Subscription',
                      style: TextStyle(
                          color: Colors.white,fontSize: subtitlefontsize)),
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
                      color: Colors.white, fontSize: subtitlefontsize),
                ),
               /* onTap: () => {
                  Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.rightToLeft,
                          child: ChatPage()))
                },*/
              ),
              // if(checklogin)
              ListTile(
                  leading: Icon(Icons.inbox, color: Colors.white70),
                  title: Text('Terms & Condition',
                      style: TextStyle(
                          color: Colors.white,fontSize: subtitlefontsize)),
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
                          color: Colors.white,fontSize: subtitlefontsize),
                    ),
                    onTap: () => Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.rightToLeft,
                            child: Subscriptionplans()))),
              // if(checklogin)
              ListTile(
                  leading: Icon(Icons.contact_phone, color: Colors.white70),
                  title: Text('Contact Page',
                      style: TextStyle(
                          color: Colors.white,fontSize: subtitlefontsize)),
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
                            fontSize: subtitlefontsize)),
                    onTap: showMyDialog),
              if (checksignbutton)
                ListTile(
                  leading: Icon(Icons.login, color: Colors.white70),
                  title: Text('Login',
                      style: TextStyle(
                          color: Colors.white,fontSize: subtitlefontsize)),
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
  void _handleMenuButtonPressed() {;
    _advancedDrawerController.showDrawer();
  }
}