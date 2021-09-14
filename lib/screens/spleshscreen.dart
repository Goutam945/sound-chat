import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:sound_chat/api/couponcode.dart';
import 'package:sound_chat/api/homeslider.dart';
import 'package:sound_chat/api/membership.dart';
import 'package:sound_chat/api/phoneinterview.dart';
import 'package:sound_chat/api/termsofservices.dart';
import 'package:sound_chat/common/index.dart';

import 'homebottomBar.dart';
class SpleshScreen extends StatefulWidget {
  @override
  SplashScreenState createState() => SplashScreenState();
}
class SplashScreenState extends State<SpleshScreen> {
  String email;
  String name;
  int id;
  int sliderid;

  @override
  void initState() {
    final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
    _firebaseMessaging.getToken().then((token) {
      // createFCMTokenState(token);
      print('token: $token');
    });
    createVideoState(context);
    createPhoneinterviewState(context);
    createScheduleState(context);
    createGalleryState(context);
    createHomesliderState(sliderid,context);
    createtermsState(context);
    createMembershipState(context);
    createCoupncodeState(context);
    createCoupncodeState(context);
    _loadSavedData();
    super.initState();
    /*Timer(
        Duration(seconds: 10),
        () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    (email == null) ? DesignLogin() : HomeScreen())));*/
    Timer(
        Duration(seconds: 5),
            () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => HomeBottomBar())));

  }

  _loadSavedData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      if (sharedPreferences.getString('email') != null &&
          sharedPreferences.getString('email').isNotEmpty) {
        email = sharedPreferences.getString('email');
        name = sharedPreferences.getString('name');
        id = sharedPreferences.getInt('id');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(extendBody: true,
      bottomNavigationBar: Text("© Copyright 2021 Irish & Chin Inc.",textAlign: TextAlign.center,
          style: TextStyle(height: 5,
            fontSize: 15,
            fontWeight: FontWeight.normal,
            color: Colors.black87,
            fontFamily: 'Montserrat1',
            decoration: TextDecoration.none,
          )),
      body: Center(
        child: Image.asset(
          'assets/soundpic.png',
          alignment: Alignment.center,
          width: width * 0.7778,
        ),
      ),
    );
  }
}
