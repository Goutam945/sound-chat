import 'dart:io';
import 'dart:ui';
import 'package:audioplayers/audioplayers.dart';
import 'package:sound_chat/common/index.dart';

class Listenlivepage extends StatefulWidget {
  const Listenlivepage({Key key}) : super(key: key);

  @override
  _ListenlivepageState createState() => _ListenlivepageState();
}

class _ListenlivepageState extends State<Listenlivepage> {
  int id;

  Future<int> _loadSavedData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      if (sharedPreferences.getString('email') != null &&
          sharedPreferences.getString('email').isNotEmpty) {
        email = sharedPreferences.getString('email');
        name = sharedPreferences.getString('name');
        id = sharedPreferences.getInt('id');
      }
    });
    return id;
  }

  String email;
  String name;
  String data;
  bool listen = true;

  // bool play = true;
  bool stop = true;
  String status = 'hidden';
  var superherosLength;
  var timeAndDate;
  int day;
  int weekday;
  int time;
  var startTime;
  var endTime;
  var endTimeMin;
  String show = '22:00-23:59';
  var homeslider;
  int imageNo = 0;
  bool isButtonPressed = false;
  var upcomingshow;

  @override
  void initState() {
    super.initState();
    _loadSavedData().then((value) => createSubcriptionlevalState(id, context));
    // WidgetsBinding.instance.addObserver(this);
    if (Platform.isIOS)
      audioPlayer.notificationService.setNotification(title: "Soundchat Radio");
    onPlayerErr();
    MediaNotification.setListener('pause', () {
      callAudio("pause");
      // stream.pause();
      setState(() {
        play = true;
      });
    });
    MediaNotification.setListener('play', () {
      callAudio("start");
      //stream.play('https://s2.voscast.com:9059/stream');
      // stream.start();
      setState(() {
        play = false;
      });
    });
    //apis calls
    createVideoState(context);
    createPhoneinterviewState(context);
    createScheduleState(context);
    createGalleryState(context);
    createHomesliderState(context);
    createAllproductState(context);
    createtermsState(context);
    createCoupncodeState(context);
    state();
  }

  void state() {
    setState(() {
      weekday =
          7 - DateTime.now().subtract(Duration(hours: 10, minutes: 30)).weekday;
      //if (weekday == -1) weekday = 6;
      day =
          7 - DateTime.now().subtract(Duration(hours: 10, minutes: 30)).weekday;
      //if (day == -1) day = 6;
    });
  }

  void didChangeAppLifecycleState(AppLifecycleState state) {
    // Fluttertoast.showToast(msg: state.toString());
    print('AppLifeCycle State: ' + state.toString());
    switch (state) {
      case AppLifecycleState.detached:
        exit(0);
        break;
      default:
        break;
    }
  }

  // AudioStream stream = new AudioStream('https://s2.voscast.com:9059/stream');
  AudioPlayer audioPlayer = new AudioPlayer(
      playerId: 'Soundchat Radio', mode: PlayerMode.MEDIA_PLAYER);

  Future<void> callAudio(String action) async {
    if (action == "start") {
      // stream.start();
      await audioPlayer.play("https://s2.voscast.com:9059/stream");
      MediaNotification.showNotification(
          title: 'Soundchat Radio', isPlaying: !play);
      if (Platform.isIOS)
        audioPlayer.notificationService
            .setNotification(title: "Soundchat Radio");
    } else if (action == "pause") {
      // stream.pause();
      await audioPlayer.pause();
      MediaNotification.showNotification(
          title: 'Soundchat Radio', isPlaying: !play);
    } else if (action == "stop") {
      // stream.stop();
      await audioPlayer.stop();
    }
    !sound ? audioPlayer.setVolume(0) : audioPlayer.setVolume(1);
    print(sound);
  }

  onPlayerErr() {
    audioPlayer.onPlayerError.listen((msg) async {
      print('audioPlayer error : $msg');
      await audioPlayer.pause();
      if (mounted) {
        setState(() => play = true);
      } else {
        play = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    if (Provider.of<VideoResponse>(context, listen: false).data != null)
      superherosLength =
          Provider.of<VideoResponse>(context, listen: false).data['data'];
    if (Provider.of<HomesliderResponse>(context, listen: false).data != null)
      homeslider =
          Provider.of<HomesliderResponse>(context, listen: false).data['data'];
    if (Provider.of<ScheduleResponse>(context, listen: false).data != null)
      upcomingshow =
          Provider.of<ScheduleResponse>(context, listen: false).data['data'];
    return SafeArea(
        child: Scaffold(
      extendBody: true,
      body: Container(
        padding: EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFF481621), Color(0xFF140F16)])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 230,
              width: 230,
              child: (homeslider != null)
                  ? Container(
                      width: width * 0.8,
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xFF7E737F).withOpacity(1.0),
                              spreadRadius: 10,
                              blurRadius: 10,
                              offset:
                                  Offset(0, 0), // changes position of shadow
                            ),
                          ]),
                      child: CachedNetworkImage(
                        imageUrl:
                            "https://soundchatradio.com/wp-content/uploads/2021/01/supa-fridge-1024x1024.jpg",
                        fit: BoxFit.fill,
                        placeholder: (context, url) => SizedBox(
                          width: width,
                          height: double.infinity,
                          child: Shimmer.fromColors(
                              baseColor: Colors.red,
                              highlightColor: Colors.yellow,
                              child: Container(
                                color: Colors.black12,
                              )),
                        ),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    )
                  : Shimmer.fromColors(
                      baseColor: Colors.black12,
                      highlightColor: Colors.grey[600],
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        color: Colors.black,
                        width: width * 0.95,
                        height: height * 0.5,
                      ),
                    ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              //width: 200,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "SoundChat Talk Show",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    width: 200,
                    child: Divider(
                      thickness: 3,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "with Chin,Iron Voice & Sherry Morgon ",
                    style: TextStyle(
                      color: Colors.white54,
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    child: Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 2)),
                      child: Icon(Icons.stop, size: 30, color: Colors.white),
                    ),
                    onTap: () {
                      setState(() {
                        play = true;
                      });
                      callAudio("pause");
                    },
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    child: Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 2)),
                      child: Icon(
                          stop
                              ? (play ? Icons.play_arrow : Icons.pause)
                              : Icons.stop,
                          size: 50,
                          color: Color(0xFFFFFEFF)),
                    ),
                    onTap: () {
                      setState(() {
                        play = !play;
                      });
                      play ? callAudio("pause") : callAudio("start");
                    },
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    child: Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 2)),
                      //child: Icon(Icons.volume_up_rounded, size: 30, color: Colors.white),
                      child: Icon(
                          (sound ? Icons.volume_up_rounded : Icons.volume_off),
                          size: 30,
                          color: Color(0xFFFFFEFF)),
                    ),
                    onTap: () {
                      sound
                          ? audioPlayer.setVolume(0)
                          : audioPlayer.setVolume(1);
                      setState(() {
                        sound = !sound;
                      });
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              margin: EdgeInsets.only(left: 10, right: 10),
              width: width * 1.01998,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xFF0F0810),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFF7E737F).withOpacity(1.0),
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: Offset(0, 0), // changes position of shadow
                    ),
                  ]),
              child: (upcomingshow != null)
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 10, right: 10, top: 2),
                          margin: EdgeInsets.only(right: width * 0.5),
                          color: Colors.black,
                          height: height * 0.0366,
                          child: Text("Upcoming Shows",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: fontfamily)),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              for (int i = 0;
                                  i < upcomingshow[day]['shows'].length;
                                  i++)
                                Row(
                                  children: [
                                    Column(
                                      children: [
                                        SizedBox(
                                            width: 110,
                                            height: 90,
                                            child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                child: GestureDetector(
                                                  child: CachedNetworkImage(
                                                    imageUrl:
                                                        "https://soundchatradio.com/wp-content/uploads/2021/01/supa-fridge-1024x1024.jpg",
                                                    fit: BoxFit.fill,
                                                    placeholder: (context,
                                                            url) =>
                                                        Center(
                                                            child:
                                                                CircularProgressIndicator()),
                                                    errorWidget:
                                                        (context, url, error) =>
                                                            Icon(Icons.error),
                                                  ),
                                                  onTap: () {
                                                    Navigator.push(
                                                        context,
                                                        PageTransition(
                                                            type:
                                                                PageTransitionType
                                                                    .rightToLeft,
                                                            child: (email ==
                                                                    null)
                                                                ? NewLogin()
                                                                : PodcastPlayCloud(
                                                                    i,
                                                                    weekday)));
                                                  },
                                                ))),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                  ],
                                ),
                            ],
                          ),
                        ),
                      ],
                    )
                  : Center(
                      child: Shimmer.fromColors(
                        baseColor: Colors.black12,
                        highlightColor: Colors.grey[600],
                        child: Container(
                            color: Colors.black,
                            width: width,
                            height: height * 0.1),
                      ),
                    ),
            ),
            SizedBox(
              height: 15,
            )
          ],
        ),
      ),
    ));
  }
}
