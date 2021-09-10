import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sound_chat/common/index.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:video_player/video_player.dart';
import 'package:wakelock/wakelock.dart';

class LiveTvshows extends StatefulWidget {
  @override
  _LiveTvshowsPageState createState() => _LiveTvshowsPageState();
}

class _LiveTvshowsPageState extends State<LiveTvshows>
    with SingleTickerProviderStateMixin {
  VideoPlayerController _videoPlayerController;
  ChewieController chewieController;
  double aspectRatio = 16 / 9;
  bool isLoading = true;
  AudioPlayer audioPlayer = new AudioPlayer(
      playerId: 'Soundchat Radio', mode: PlayerMode.MEDIA_PLAYER);

  _initVideo() {
    _videoPlayerController = VideoPlayerController.network(
      "https://5dcabf026b188.streamlock.net/soundchatradio/livestream/playlist.m3u8"
      //"http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4"
    );
    _videoPlayerController.initialize();

    chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      autoPlay: true,
      looping: true,
        deviceOrientationsAfterFullScreen: [DeviceOrientation.portraitUp],
      deviceOrientationsOnEnterFullScreen: [DeviceOrientation.landscapeLeft],
      allowFullScreen: true,
        isLive: true,
    );


  }

  final Set<Factory> gestureRecognizers =
  [Factory(() => EagerGestureRecognizer())].toSet();
  bool _visible = true;
  AnimationController _controller;
  double abheight = 30;
  String email;
  String name;
  stopaudio()async{
    await audioPlayer.stop();
    play=true;
    MediaNotification.showNotification(
        title: 'Soundchat Radio', isPlaying: !play);
  }

  @override
  void initState() {
    super.initState();
    stopaudio();
    _loadSavedData();
    _initVideo();
    Wakelock.enable();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 400),
    );
  }


  _loadSavedData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      if (sharedPreferences.getString('email') != null &&
          sharedPreferences.getString('email').isNotEmpty) {
        email = sharedPreferences.getString('email');
        name = sharedPreferences.getString('name');
      }
    });
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
    Wakelock.disable();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Stack(children: [
        Scaffold(
          body: SizedBox(
            height: height,
            child: Container(decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [Color(0xFF2F3F51), Color(0xFF3A442D)])),
              child: Column(
                children: <Widget>[
                  if (_visible)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              'assets/air.png',
                              scale: 10.5,
                            ),
                            SizedBox(
                              width: 7,
                            ),
                            Column(
                              children: [
                                FadeAnimatedTextKit(
                                  duration: Duration(seconds: 10),
                                  //pause: Duration(seconds: 10),
                                  totalRepeatCount: 60000,
                                  text: [
                                    "USA 718-554-8598",
                                    "UK 0-208-068-0507",
                                    "CANADA 647-484-7826"
                                  ],
                                  textStyle: TextStyle(
                                      fontSize: 15.0,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.start,
                                ),
                              ],
                            )
                          ],
                        ),
                        Container(
                          width: width * 0.2673,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                GestureDetector(
                                  onTap: () async {
                                    await launch(
                                        "https://www.facebook.com/irishandchin");
                                  },
                                  child: Icon(
                                    FontAwesomeIcons.facebook,
                                    color: Color(0xFFE18D13),
                                    size: 20,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () async {
                                    await launch(
                                        "https://www.youtube.com/channel/UC_JmuNpM4M4wqxoUeBSOMJw/videos");
                                  },
                                  child: Icon(
                                    FontAwesomeIcons.youtube,
                                    color: Color(0xFFE18D13),
                                    size: 20,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () async {
                                    await launch(
                                        "https://twitter.com/irishandchin");
                                  },
                                  child: Icon(
                                    FontAwesomeIcons.twitter,
                                    color: Color(0xFFE18D13),
                                    size: 20,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () async {
                                    await launch(
                                        "https://www.instagram.com/soundchatradio/");
                                  },
                                  child: Icon(
                                    FontAwesomeIcons.instagram,
                                    color: Color(0xFFE18D13),
                                    size: 20,
                                  ),
                                ),
                              ]),
                        ),
                      ],
                    ),
                  Container(
                    height: 1,
                    color: Colors.white54,
                    margin: EdgeInsets.only(top: 3),
                  ),
                  _buildVideoPlayer(),

                ],
              ),
            ),
          ),
        ),

      ]),
    );
  }
  Widget _buildVideoPlayer() {
    return Consumer<OverlayHandlerProvider>(
        builder: (context, overlayProvider, _) {
          return Stack(
            children: <Widget>[
              Container(
                color: Colors.black,
                child: AspectRatio(
                  aspectRatio: aspectRatio,
                  child:Chewie(
                    controller: chewieController,
                  ),
                ),
              ),
            ],
          );
        });
  }
}

