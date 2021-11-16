import 'dart:io';
import 'package:audioplayers/audioplayers.dart';
import 'package:sound_chat/common/index.dart';
import 'package:sound_chat/screens/firebase.dart';

class HomeBottomBar extends StatefulWidget {
  @override
  _HomeBottomBarState createState() => new _HomeBottomBarState();
}

class _HomeBottomBarState extends State<HomeBottomBar>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    _loadSavedData();
    firebase(context);
  }

  @override
  void dispose() {
    // _pageController.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print('AppLifeCycle State: ' + state.toString());
    switch (state) {
      case AppLifecycleState.detached:
        exit(0);
        break;
      default:
        break;
    }
  }

  AudioPlayer audioPlayer = new AudioPlayer(
      playerId: 'Soundchat Radio', mode: PlayerMode.MEDIA_PLAYER);
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

  Future<bool> _onBackPressed() {
    return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Confirm'),
              content: Text('Do you want to exit the App'),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              actions: <Widget>[
                TextButton(
                  child: Text('No'),
                  onPressed: () {
                    Navigator.of(context).pop(false); //Will not exit the App
                  },
                ),
                TextButton(
                  child: Text('Yes'),
                  onPressed: () {
                    Navigator.of(context).pop(true);
                    exit(0); //Will exit the App
                  },
                )
              ],
            );
          },
        ) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> tabPages = [
      Updatehome(),
      Listenlivepage(),
      LiveVideo(),
      NewMenupage()
    ];
    if (Provider.of<SubcriptionlevalResponse>(context, listen: false).data !=
        null)
      data = Provider.of<SubcriptionlevalResponse>(context, listen: false)
          .data['response'];
    return WillPopScope(
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
        child: WillPopScope(
          onWillPop: _onBackPressed,
          child: Scaffold(
              extendBody: true,
              bottomNavigationBar: CurvedNavigationBar(
                backgroundColor: Color(0xFF1C232D),
                color: Color(0xFF111111),
                buttonBackgroundColor: Color(0xFF1C232D),
                animationCurve: Curves.easeInOut,
                height: 65,
                index: pageIndex,
                /* items: <Widget>[
                  Image.asset(
                    'assets/home.png',scale: 2,
                  ),
                  Image.asset(
                    'assets/pastshows.png',scale: 2
                  ),
                  Image.asset(
                    'assets/flashbacktv.png',scale: 2
                  ),
                  Image.asset(
                    'assets/more.png',scale: 2
                  ),
                 // Icon(Icons.mic, size: 25,color:Colors.white),
                 // Icon(Icons.live_tv_outlined, size: 25,color:Colors.white),
                ],*/
                items: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/home.png",
                        scale: 2.5,
                      ),
                      Text(
                        'Home',
                        style: TextStyle(
                            fontSize: 11,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/pastshows.png",
                        scale: 2.5,
                      ),
                      Text(
                        'Listen',
                        style: TextStyle(
                          fontSize: 11,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/flashbacktv.png",
                        scale: 2.5,
                      ),
                      Text(
                        'Watch',
                        style: TextStyle(
                            fontSize: 11,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/more.png",
                        scale: 2.5,
                      ),
                      Text(
                        'More',
                        style: TextStyle(
                            fontSize: 11,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ],
                onTap: (index) {
                  setState(() {
                    pageIndex = index;
                  });
                  if (!Provider.of<OverlayHandlerProvider>(context,
                              listen: false)
                          .inPipMode &&
                      !pipDisabled &&
                      pageIndex != 2) addVideosOverlay(context);
                },
              ),
              body: tabPages[pageIndex]),
        ),
      ),
    );
  }
}
