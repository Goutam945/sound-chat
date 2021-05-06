import 'dart:io';
import 'dart:ui';
import 'package:audioplayers/audioplayers.dart';
import 'package:sound_chat/api/allproduct.dart';
import 'package:sound_chat/api/couponcode.dart';
import 'package:sound_chat/api/homeslider.dart';
import 'package:sound_chat/api/termsofservices.dart';
import 'package:sound_chat/common/index.dart';
import 'package:sound_chat/screens/InetrviewvideoplayStudio.dart';
import 'package:shimmer/shimmer.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

SharedPreferences localStorage;

class _HomeScreenState extends State<HomeScreen> with WidgetsBindingObserver {
  int id;

  _loadSavedData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      if (sharedPreferences.getString('email') != null &&
          sharedPreferences.getString('email').isNotEmpty) {
        id = sharedPreferences.getInt('id');
        email = sharedPreferences.getString('email');
        name = sharedPreferences.getString('name');
      }
    });
  }

  _addVideoOverlay() {
    OverlayService().addVideosOverlay(context, VideoPlayerPage());
  }

  String email;
  String name;
  String data;
  bool listen = true;
  bool play = true;
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

  @override
  void initState() {
    super.initState();
    _loadSavedData();
    WidgetsBinding.instance.addObserver(this);
    if (Platform.isIOS) audioPlayer.setNotification(title: "Soundchat Radio");
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
    state();
    //apis calls
    createVideoState(context);
    createScheduleState(context);
    createGalleryState(context);
    createHomesliderState(context);
    createAllproductState(context);
    createtermsState(context);
    createCoupncodeState(context);
    // createSubcriptionlevalState(id,context);
  }

  void state() {
    setState(() {
      weekday =
          DateTime.now().subtract(Duration(hours: 10, minutes: 30)).weekday - 1;
      if (weekday == -1) weekday = 6;
      day =
          DateTime.now().subtract(Duration(hours: 10, minutes: 30)).weekday - 1;
      if (day == -1) day = 6;
    });
  }

  @override
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
      if (Platform.isIOS) audioPlayer.setNotification(title: "Soundchat Radio");
    } else if (action == "pause") {
      // stream.pause();
      await audioPlayer.pause();
      MediaNotification.showNotification(
          title: 'Soundchat Radio', isPlaying: !play);
    } else if (action == "stop") {
      // stream.stop();
      await audioPlayer.stop();
    }
  }

  onPlayerErr() {
    audioPlayer.onPlayerError.listen((msg) async {
      print('audioPlayer error : $msg');
      //   Fluttertoast.showToast(
      //     msg: "Server error, trying to play...",
      //     toastLength: Toast.LENGTH_SHORT,
      //     gravity: ToastGravity.SNACKBAR,
      //   );
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
    if (Provider.of<ScheduleResponse>(context, listen: false).data != null)
      timeAndDate =
      Provider.of<ScheduleResponse>(context, listen: false).data['data'];

    if (Provider.of<HomesliderResponse>(context, listen: false).data != null)
      homeslider =
      Provider.of<HomesliderResponse>(context, listen: false).data['data'];

    //var timeAndDate =(Provider.of<ScheduleResponse>(context, listen: false).data != null)?Provider.of<ScheduleResponse>(context, listen: false).data['data']: null;
    //time show live time to changes
    if (timeAndDate != null)
      /* for (int i=0;i<timeAndDate[weekday]['shows'].length; i++) {
  startTime = timeAndDate[weekday]['shows']
  [i]['show_start_date'].split(':')[0].substring(0);
  endTime = timeAndDate[weekday]['shows']
  [i]['show_end_date'].split(':')[0].substring(0);

  // endTimeMin = timeAndDate[weekday]['shows']
  // [0]['show_end_date'].split(':')[1];

  int hour = DateTime
      .now().subtract(Duration(hours: 10,minutes: 30))
      .hour;
  if (hour >= double.parse(startTime) && hour < double.parse(endTime))
  {  show = timeAndDate[weekday]['shows']
    [i]['show_start_date'] + '-' + timeAndDate[weekday]['shows']
    [i]['show_end_date']; break;}
}*/
      for (int i = 0; i < timeAndDate[weekday]['shows'].length; i++) {
        startTime = DateTime.now()
            .subtract(Duration(hours: 10, minutes: 30))
            .toIso8601String()
            .split('T')[0] +
            ' ' +
            timeAndDate[weekday]['shows'][i]['show_start_date'];
        endTime = DateTime.now()
            .subtract(Duration(hours: 10, minutes: 30))
            .toIso8601String()
            .split('T')[0] +
            ' ' +
            timeAndDate[weekday]['shows'][i]['show_end_date'];
        DateTime a = DateTime.parse(startTime);
        DateTime b = DateTime.parse(endTime);
        DateTime c = DateTime.now().subtract(Duration(hours: 10, minutes: 30));
        if (c.isAfter(a) && c.isBefore(b)) {
          show = timeAndDate[weekday]['shows'][i]['show_start_date'] +
              '-' +
              timeAndDate[weekday]['shows'][i]['show_end_date'];
          break;
        }
      }
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
        child: Stack(
          children: [
            Scaffold(
              backgroundColor: Color(0xFF222222),
              appBar: PreferredSize(
                  preferredSize: Size.fromHeight(55),
                  child: Appbar(email, name)),
              body: SizedBox(
                height: height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: height * 0.0044,
                      width: width,
                      color: Color(0xFF780001),
                    ),
                    Expanded(
                      child: Opacity(
                          opacity: 0.7,
                          child: (homeslider != null)
                              ? Stack(
                            children: [
                              ImageFiltered(
                                imageFilter: ImageFilter.blur(
                                    sigmaY: 30, sigmaX: 30),
                                child: SizedBox.expand(
                                  child: Image.network(
                                    homeslider[imageNo]['image'],
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              CarouselSlider(
                                options: CarouselOptions(
                                  onPageChanged: (value, image) {
                                    setState(() {
                                      imageNo = value;
                                    });
                                  },
                                  height: double.infinity,
                                  autoPlay: true,
                                  enlargeCenterPage: true,
                                  viewportFraction: 1,
                                  autoPlayInterval: Duration(seconds: 4),
                                  autoPlayAnimationDuration:
                                  Duration(seconds: 1),
                                ),
                                items: <Widget>[
                                  for (int i = 0;
                                  i < homeslider.length;
                                  i++)
                                    Container(
                                      width: width,
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 5.0),
                                      child: CachedNetworkImage(
                                        imageUrl: homeslider[i]['image'],
                                        fit: BoxFit.contain,
                                        placeholder: (context, url) =>
                                            SizedBox(
                                              width: width,
                                              height: double.infinity,
                                              child: Shimmer.fromColors(
                                                  baseColor: Colors.red,
                                                  highlightColor:
                                                  Colors.yellow,
                                                  child: Container(
                                                    color: Colors.black12,
                                                  )),
                                            ),
                                        errorWidget:
                                            (context, url, error) =>
                                            Icon(Icons.error),
                                      ),
                                    ),
                                ],
                              ),
                            ],
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
                          )),
                    ),
                    listen
                        ? Container(
                      margin: EdgeInsets.only(right: width * 0.2),
                      color: Colors.black,
                      height: height * 0.04389,
                      child: Center(
                        child: Text("NOW STREAMING",
                            style: TextStyle(
                                color: Color(0xFF780001),
                                fontSize: 16,
                                // fontStyle: FontStyle.italic,
                                letterSpacing: 5)),
                      ),
                    )
                        : Container(
                      margin: EdgeInsets.only(right: width * 0.2),
                      color: Colors.black,
                      height: height * 0.04389,
                      child: Center(
                        child: Text(
                          "NOW PLAYING",
                          style: TextStyle(
                              color: Color(0xFF780001),
                              fontSize: 16,
                              // fontStyle: FontStyle.italic,
                              letterSpacing: 5),
                        ),
                      ),
                    ),
                    listen
                        ? Container(
                      color: Color(0xFF780001),
                      constraints:
                      BoxConstraints.expand(height: height * 0.1842),
                      child: Stack(
                        children: [
                          Positioned(
                            top: height * 0.0192,
                            child: Container(
                              height: height * 0.142,
                              color: Color(0xFF111111),
                              width: width * 0.5347,
                            ),
                          ),
                          Positioned(
                            top: height * 0.036,
                            left: width * 0.070,
                            child: Text(
                              "THIS AND EVERY",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                // fontStyle: FontStyle.italic,
                              ),
                            ),
                          ),
                          Positioned(
                            left: width * 0.5347,
                            child: Container(
                              height: height * 0.1843,
                              width: width * 0.4583,
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: <Color>[
                                        Color(0xFFC65706),
                                        Color(0xFFC5C701)
                                      ])),
                            ),
                          ),
                          Positioned(
                            left: width * 0.5551,
                            top: height * 0.0105,
                            child: Container(
                              height: height * 0.1646,
                              width: width * 0.4201,
                              color: Color(0xFF374B6E),
                            ),
                          ),
                          Positioned(
                            left: width * 0.6493,
                            top: height * 0.0268,
                            child: Container(
                              width: width * 0.2337,
                              height: height * 0.1353,
                              child: CircleAvatar(
                                backgroundImage:
                                AssetImage("assets/imgpodcast.png"),
                              ),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xFF374B6E)),
                            ),
                          ),
                          Positioned(
                            top: height * 0.073,
                            left: width * 0.070,
                            child: (timeAndDate != null)
                                ? Container(
                              child: Text(
                                  timeAndDate[weekday]['post_title']
                                      .toString(),
                                  style: TextStyle(
                                    color: Color(0xFFFFFEFF),
                                    fontSize: 23,
                                  )),
                            )
                                : Shimmer.fromColors(
                              baseColor: Colors.black12,
                              highlightColor: Colors.grey[600],
                              child: Container(
                                  width: width * 0.35,
                                  height: height * 0.06,
                                  color: Colors.black),
                            ),
                          ),
                          //for (int j = 0; j < timeAndDate[weekday]['shows'].length; j++)
                          if (timeAndDate != null)
                            Positioned(
                              top: height * 0.1143,
                              left: width * 0.070,
                              child: Container(
                                child: Text(show.toString(),
                                    style: TextStyle(
                                        color: Color(0xFFFFFEFF),
                                        fontSize: 15,
                                        fontStyle: FontStyle.italic)),
                              ),
                            )
                          // : Center(
                          //     child: CircularProgressIndicator()),
                        ],
                      ),
                    )
                        : Container(
                      color: Color(0xFF780001),
                      constraints:
                      BoxConstraints.expand(height: height * 0.1842),
                      child: Stack(
                        children: [
                          Positioned(
                            top: height * 0.0192,
                            child: Container(
                              height: height * 0.142,
                              color: Color(0xFF111111),
                              width: width * 0.5347,
                            ),
                          ),
                          Positioned(
                            top: height * 0.032,
                            left: width * 0.0491,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: width * 0.1655,
                                  height: height * 0.0856,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color(0xFFe0f2f1)),
                                  child: Container(
                                    margin: EdgeInsets.all(5),
                                    width: width * 0.1400,
                                    height: height * 0.0724,
                                    child: GestureDetector(
                                      child: Icon(
                                          stop
                                              ? (play
                                              ? Icons.play_arrow_sharp
                                              : Icons.pause)
                                              : Icons.stop,
                                          size: 45,
                                          color: Color(0xFFFFFEFF)),
                                      onTap: () {
                                        setState(() {
                                          play = !play;
                                        });
                                        play
                                            ? callAudio("pause")
                                            : callAudio("start");
                                      },
                                    ),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Color(0xFFFF3334)),
                                  ),
                                ),
                                SizedBox(
                                  width: width * 0.3,
                                  child: ElevatedButton(
                                    child: Text(
                                      !play ? "PLAYING" : "STOP",
                                      style:
                                      TextStyle(color: Colors.white),
                                    ),
                                    onPressed: () {
                                      callAudio("stop");
                                    },
                                    style: ButtonStyle(
                                      backgroundColor:
                                      MaterialStateProperty
                                          .resolveWith<Color>(
                                              (Set<MaterialState>
                                          states) {
                                            return Color(
                                                0xff780001); // Use the component's default.
                                          }),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Positioned(
                            left: width * 0.5347,
                            child: Container(
                              height: height * 0.1843,
                              width: width * 0.4583,
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: <Color>[
                                        Color(0xFFC65706),
                                        Color(0xFFC5C701)
                                      ])),
                            ),
                          ),
                          Positioned(
                            left: width * 0.5551,
                            top: height * 0.0105,
                            child: Container(
                              height: height * 0.1646,
                              width: width * 0.4201,
                              color: Color(0xFF374B6E),
                            ),
                          ),
                          Positioned(
                            top: height * 0.0302,
                            left: width * 0.6365,
                            child: Container(
                              width: width * 0.2291,
                              height: height * 0.1185,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xFF253959)),
                              child: Container(
                                width: width * 0.2037,
                                height: height * 0.1053,
                                child: CircleAvatar(
                                  backgroundImage:
                                  AssetImage("assets/pic.jpg"),
                                ),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xFF374B6E)),
                              ),
                            ),
                          ),
                          Positioned(
                            top: height * 0.1283,
                            left: width * 0.03,
                            child: Row(
                              children: [
                                Text(
                                  "SCHEDULE: ",
                                  style: TextStyle(
                                    color: Color(0xFFC66E3A),
                                    fontSize: 14,
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                                Text(show.toString(),
                                    style: TextStyle(
                                        color: Color(0xFFFFFEFF),
                                        fontSize: 14,
                                        fontStyle: FontStyle.italic))
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        margin: EdgeInsets.only(right: width * 0.2),
                        color: Colors.black,
                        height: height * 0.0366,
                        child: Center(
                          child: Text("RECENT INTERVIEWS",
                              style: TextStyle(
                                  color: Color(0xFF780001),
                                  fontSize: 14,
                                  // fontStyle: FontStyle.italic,
                                  letterSpacing: 4)),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10.0),
                      width: width * 1.01998,
                      color: Color(0xFF222222),
                      child: (superherosLength != null)
                          ? SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceEvenly,
                          children: [
                            for (int i = 0;
                            i <
                                superherosLength['free_content']
                                    .length;
                            i++)
                              Row(
                                children: [
                                  Container(
                                      child: SizedBox(
                                          width: 80,
                                          height: 60,
                                          child: ClipRRect(
                                              borderRadius:
                                              BorderRadius.circular(
                                                  10),
                                              child: GestureDetector(
                                                child: CachedNetworkImage(
                                                  imageUrl: superherosLength[
                                                  'free_content']
                                                  [i]['featured_img'],
                                                  fit: BoxFit.cover,
                                                  placeholder: (context,
                                                      url) =>
                                                      Center(
                                                          child:
                                                          CircularProgressIndicator()),
                                                  errorWidget: (context,
                                                      url, error) =>
                                                      Icon(Icons.error),
                                                ),
                                                onTap: () {
                                                  Navigator.of(context).push(MaterialPageRoute(
                                                      builder: (context) => InterviewNewPlayer(
                                                          superherosLength[
                                                          'free_content'][i]
                                                          [
                                                          'free_video_url'],
                                                          superherosLength[
                                                          'free_content'][i]
                                                          [
                                                          'post_title'])));
                                                  setState(() {
                                                    play = true;
                                                  });
                                                  callAudio("pause");
                                                },
                                              )))),
                                  SizedBox(
                                    width: 10,
                                  ),
                                ],
                              ),
                          ],
                        ),
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
                    Container(
                      height: height * 0.085,
                      color: Color(0xFF780001),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 5, bottom: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            GestureDetector(
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.home,
                                    size: width * 0.1,
                                    color: Color(0xFFE18D13),
                                  ),
                                  Text(
                                    "HOME",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16),
                                  ),
                                ],
                              ),
                              onTap: () {
                                setState(() {
                                  listen = true;
                                });
                              },
                            ),
                            VerticalDivider(
                              thickness: 1,
                              color: Color(0xFFB71613),
                            ),
                            GestureDetector(
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.radio,
                                    size: width * 0.1,
                                    color: Color(0xFFE18D13),
                                  ),
                                  Text(
                                    "LISTEN",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16),
                                  ),
                                ],
                              ),
                              onTap: () {
                                MediaNotification.showNotification(
                                    title: 'Soundchat Radio');
                                setState(() {
                                  listen = false;
                                  play = false;
                                });
                                callAudio("start");
                              },
                            ),
                            VerticalDivider(
                              thickness: 1,
                              color: Color(0xFFB71613),
                            ),
                            GestureDetector(
                              child: Row(
                                children: [
                                  Icon(Icons.live_tv,
                                      size: width * 0.1,
                                      color: Color(0xFFE18D13)),
                                  Text(
                                    "WATCH",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16),
                                  ),
                                ],
                              ),
                              onTap: () {
                                _addVideoOverlay();
                                setState(() {
                                  play = true;
                                });
                                callAudio("pause");
                              },
                            ),
                            GestureDetector(
                                child: Icon(
                                  Icons.more_vert,
                                  size: width * 0.12,
                                  color: Colors.white,
                                ),
                                // padding: EdgeInsets.only(bottom: 30),
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => NewMenuScreen()));
                                }),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: AppBar().preferredSize.height * 0.2,
              left: 0,
              right: 0,
              child: SizedBox(
                height: 90,
                width: 90,
                child: Image.asset(
                  'assets/soundpic.png',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class YoutubeVideo extends StatefulWidget {
  final videoURL;

  YoutubeVideo(this.videoURL);

  @override
  _VideoState createState() => _VideoState();
}

class _VideoState extends State<YoutubeVideo> {
  YoutubePlayerController _controller;

  @override
  void initState() {
    _controller = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(widget.videoURL),
        flags: YoutubePlayerFlags());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Tv Interviews"),
        backgroundColor: Color(0xFFE18D13),
        leading: Builder(builder: (BuildContext context) {
          return IconButton(
            icon: Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
              size: 25,
            ),
            onPressed: () {
              SystemChrome.setPreferredOrientations([
                DeviceOrientation.portraitUp,
                DeviceOrientation.portraitDown
              ]);
              Navigator.of(context).pop();
            },
          );
        }),
      ),
      body: Center(
        child: YoutubePlayerBuilder(
          player: YoutubePlayer(
            controller: _controller,
            aspectRatio: 16 / 9,
            showVideoProgressIndicator: true,
          ),
          builder: (context, player) {
            return Column(
              children: <Widget>[
                player,
                SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  child: Container(
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: <Widget>[],
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
