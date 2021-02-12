import 'package:sound_chat/common/index.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  _addVideoWithTitleOverlay() {
    OverlayService().addVideoTitleOverlay(context, VideoPlayerTitlePage());
  }

  _addVideoOverlay() {
    OverlayService().addVideosOverlay(context, VideoPlayerPage());
  }

  String data;
  var superherosLength;
  bool listen = true;
  bool play = true;
  bool stop = true;
  String status = 'hidden';

  @override
  void initState() {
    super.initState();
    getData();

    MediaNotification.setListener('pause', () {
      callAudio("pause");
      stream.pause();
      setState(() {
        play = !play;
      });
    });

    MediaNotification.setListener('play', () {
      callAudio("start");
      stream.start();
      setState(() {
        play = !play;
      });
    });

    MediaNotification.setListener('next', () {});

    MediaNotification.setListener('prev', () {});

    MediaNotification.setListener('select', () {});
  }

  AudioStream stream = new AudioStream('https://s2.voscast.com:9059/stream');

  Future<void> callAudio(String action) async {
    if (action == "start") {
      stream.start();
    } else if (action == "pause") {
      stream.pause();
    } else if (action == "stop") {
      stream.stop();
    }
  }

  Future<void> start() async {
    try {
      const MethodChannel _channel = const MethodChannel('url_audio_stream');
      await _channel.invokeMethod(
          'https://s2.voscast.com:9059/stream', "start");
    } on PlatformException catch (e) {
      print("Stream start error : $e");
    }
  }

  void getData() async {
    http.Response response = await http.get(
        "https://mintok.com/soundchat/wp-json/interview/v2/?post_type=qtvideo");
    if (response.statusCode == 200) {
      data = response.body; //store response as string
      setState(() {
        superherosLength = jsonDecode(data)['data']['free_content'];
        print(superherosLength.length);
      });
      var venam = jsonDecode(data)['data']['free_content'][4]['url'];
      print(venam);
    } else {
      print(response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
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
      child: Stack(
        children: [
          Scaffold(
            backgroundColor: Color(0xFF222222),
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Color(0xFFE18D13),
              actions: <Widget>[
                IconButton(
                  icon: Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: Image.asset(
                      'assets/user.png',
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => DesignLogin()));
                  },
                ),
              ],
            ),
            body: Column(
              children: [
                Container(
                  height: height * 0.0044,
                  width: width,
                  color: Color(0xFF780001),
                ),
                Column(
                  children: [
                    SizedBox(
                      child: Image.asset(
                        'assets/homepic.png',
                        fit: BoxFit.fill,
                      ),
                      height: height * 0.4103,
                    ),
                    listen
                        ? Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              color: Colors.black,
                              height: height * 0.04389,
                              child: Padding(
                                padding: EdgeInsets.only(right: width * 0.3314),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(left: 15, top: 2),
                                  child: Text("NOW STREAMING",
                                      style: TextStyle(
                                          color: Color(0xFF780001),
                                          fontSize: 22,
                                          fontStyle: FontStyle.italic)),
                                ),
                              ),
                            ),
                          )
                        : Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              color: Colors.black,
                              height: height * 0.04389,
                              child: Padding(
                                padding: EdgeInsets.only(right: width * 0.3314),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(left: 15, top: 2),
                                  child: Text("NOW PLAYING",
                                      style: TextStyle(
                                          color: Color(0xFF780001),
                                          fontSize: 22,
                                          fontStyle: FontStyle.italic)),
                                ),
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
                                    child: Text("THIS AND EVERY",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontStyle: FontStyle.italic))),
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
                                  child: Container(
                                    child: Text("MONDAY",
                                        style: TextStyle(
                                          color: Color(0xFFFFFEFF),
                                          fontSize: 23,
                                        )),
                                  ),
                                ),
                                Positioned(
                                  top: height * 0.1143,
                                  left: width * 0.070,
                                  child: Container(
                                    child: Text("@ 2PM-4PM",
                                        style: TextStyle(
                                            color: Color(0xFFFFFEFF),
                                            fontSize: 15,
                                            fontStyle: FontStyle.italic)),
                                  ),
                                ),
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
                                    top: height * 0.046,
                                    left: width * 0.2291,
                                    child: RaisedButton(
                                      child: Text(
                                        !play ? "PLAYING" : "STOP",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      onPressed: () {
                                        callAudio("stop");
                                      },
                                      color: Color(0xFF780001),
                                    )),
                                Positioned(
                                  top: height * 0.0395,
                                  left: width * 0.0738,
                                  child: Container(
                                    width: width * 0.1655,
                                    height: height * 0.0856,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Color(0xFFe0f2f1)),
                                  ),
                                ),
                                Positioned(
                                  left: width * 0.086,
                                  top: height * 0.046,
                                  child: Container(
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
                                        MediaNotification.showNotification(
                                          title: 'Title',
                                          author: 'Radio',
                                        );
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
                                  ),
                                ),
                                Positioned(
                                  left: width * 0.6493,
                                  top: height * 0.0368,
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
                                Positioned(
                                  top: height * 0.1343,
                                  left: width * 0.0381,
                                  child: Container(
                                    child: Text("SCHEDULE:",
                                        style: TextStyle(
                                            color: Color(0xFFC66E3A),
                                            fontSize: 12,
                                            fontStyle: FontStyle.italic)),
                                  ),
                                ),
                                Positioned(
                                  top: height * 0.1343,
                                  left: width * 0.2037,
                                  child: Container(
                                    child: Text("2PM-4PM",
                                        style: TextStyle(
                                            color: Color(0xFFFFFEFF),
                                            fontSize: 12,
                                            fontStyle: FontStyle.italic)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        color: Colors.black,
                        height: height * 0.0366,
                        child: Padding(
                          padding: EdgeInsets.only(right: width * 0.2314),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Text("RECENT INTERVIEWS",
                                style: TextStyle(
                                    color: Color(0xFF780001),
                                    fontSize: 18,
                                    fontStyle: FontStyle.italic)),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
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
                                        i < superherosLength.length;
                                        i++)
                                      Row(
                                        children: [
                                          SizedBox(
                                              width: 80,
                                              height: 60,
                                              child: GestureDetector(
                                                child: CachedNetworkImage(
                                                  imageUrl:
                                                      jsonDecode(data)['data']
                                                              ['free_content']
                                                          [i]['featured_img'],
                                                  fit: BoxFit.fill,
                                                  placeholder: (context, url) =>
                                                      Center(
                                                          child:
                                                              CircularProgressIndicator()),
                                                  errorWidget:
                                                      (context, url, error) =>
                                                          Icon(Icons.error),
                                                ),
                                                onTap: () {
                                                  Navigator.of(context).push(MaterialPageRoute(
                                                      builder: (context) =>
                                                          YoutubeVideo(jsonDecode(
                                                                          data)[
                                                                      'data'][
                                                                  'free_content'][i]
                                                              [
                                                              'free_video_url'])));
                                                },
                                              )),
                                          SizedBox(
                                            width: 10,
                                          ),
                                        ],
                                      ),
                                  ],
                                ),
                              )
                            : Center(
                                child: SizedBox(
                                    height: 60,
                                    child: Center(
                                        child: CircularProgressIndicator())),
                              ),
                      ),
                    ),
                    Container(
                      // width: width * 1.01853,
                      height: height * 0.085,
                      color: Color(0xFF780001),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.home,
                                    size: width*0.13,
                                    color: Color(0xFFE18D13),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Text(
                                      "HOME",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 15),
                                    ),
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
                                    size: width*0.12,
                                    color: Color(0xFFE18D13),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Text(
                                      "LISTEN",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 15),
                                    ),
                                  ),
                                ],
                              ),
                              onTap: () {
                                MediaNotification.showNotification(
                                    title: 'Title', author: 'Radio');
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
                                      size: width*0.12, color: Color(0xFFE18D13)),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Text(
                                      "WATCH",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 15),
                                    ),
                                  ),
                                ],
                              ),
                              onTap: () {
                                _addVideoOverlay();
                              },
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.more_vert,
                                size: width*0.13,
                                color: Colors.white,
                              ),
                              padding: EdgeInsets.only(bottom: 30),
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => NewMenuScreen()));
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            top: height * 0.0502,
            left: width * 0.39865,
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
        ));
  }
}
