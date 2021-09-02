import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sound_chat/common/index.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wakelock/wakelock.dart';

class VideoPlayerPage extends StatefulWidget {
  @override
  _VideoPlayerPageState createState() => _VideoPlayerPageState();
}

class _VideoPlayerPageState extends State<VideoPlayerPage>
    with SingleTickerProviderStateMixin {
  VideoPlayerController _videoPlayerController;
  double aspectRatio = 16 / 9;
  bool isLoading = true;

  _initVideo() {
    _videoPlayerController = VideoPlayerController.network(
      "https://5dcabf026b188.streamlock.net/soundchatradio/livestream/playlist.m3u8",
      //"https://www.radiantmediaplayer.com/media/big-buck-bunny-360p.mp4"
    );
    _videoPlayerController.setLooping(true);

    _videoPlayerController
      ..initialize().then((value) {
        setState(() {
          aspectRatio = _videoPlayerController.value.aspectRatio ?? 16 / 9;
        });
        _videoPlayerController.play();
      });

  }

  final Set<Factory> gestureRecognizers =
      [Factory(() => EagerGestureRecognizer())].toSet();
  bool _visible = true;
  AnimationController _controller;
  double abheight = 30;
  String email;
  String name;

  @override
  void initState() {
    super.initState();
    _loadSavedData();
    _initVideo();
    BackButtonInterceptor.add(myInterceptor);
    Wakelock.enable();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 400),
    );
  }

  bool myInterceptor(bool stopDefaultButtonEvent, RouteInfo info) {
    print("BACK BUTTON!");
    Provider.of<OverlayHandlerProvider>(context, listen: false)
        .enablePip(aspectRatio);
    setState(() {
      _visible = false;
    }); // Do some stuff.
    return true;
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
    BackButtonInterceptor.remove(myInterceptor);
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
                 /* if (_visible)
                    (email == null)
                        ? Expanded(
                            child: Container(
                            child: Center(
                              child: Text(
                                "Please login to start chatting",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ))
                        : Expanded(
                            child: Container(
                              constraints: BoxConstraints(maxHeight: 500),
                              child: WebView(
                                javascriptMode: JavascriptMode.unrestricted,
                                onPageFinished: (finish) {
                                  setState(() {
                                    isLoading = false;
                                  });
                                },
                                gestureRecognizers: gestureRecognizers,
                                initialUrl:
                                    "http://3.23.210.57/chatapp/userview/loginapi/10",
                              ),
                            ),
                          ),*/
                ],
              ),
            ),
          ),
        ),
        /*if (_visible)
          Positioned(
              top: AppBar().preferredSize.height * 0.1,
              left: width * 0.39865,
              child: SizedBox(
                  height: height * 0.11168,
                  width: width * 0.21875,
                  child: Image.asset(
                    'assets/soundpic.png',
                  ))),*/
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
              child: VideoPlayer(
                _videoPlayerController,
              ),
            ),
          ),
          if (!overlayProvider.inPipMode)
            Positioned(
              top: 8.0,
              left: 8.0,
              child: IconButton(
                  icon: Icon(Icons.keyboard_arrow_down),
                  color: Colors.white,
                  onPressed: () {
                    Provider.of<OverlayHandlerProvider>(context, listen: false)
                        .enablePip(aspectRatio);
                    setState(() {
                      _visible = false;
                    });
                  }),
            ),
          Positioned(
            top: 8.0,
            right: 8.0,
            child: IconButton(
                icon: Icon(
                  Icons.close,
                  size: 30,
                  color: Colors.white,
                ),
                color: Colors.white,
                onPressed: () {
                  Provider.of<OverlayHandlerProvider>(context, listen: false)
                      .removeOverlay(context);
                }),
          ),
          if (overlayProvider.inPipMode)
            Positioned(
              top: 0,
              left: 0,
              bottom: 0,
              right: 0,
              child: InkWell(
                onTap: () {
                  Provider.of<OverlayHandlerProvider>(context, listen: false)
                      .disablePip();
                  setState(() {
                    _visible = true;
                  });
                },
                child: Container(),
              ),
            ),
        ],
      );
    });
  }
}
/*
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sound_chat/common/index.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wakelock/wakelock.dart';

class VideoPlayerPage extends StatefulWidget {
  @override
  _VideoPlayerPageState createState() => _VideoPlayerPageState();
}

class _VideoPlayerPageState extends State<VideoPlayerPage>
    with SingleTickerProviderStateMixin {
  VideoPlayerController _videoPlayerController;
  ChewieController chewieController;
  double aspectRatio = 16 / 9;
  bool isLoading = true;

  _initVideo() {
    */
