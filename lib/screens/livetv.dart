import 'dart:io';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:sound_chat/common/index.dart';
import 'package:sound_chat/screens/chat_screen.dart';

/*
class LiveVideo extends StatefulWidget {
  @override
  _LiveVideoState createState() => _LiveVideoState();
}

class _LiveVideoState extends State<LiveVideo> {
  BetterPlayerController _betterPlayerController;
  GlobalKey _betterPlayerKey = GlobalKey();
  AudioPlayer audioPlayer = new AudioPlayer(
      playerId: 'Soundchat Radio', mode: PlayerMode.MEDIA_PLAYER);
  stopaudio()async{
    await audioPlayer.stop();
    play=true;
    MediaNotification.showNotification(
        title: 'Soundchat Radio', isPlaying: !play);
  }

  @override
  void initState() {
    stopaudio();
    BetterPlayerConfiguration betterPlayerConfiguration =
    BetterPlayerConfiguration(
        aspectRatio: 16 / 9,
        fit: BoxFit.contain,
        autoPlay: true,
        eventListener: (event) {
          print(event.betterPlayerEventType);
          print(event.parameters);
        },
      deviceOrientationsOnFullScreen: [
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ],
      ///Orientation after full screen dismissed
      deviceOrientationsAfterFullScreen: [
        DeviceOrientation.portraitUp,
      ],
    );

    BetterPlayerDataSource dataSource = BetterPlayerDataSource(
        BetterPlayerDataSourceType.network, "https://5dcabf026b188.streamlock.net/soundchatradio/livestream/playlist.m3u8",
        liveStream: true,
        cacheConfiguration: BetterPlayerCacheConfiguration(useCache: false),
        videoExtension: "m3u8",
        notificationConfiguration: BetterPlayerNotificationConfiguration(
          title: "Sound chat",
          imageUrl:
          "https://soundchatradio.com/wp-content/uploads/2018/10/cropped-logo-soundchat-radioSmall-300x300.png",
          showNotification: true,
        ));
    _betterPlayerController = BetterPlayerController(betterPlayerConfiguration);
    _betterPlayerController.setupDataSource(dataSource);
    _betterPlayerController.setBetterPlayerGlobalKey(_betterPlayerKey);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xFF481621),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.center,
                colors: [Color(0xFF481621), Color(0xFF271732)]
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: height * 0.025,
              ),
              BetterPlayer(
                controller: _betterPlayerController,
                key: _betterPlayerKey,
              ),
              SizedBox(height: 20,),
            ],
          ),
        ),
      ),
    );
  }
}*/
class LiveVideo extends StatefulWidget {
  final videoUrl;

  LiveVideo({this.videoUrl});

  @override
  _LiveVideoState createState() => _LiveVideoState();
}

class _LiveVideoState extends State<LiveVideo> {
  AudioPlayer audioPlayer = new AudioPlayer(
      playerId: 'Soundchat Radio', mode: PlayerMode.MEDIA_PLAYER);
  bool isLogin = false;

  stopaudio() async {
    await audioPlayer.stop();
    play = true;
    MediaNotification.showNotification(
        title: 'Soundchat Radio', isPlaying: !play);
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  loadSavedData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      if (sharedPreferences.getBool('islogin') != null) {
        isLogin = sharedPreferences.getBool('islogin');
      } else {
        isLogin = false;
      }
    });
  }

  @override
  void initState() {
    loadSavedData();
    audioPlayer.stop();
    //isPlaying = false;
    stopaudio();
    handlePip();
    super.initState();
  }

  handlePip() {
    Future.delayed(Duration.zero, () async {
      Provider.of<OverlayHandlerProvider>(context, listen: false)
          .removeOverlay(context);
      Provider.of<OverlayHandlerProvider>(context, listen: false).disablePip();
      pipDisabled = false;
    });
  }

  final TextStyle textStyle = TextStyle(
      fontSize: 15.0, color: Colors.white, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    // double height = MediaQuery.of(context).size.height;
    // double width = MediaQuery.of(context).size.width;
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Color(0xFF481621),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.center,
                colors: [Color(0xFF481621), Color(0xFF271732)]),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // SizedBox(
              //   height: height * 0.015,
              // ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/air.png',
                      scale: 10.5,
                    ),
                    SizedBox(
                      width: 7,
                    ),
                    AnimatedTextKit(
                      animatedTexts: [
                        FadeAnimatedText(
                          'USA 718-554-8598',
                          textStyle: textStyle,
                          duration: const Duration(milliseconds: 2000),
                        ),
                        FadeAnimatedText(
                          'UK 0-208-068-0507',
                          textStyle: textStyle,
                          duration: const Duration(milliseconds: 2000),
                        ),
                        FadeAnimatedText(
                          'CANADA 647-484-7826',
                          textStyle: textStyle,
                          duration: const Duration(milliseconds: 2000),
                        ),
                      ],
                      totalRepeatCount: 90000,
                      pause: const Duration(milliseconds: 1000),
                      displayFullTextOnTap: true,
                      stopPauseOnTap: true,
                    ),
                  ],
                ),
              ),
              // BetterPlayer(
              //   controller: _betterPlayerController,
              //   key: _betterPlayerKey,
              // ),
              VideoPlayer(),
              Expanded(
                  child: isLogin
                      ? ChatScreen()
                      : Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Please Login first to see this chat",
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                            builder: (context) => NewLogin()));
                                  },
                                  child: Text("Go to Login Screen"))
                            ],
                          ),
                        ))
            ],
          ),
        ),
      ),
    );
  }
}

