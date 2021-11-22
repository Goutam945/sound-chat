import 'package:sound_chat/api/audiovideo_url.dart';
import 'package:sound_chat/common/index.dart';
import 'package:sound_chat/screens/firebase.dart';

class SpleshScreen extends StatefulWidget {
  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SpleshScreen> {
  String email;
  String name;
  int id;

  @override
  void initState() {
    firebase(context);
    // final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
    // _firebaseMessaging.getToken().then((token) {
    //   print('token: $token');
    // });

    createtermsState(context);
    createAudiovideoUrlsState(context);

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
        Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomeBottomBar())));
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
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: Text("© Copyright 2021 Irish & Chin Inc.",
          textAlign: TextAlign.center,
          style: TextStyle(
            height: 5,
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