/*_videoPlayerController = VideoPlayerController.network(
      "https://5dcabf026b188.streamlock.net/soundchatradio/livestream/playlist.m3u8",

    );
    _videoPlayerController.setLooping(true);

    _videoPlayerController
      ..initialize().then((value) {
        setState(() {
          aspectRatio = _videoPlayerController.value.aspectRatio ?? 16 / 9;
        });
        _videoPlayerController.play();
      });
*//*

    _videoPlayerController = VideoPlayerController.network(
        "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4"
    );
    _videoPlayerController.initialize();

    chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      autoPlay: true,
      looping: true,
    );


  }

  final Set<Factory> gestureRecognizers =
  [Factory(() => EagerGestureRecognizer())].toSet();
  bool _visible = true;
  AnimationController _controller;
  double abheight = 30;
  String email;
  String name;

  @override
  void initState() {
    super.initState();
    _loadSavedData();
    _initVideo();
    BackButtonInterceptor.add(myInterceptor);
    Wakelock.enable();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 400),
    );
  }

  bool myInterceptor(bool stopDefaultButtonEvent, RouteInfo info) {
    print("BACK BUTTON!");
    Provider.of<OverlayHandlerProvider>(context, listen: false)
        .enablePip(aspectRatio);
    setState(() {
      _visible = false;
    }); // Do some stuff.
    return true;
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
    BackButtonInterceptor.remove(myInterceptor);
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
                  */
/* if (_visible)
                    (email == null)
                        ? Expanded(
                            child: Container(
                            child: Center(
                              child: Text(
                                "Please login to start chatting",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ))
                        : Expanded(
                            child: Container(
                              constraints: BoxConstraints(maxHeight: 500),
                              child: WebView(
                                javascriptMode: JavascriptMode.unrestricted,
                                onPageFinished: (finish) {
                                  setState(() {
                                    isLoading = false;
                                  });
                                },
                                gestureRecognizers: gestureRecognizers,
                                initialUrl:
                                    "http://3.23.210.57/chatapp/userview/loginapi/10",
                              ),
                            ),
                          ),*//*

                ],
              ),
            ),
          ),
        ),
        */
/*if (_visible)
          Positioned(
              top: AppBar().preferredSize.height * 0.1,
              left: width * 0.39865,
              child: SizedBox(
                  height: height * 0.11168,
                  width: width * 0.21875,
                  child: Image.asset(
                    'assets/soundpic.png',
                  ))),*//*

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
              if (!overlayProvider.inPipMode)
                Positioned(
                  top: 8.0,
                  left: 8.0,
                  child: IconButton(
                      icon: Icon(Icons.keyboard_arrow_down),
                      color: Colors.white,
                      onPressed: () {
                        Provider.of<OverlayHandlerProvider>(context, listen: false)
                            .enablePip(aspectRatio);
                        setState(() {
                          _visible = false;
                        });
                      }),
                ),
              Positioned(
                top: 8.0,
                right: 8.0,
                child: IconButton(
                    icon: Icon(
                      Icons.close,
                      size: 30,
                      color: Colors.white,
                    ),
                    color: Colors.white,
                    onPressed: () {
                      Provider.of<OverlayHandlerProvider>(context, listen: false)
                          .removeOverlay(context);
                    }),
              ),
              if (overlayProvider.inPipMode)
                Positioned(
                  top: 0,
                  left: 0,
                  bottom: 0,
                  right: 0,
                  child: InkWell(
                    onTap: () {
                      Provider.of<OverlayHandlerProvider>(context, listen: false)
                          .disablePip();
                      setState(() {
                        _visible = true;
                      });
                    },
                    child: Container(),
                  ),
                ),
            ],
          );
        });
  }
}

*/