class VideoPlayer extends StatefulWidget {
  const VideoPlayer({Key key}) : super(key: key);

  @override
  _VideoPlayerState createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> with WidgetsBindingObserver {
  String videoUrl =
      "https://5dcabf026b188.streamlock.net/soundchatradio/livestream/playlist.m3u8";
  BetterPlayerController _betterPlayerController;
  GlobalKey _betterPlayerKey = GlobalKey();

  void didChangeAppLifecycleState(AppLifecycleState state) {
    print(state);
    switch (state) {
      case AppLifecycleState.detached:
        exit(0);
        break;
      case AppLifecycleState.paused:
        _betterPlayerController.enablePictureInPicture(_betterPlayerKey);
        break;
      default:
        break;
    }
  }

  setUrl() {
    setState(() {
      // audioUrl = Provider.of<AudioVideoListResponse>(context, listen: false)
      //     .data['audio']['file'];
      // videoUrl = Provider.of<AudioVideoListResponse>(context, listen: false)
      //     .data['video']['file'];
      // print(videoUrl);
      // isPlaying ? play() : pause();
    });
    // videoPlayerConfig();
    BetterPlayerDataSource dataSource =
        BetterPlayerDataSource(BetterPlayerDataSourceType.network, videoUrl,
            liveStream: true,
            cacheConfiguration: BetterPlayerCacheConfiguration(
              useCache: false,
            ),
            videoExtension: "m3u8",
            notificationConfiguration: BetterPlayerNotificationConfiguration(
              title: "Sound Chat Radio",
              imageUrl:
                  "https://soundchatradio.com/wp-content/uploads/2018/10/cropped-logo-soundchat-radioSmall-300x300.png",
              showNotification: true,
            ));
    _betterPlayerController.setupDataSource(dataSource);
  }

  videoPlayerConfig() {
    BetterPlayerConfiguration betterPlayerConfiguration =
        BetterPlayerConfiguration(
      // controlsConfiguration: BetterPlayerControlsConfiguration(enablePip: true,pipMenuIcon: IconData(20)),
      aspectRatio: 16 / 9,
      fit: BoxFit.contain,
      autoPlay: true, allowedScreenSleep: false,
      controlsConfiguration:
          BetterPlayerControlsConfiguration(enableSkips: false),
      eventListener: (event) {
        //print(event.betterPlayerEventType);
        // print(event.parameters);
      },
      deviceOrientationsOnFullScreen: [
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ],

      ///Orientation after full screen dismissed
      deviceOrientationsAfterFullScreen: [
        DeviceOrientation.portraitUp,
      ],
      //   overlay: IconButton(
      //   icon: Icon(Icons.cancel_outlined),color: Colors.white,iconSize: 40,
      //   onPressed: (){
      //     Provider.of<OverlayHandlerProvider>(context, listen: false).removeOverlay(context);
      //   },
      // ),
    );
    _betterPlayerController = BetterPlayerController(betterPlayerConfiguration);
    // _betterPlayerController.setupDataSource(dataSource);
    _betterPlayerController.setBetterPlayerGlobalKey(_betterPlayerKey);
  }

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    videoPlayerConfig();
    // createAudioVideoListState(context).whenComplete(() => setUrl());
    setUrl();
    super.initState();
  }

  @override
  void dispose() {
    _betterPlayerController.isPictureInPictureSupported().then((value) {
      //   print(value);
      if (value)
        _betterPlayerController.enablePictureInPicture(_betterPlayerKey);
    });
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: BetterPlayer(
        controller: _betterPlayerController,
        key: _betterPlayerKey,
      ),
    );
  }
}
