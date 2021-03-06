import 'dart:io';
import 'dart:ui';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:sound_chat/api/audiovideo_url.dart';
import 'package:sound_chat/common/index.dart';

class Listenlivepage extends StatefulWidget {
  const Listenlivepage({Key key}) : super(key: key);

  @override
  _ListenlivepageState createState() => _ListenlivepageState();
}

class _ListenlivepageState extends State<Listenlivepage>
    with WidgetsBindingObserver {
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
  bool stop = true;
  String status = 'hidden';
  int weekday;
  int imageNo = 0;
  bool isButtonPressed = false;
  int showtime = 0;
  String audioUrl = '';
  var scheduleapi;
  @override
  void initState() {
    super.initState();
    _loadSavedData().then((value) => createSubcriptionlevalState(id, context));
    WidgetsBinding.instance.addObserver(this);
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
    scheduleapi = createScheduleState(context);
    state();
    createAudiovideoUrlsState(context).then((value) {
      audioUrl = value.data['data'][0]['livelink'];
    });
  }

  void state() {
    setState(() {
      weekday =
          7 - DateTime.now().subtract(Duration(hours: 9, minutes: 30)).weekday;
      //if (weekday == -1) weekday = 6;
      //day = 7 - DateTime.now().subtract(Duration(hours: 10, minutes: 30)).weekday;
      //if (day == -1) day = 6;
    });
  }

  void didChangeAppLifecycleState(AppLifecycleState state) {
    // Fluttertoast.showToast(msg: state.toString());
    //print('AppLifeCycle State: ' + state.toString());
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
      await audioPlayer.play(audioUrl);
      //print(audioUrl);
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
    //  print(sound);
  }

  onPlayerErr() {
    audioPlayer.onPlayerError.listen((msg) async {
      //print('audioPlayer error : $msg');
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
    // if (Provider.of<VideoResponse>(context, listen: false).data != null)
    //   superherosLength =
    //       Provider.of<VideoResponse>(context, listen: false).data['data'];
    // if (Provider.of<HomesliderResponse>(context, listen: false).data != null)
    //   homeslider =
    //       Provider.of<HomesliderResponse>(context, listen: false).data['data'];
    // if (Provider.of<ScheduleResponse>(context, listen: false).data != null)
    //   timeAndDate =
    //       Provider.of<ScheduleResponse>(context, listen: false).data['data'];

    return SafeArea(
        child: Scaffold(
      extendBody: true,
      body: Container(
        //padding: EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFF481621), Color(0xFF140F16)])),
        child: FutureBuilder(
            future: scheduleapi,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var timeAndDate = snapshot.data.data['data'];
                showtime = getschedule(context: context, data: timeAndDate);
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                        height: 230,
                        width: 230,
                        child: Container(
                          width: width * 0.8,
                          margin: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xFF7E737F).withOpacity(1.0),
                                  spreadRadius: 10,
                                  blurRadius: 10,
                                  offset: Offset(
                                      0, 0), // changes position of shadow
                                ),
                              ]),
                          child: (timeAndDate[weekday]['scheduleperdays']
                                          [showtime]['show_image'] !=
                                      null &&
                                  timeAndDate[weekday]['scheduleperdays']
                                          [showtime]['show_image'] !=
                                      "")
                              ? CachedNetworkImage(
                                  imageUrl: baseurlimagepodcast +
                                      timeAndDate[weekday]['scheduleperdays']
                                              [showtime]['show_image']
                                          .toString(),
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
                                  errorWidget: (context, url, error) => Icon(
                                    Icons.error,
                                    color: Colors.white,
                                  ),
                                )
                              : Image.asset(
                                  'assets/soundpic.png',
                                  fit: BoxFit.fill,
                                ),
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      //width: 200,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            timeAndDate[weekday]['scheduleperdays'][showtime]
                                    ['show_name']
                                .toString(),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 200,
                            child: Divider(
                              thickness: 3,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            "Soundchat Radio",
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
                                  border: Border.all(
                                      color: Colors.white, width: 2)),
                              child: Icon(Icons.stop,
                                  size: 30, color: Colors.white),
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
                                  border: Border.all(
                                      color: Colors.white, width: 2)),
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
                                  border: Border.all(
                                      color: Colors.white, width: 2)),
                              //child: Icon(Icons.volume_up_rounded, size: 30, color: Colors.white),
                              child: Icon(
                                  (sound
                                      ? Icons.volume_up_rounded
                                      : Icons.volume_off),
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
                                offset:
                                    Offset(0, 0), // changes position of shadow
                              ),
                            ]),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding:
                                  EdgeInsets.only(left: 10, right: 10, top: 2),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  for (int j = showtime;
                                      j <
                                          timeAndDate[weekday]
                                                  ['scheduleperdays']
                                              .length;
                                      j++)
                                    Row(
                                      children: [
                                        Column(
                                          children: [
                                            SizedBox(
                                                width: 100,
                                                height: 100,
                                                child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    child: GestureDetector(
                                                      child: (timeAndDate[weekday]
                                                                          [
                                                                          'scheduleperdays'][j]
                                                                      [
                                                                      'show_image'] !=
                                                                  null &&
                                                              timeAndDate[weekday]
                                                                          [
                                                                          'scheduleperdays'][j]
                                                                      [
                                                                      'show_image'] !=
                                                                  "")
                                                          ? CachedNetworkImage(
                                                              imageUrl: baseurlimagepodcast +
                                                                  timeAndDate[weekday]['scheduleperdays']
                                                                              [
                                                                              j]
                                                                          [
                                                                          'show_image']
                                                                      .toString(),
                                                              fit: BoxFit.fill,
                                                              placeholder: (context,
                                                                      url) =>
                                                                  Center(
                                                                      child:
                                                                          CircularProgressIndicator()),
                                                              errorWidget:
                                                                  (context, url,
                                                                          error) =>
                                                                      Icon(
                                                                Icons.error,
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                            )
                                                          : Container(
                                                              color: Color(
                                                                  0xff324a69),
                                                              child:
                                                                  Image.asset(
                                                                'assets/soundpic.png',
                                                                fit:
                                                                    BoxFit.fill,
                                                              ),
                                                            ),
                                                      onTap: () {
                                                        Navigator.push(
                                                            context,
                                                            PageTransition(
                                                                type: PageTransitionType
                                                                    .rightToLeft,
                                                                child: (email ==
                                                                        null)
                                                                    ? NewLogin()
                                                                    : PodcastPlayCloud(
                                                                        j,
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
                        )),
                    SizedBox(
                      height: 15,
                    )
                  ],
                );
              }
              if (snapshot.hasError) {
                return Errorwidget(
                  onTap: () {
                    setState(() {
                      createScheduleState(context);
                    });
                  },
                );
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            }),
      ),
    ));
  }
}
