import 'dart:io';
import 'dart:ui';

import 'package:shimmer/shimmer.dart';
import 'package:sound_chat/api/allproduct.dart';
import 'package:sound_chat/api/couponcode.dart';
import 'package:sound_chat/api/homeslider.dart';
import 'package:sound_chat/api/phoneinterview.dart';
import 'package:sound_chat/api/subcribtion_lable.dart';
import 'package:sound_chat/api/termsofservices.dart';
import 'package:sound_chat/common/appConfig.dart';
import 'package:sound_chat/common/index.dart';

import 'InetrviewvideoplayStudio.dart';
import 'UpdateStudioInterviewplay.dart';

class Updatehome extends StatefulWidget {
  const Updatehome({Key key}) : super(key: key);

  @override
  _UpdatehomeState createState() => _UpdatehomeState();
}

class _UpdatehomeState extends State<Updatehome> {
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

  _addVideoOverlay() {
    OverlayService().addVideosOverlay(context, VideoPlayerPage());
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
  int sliderid;
  bool isButtonPressed = false;

  @override
  void initState() {
    super.initState();
    _loadSavedData().then((value) => createSubcriptionlevalState(id, context));
    // WidgetsBinding.instance.addObserver(this);
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
    //apis calls
    createVideoState(context);
    createPhoneinterviewState(context);
    createScheduleState(context);
    createGalleryState(context);
    createHomesliderState(sliderid, context);
    createAllproductState(context);
    createtermsState(context);
    createCoupncodeState(context);
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
    !sound? audioPlayer.setVolume(0):audioPlayer.setVolume(1);
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
    return SafeArea(
        child: Scaffold(
      extendBody: true,
      body: Container(
        padding: EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Color(0xFF2F3F51), Color(0xFF3A442D)])),
        child: Column(
          children: [
            SizedBox(height: 10,),
            Expanded(
              child: Opacity(
                  opacity: 0.7,
                  child: (homeslider != null)
                      ? CarouselSlider(
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
                            autoPlayAnimationDuration: Duration(seconds: 1),
                          ),
                          items: <Widget>[
                            for (int i = 0; i < homeslider.length; i++)
                              Container(
                                width: width * 0.8,
                                margin: EdgeInsets.symmetric(horizontal: 5.0),
                                child: CachedNetworkImage(
                                  imageUrl: homeslider[i]['img'],
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
                                  errorWidget: (context, url, error) =>
                                      Icon(Icons.error),
                                ),
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
            SizedBox(height: 10,),
            SizedBox(
              width: 200,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "SoundCaht Talk Show",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  Divider(
                    thickness: 3,
                    color: Colors.white,
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
                    child: Container( padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(shape: BoxShape.circle,border:Border.all(color: Colors.white,width: 2)),
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
                  SizedBox(width: 10,),
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
                  SizedBox(width: 10,),
                  GestureDetector(
                    child: Container( padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 2)),
                      //child: Icon(Icons.volume_up_rounded, size: 30, color: Colors.white),
                      child: Icon(
                          (sound ? Icons.volume_up_rounded : Icons.volume_off),
                          size: 30,
                          color: Color(0xFFFFFEFF)),
                    ),
                    onTap: (){
                      sound? audioPlayer.setVolume(0):audioPlayer.setVolume(1);
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
              width: width * 1.01998,
              color: Color(0xFF1D2129),
              child: (superherosLength != null)
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 10, right: 10, top: 2),
                          margin: EdgeInsets.only(right: width * 0.5),
                          color: Colors.black,
                          height: height * 0.0366,
                          child: Text("RECENT INTERVIEWS",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              )),
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
                                  i < superherosLength['free_content'].length;
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
                                                    BorderRadius.circular(10),
                                                child: GestureDetector(
                                                  child: CachedNetworkImage(
                                                    imageUrl: superherosLength[
                                                            'free_content'][i]
                                                        ['feature_img'],
                                                    fit: BoxFit.cover,
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
                                                    Navigator.of(context).push(MaterialPageRoute(
                                                        builder: (context) => InterviewStudioPlayer(
                                                            superherosLength[
                                                                    'free_content']
                                                                [
                                                                i]['video_url'],
                                                            superherosLength[
                                                                    'free_content'][i]
                                                                [
                                                                'post_title'])));
                                                    setState(() {
                                                       play = true;
                                                    });
                                                     callAudio("pause");
                                                  },
                                                ))),
                                        Opacity(
                                          opacity: 0.7,
                                          child: Container(
                                              height: 20,
                                              width: 120,
                                              color: Colors.black,
                                              child: Text(
                                                superherosLength['free_content']
                                                    [i]['post_title'],
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w900,
                                                  fontFamily: 'Montserrat',
                                                ),
                                              )),
                                        )
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
          ],
        ),
      ),
    ));
  }
}
