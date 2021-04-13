import 'dart:io';
import 'package:audioplayer/audioplayer.dart';
import 'package:sound_chat/api/allproduct.dart';
import 'package:sound_chat/api/homeslider.dart';
import 'package:sound_chat/api/termsofservices.dart';
import 'package:sound_chat/common/index.dart';
import 'package:sound_chat/screens/InetrviewvideoplayStudio.dart';
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}
SharedPreferences localStorage;
class _HomeScreenState extends State<HomeScreen>with WidgetsBindingObserver {
  //Storage shareprifrance code
  _loadSavedData() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      if(sharedPreferences.getString('email') != null && sharedPreferences.getString('email').isNotEmpty){
        email = sharedPreferences.getString('email');
        name = sharedPreferences.getString('name');
      }
    });
  }
  //Strorage end
  _addVideoOverlay() {
    OverlayService().addVideosOverlay(context, VideoPlayerPage());
  }
  String email;
  String name ;
  String data;
  bool listen = true;
  bool play = true;
  bool stop = true;
  String status = 'hidden';
  var superherosLength;
  var timeanddate;
  int day;
  int weekday;
  int time;
  var Starttime;
  var Endtime;
  var Endtimemin;
  String show='22:00-23:59';
  var homeslider;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _loadSavedData();
    MediaNotification.setListener('pause', () {
      callAudio("pause");
      stream.pause();
      setState(() {
        play = !play;
      });
    });
    MediaNotification.setListener('play', () {
      callAudio("start");
      //stream.play('https://s2.voscast.com:9059/stream');
      stream.start();
      setState(() {
        play = !play;
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
  }
  void state(){
    setState(() {
      weekday = DateTime.now().subtract(Duration(hours: 10,minutes: 30)).weekday - 1;
      if (weekday == -1) weekday = 6;
      day=DateTime.now().subtract(Duration(hours: 10,minutes: 30)).weekday-1;
      if(day==-1)
        day=6;
    });
  }
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // Fluttertoast.showToast(msg: state.toString());
    print('ApplifeCycle State: '+state.toString());
    switch (state) {
      case AppLifecycleState.detached:
        exit(0);
        break;
      default:
        break;
    }
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
  //other option play
  /*AudioPlayer stream = AudioPlayer();
  Future<void> callAudio(String action) async {
    if (action == "start") {
      stream.play('https://s2.voscast.com:9059/stream');
      Toast.show("paying...", context,
          duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
    } else if (action == "pause") {
      stream.pause();
      Toast.show("Stop..", context,
          duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
    } else if (action == "stop") {
      stream.stop();
    }
  }*/
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    if (Provider.of<VideoResponse>(context, listen: false).data != null)
      superherosLength = Provider.of<VideoResponse>(context, listen: false).data['data'];
    if (Provider.of<ScheduleResponse>(context, listen: false).data != null)
      timeanddate=Provider.of<ScheduleResponse>(context, listen: false).data['data'];

    if (Provider.of<HomesliderResponse>(context, listen: false).data != null)
    homeslider =Provider.of<HomesliderResponse>(context, listen: false).data['data'];

    //var timeanddate =(Provider.of<ScheduleResponse>(context, listen: false).data != null)?Provider.of<ScheduleResponse>(context, listen: false).data['data']: null;
      //time show live time to changes
    if(timeanddate != null)
   /* for (int i=0;i<timeanddate[weekday]['shows'].length; i++) {
  Starttime = timeanddate[weekday]['shows']
  [i]['show_start_date'].split(':')[0].substring(0);
  Endtime = timeanddate[weekday]['shows']
  [i]['show_end_date'].split(':')[0].substring(0);

  // Endtimemin = timeanddate[weekday]['shows']
  // [0]['show_end_date'].split(':')[1];

  int hour = DateTime
      .now().subtract(Duration(hours: 10,minutes: 30))
      .hour;
  if (hour >= double.parse(Starttime) && hour < double.parse(Endtime))
  {  show = timeanddate[weekday]['shows']
    [i]['show_start_date'] + '-' + timeanddate[weekday]['shows']
    [i]['show_end_date']; break;}
}*/
      for (int i=0;i<timeanddate[weekday]['shows'].length; i++) {
        Starttime = DateTime.now().subtract(Duration(hours: 10,minutes: 30)).toIso8601String().split('T')[0] + ' ' +timeanddate[weekday]['shows']
        [i]['show_start_date'];
        Endtime = DateTime.now().subtract(Duration(hours: 10,minutes: 30)).toIso8601String().split('T')[0] + ' ' +timeanddate[weekday]['shows']
        [i]['show_end_date'];
        DateTime a=DateTime.parse(Starttime);
        DateTime b=DateTime.parse(Endtime);
        DateTime c=DateTime.now().subtract(Duration(hours: 10,minutes: 30));
        // print(a);
        // print(b);
        // print(c);
        if (c.isAfter(a) && c.isBefore(b))
        {  show = timeanddate[weekday]['shows']
        [i]['show_start_date'] + '-' + timeanddate[weekday]['shows']
        [i]['show_end_date'];break;}
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
              appBar: PreferredSize( preferredSize: Size.fromHeight(55),child: Appbar(email,name)),
             /* body: SizedBox(
                height: height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: height * 0.0044,
                      width: width,
                      color: Color(0xFF780001),
                    ),
                    // Expanded(
                    //   child: Container(width: width,
                    //     child: Image.asset(
                    //       'assets/homepic.png',
                    //       fit: BoxFit.fill,
                    //     ),
                    //   ),
                    // ),
                    Expanded(
                      child: Opacity(opacity: 0.9,
                        child:  (homeslider != null)? CarouselSlider(
                          options: CarouselOptions(height: double.infinity, autoPlay: true,
                            enlargeCenterPage: true,
                            viewportFraction: 1,
                            autoPlayInterval: Duration(seconds: 4),
                            autoPlayAnimationDuration: Duration(seconds: 1),

                          ),
                          items: <Widget>[
                            for (int i = 0; i < homeslider.length; i++)
                              Container(
                                width: MediaQuery.of(context).size.width,
                                margin: EdgeInsets.symmetric(horizontal: 5.0),
                                // decoration: BoxDecoration(
                                //   image: DecorationImage(
                                //     image: NetworkImage(homeslider[i]['image']),
                                //     fit: BoxFit.cover,
                                //
                                //   ),
                                //   // border:
                                //   //     Border.all(color: Theme.of(context).accentColor),
                                // ),

                                // decoration: BoxDecoration(
                                //   // BoxShape.circle or BoxShape.retangle
                                //   //color: const Color(0xFF66BB6A),
                                //     boxShadow: [
                                //       BoxShadow(offset: Offset(0.0,5.0),
                                //         color: Colors.black,
                                //         blurRadius: 10.0,
                                //       ),
                                //     ]),
                                child:  CachedNetworkImage(
                                  imageUrl:homeslider[i]['image'],
                                  fit: BoxFit.contain,
                                  placeholder: (context, url) => Center(
                                      child: CircularProgressIndicator()),
                                  errorWidget: (context, url, error) =>
                                      Icon(Icons.error),
                                ),
                              ),
                          ],


                        ):Center(child: CircularProgressIndicator()),
                      ),
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
                                (timeanddate != null)? Positioned (
                                  top: height * 0.073,
                                  left: width * 0.070,
                                  child: Container(
                                    child: Text(timeanddate[weekday]
                                    ['post_title'].toString(),
                                        style: TextStyle(
                                          color: Color(0xFFFFFEFF),
                                          fontSize: 23,
                                        )),
                                  ),
                                ):Center(child: CircularProgressIndicator()),
                                //for (int j = 0; j < timeanddate[weekday]['shows'].length; j++)
                                (timeanddate != null)?Positioned(
                                  top: height * 0.1143,
                                  left: width * 0.070,
                                  child: Container(
                                    child: Text(show.toString(),
                                        style: TextStyle(
                                            color: Color(0xFFFFFEFF),
                                            fontSize: 15,
                                            fontStyle: FontStyle.italic)),
                                  ),
                                ):Center(child: CircularProgressIndicator()),
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
                                    child: Row(mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: width * 0.1655,
                                          height: height * 0.0856,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Color(0xFFe0f2f1)),
                                          child: Container(margin: EdgeInsets.all(5),
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
                                                play
                                                    ? MediaNotification.showNotification(
                                                    title: 'Title',
                                                    author: 'Radio',
                                                    isPlaying: true)
                                                    : MediaNotification.showNotification(
                                                    title: 'Title',
                                                    author: 'Radio',
                                                    isPlaying: false);
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

                                        ElevatedButton(
                                          child: Text(
                                            !play ? "PLAYING" : "STOP",
                                            style: TextStyle(color: Colors.white),
                                          ),
                                          onPressed: () {
                                            callAudio("stop");
                                          },
                                          style: ButtonStyle(backgroundColor:
                                              MaterialStateProperty.resolveWith<
                                                  Color>((Set<MaterialState> states) {
                                            if (states
                                                .contains(MaterialState.pressed))
                                              return Colors.green;
                                            return Color(
                                                0xff780001); // Use the component's default.
                                          })),
                                        ),
                                      ],
                                    )),
                                // Positioned(
                                //   top: height * 0.0295,
                                //   left: width * 0.0738,
                                //   child: Container(
                                //     width: width * 0.1655,
                                //     height: height * 0.0856,
                                //     decoration: BoxDecoration(
                                //         shape: BoxShape.circle,
                                //         color: Color(0xFFe0f2f1)),
                                //   ),
                                // ),
                                // Positioned(
                                //   left: width * 0.086,
                                //   top: height * 0.036,
                                //   child: Container(
                                //     width: width * 0.1400,
                                //     height: height * 0.0724,
                                //     child: GestureDetector(
                                //       child: Icon(
                                //           stop
                                //               ? (play
                                //                   ? Icons.play_arrow_sharp
                                //                   : Icons.pause)
                                //               : Icons.stop,
                                //           size: 45,
                                //           color: Color(0xFFFFFEFF)),
                                //       onTap: () {
                                //         play
                                //             ? MediaNotification.showNotification(
                                //                 title: 'Title',
                                //                 author: 'Radio',
                                //                 isPlaying: true)
                                //             : MediaNotification.showNotification(
                                //                 title: 'Title',
                                //                 author: 'Radio',
                                //                 isPlaying: false);
                                //         setState(() {
                                //           play = !play;
                                //         });
                                //         play
                                //             ? callAudio("pause")
                                //             : callAudio("start");
                                //       },
                                //     ),
                                //     decoration: BoxDecoration(
                                //         shape: BoxShape.circle,
                                //         color: Color(0xFFFF3334)),
                                //   ),
                                // ),
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
                                // Positioned(
                                //   left: width * 0.6493,
                                //   top: height * 0.0368,
                                //   child: Container(
                                //     width: width * 0.2037,
                                //     height: height * 0.1053,
                                //     child: CircleAvatar(
                                //       backgroundImage:
                                //           AssetImage("assets/pic.jpg"),
                                //     ),
                                //     decoration: BoxDecoration(
                                //         shape: BoxShape.circle,
                                //         color: Color(0xFF374B6E)),
                                //   ),
                                // ),
                                Positioned(
                                  top: height * 0.1283,
                                  left: width * 0.0581,
                                  child: Row(
                                    children: [
                                      Text("SCHEDULE: ",
                                          style: TextStyle(
                                              color: Color(0xFFC66E3A),
                                              fontSize: 14,
                                              fontStyle: FontStyle.italic)),
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
                    Container(
                      padding: const EdgeInsets.all(10.0),
                      width: width * 1.01998,
                      color: Color(0xFF222222),
                      child: (superherosLength != null)
                          ? SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  for (int i = 0;
                                      i < superherosLength['free_content'].length;
                                      i++)
                                    Row(
                                      children: [
                                        SizedBox(
                                            width: 80,
                                            height: 60,
                                            child: GestureDetector(
                                              child: CachedNetworkImage(
                                                imageUrl: superherosLength[
                                                        'free_content'][i]
                                                    ['featured_img'],
                                                fit: BoxFit.cover,
                                                placeholder: (context, url) => Center(
                                                    child:
                                                        CircularProgressIndicator()),
                                                errorWidget:
                                                    (context, url, error) =>
                                                        Icon(Icons.error),
                                              ),
                                              onTap: () {
                                                Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            InterviewNewPlayer(
                                                                superherosLength[
                                                                        'free_content'][i]
                                                                    [
                                                                    'free_video_url'],superherosLength['free_content'][i]['post_title'])));
                                                setState(() {
                                                  play = true;
                                                });
                                                callAudio("stop");
                                                MediaNotification.showNotification(
                                                    title: 'Title',
                                                    author: 'Radio',
                                                    isPlaying: false);
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
                                  child:
                                      Center(child: CircularProgressIndicator())),
                            ),
                    ),
                    Container(
                      height: height * 0.085,
                      color: Color(0xFF780001),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 5,bottom: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.home,
                                    size: width * 0.13,
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
                                    size: width * 0.12,
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
                                      size: width * 0.12,
                                      color: Color(0xFFE18D13)),
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
                                setState(() {
                                  play = true;
                                });
                                callAudio("stop");
                                MediaNotification.showNotification(
                                    title: 'Title',
                                    author: 'Radio',
                                    isPlaying: false);

                              },
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.more_vert,
                                size: width * 0.13,
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
              ),*/
//new chages boday
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
                      child: Opacity(opacity: 0.9,
                        child:  (homeslider != null)? CarouselSlider(
                          options: CarouselOptions(height: double.infinity, autoPlay: true,
                            enlargeCenterPage: true,
                            viewportFraction: 1,
                            autoPlayInterval: Duration(seconds: 4),
                            autoPlayAnimationDuration: Duration(seconds: 1),

                          ),
                          items: <Widget>[
                            for (int i = 0; i < homeslider.length; i++)
                              Container(
                                width: MediaQuery.of(context).size.width,
                                margin: EdgeInsets.symmetric(horizontal: 5.0),
                                child:  CachedNetworkImage(
                                  imageUrl:homeslider[i]['image'],
                                  fit: BoxFit.cover,
                                  placeholder: (context, url) => Center(
                                      child: CircularProgressIndicator()),
                                  errorWidget: (context, url, error) =>
                                      Icon(Icons.error),
                                ),
                              ),
                          ],
                        ):Center(child: CircularProgressIndicator()),
                      ),
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
                          (timeanddate != null)? Positioned (
                            top: height * 0.073,
                            left: width * 0.070,
                            child: Container(
                              child: Text(timeanddate[weekday]
                              ['post_title'].toString(),
                                  style: TextStyle(
                                    color: Color(0xFFFFFEFF),
                                    fontSize: 23,
                                  )),
                            ),
                          ):Center(child: CircularProgressIndicator()),
                          //for (int j = 0; j < timeanddate[weekday]['shows'].length; j++)
                          (timeanddate != null)?Positioned(
                            top: height * 0.1143,
                            left: width * 0.070,
                            child: Container(
                              child: Text(show.toString(),
                                  style: TextStyle(
                                      color: Color(0xFFFFFEFF),
                                      fontSize: 15,
                                      fontStyle: FontStyle.italic)),
                            ),
                          ):Center(child: CircularProgressIndicator()),
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
                              child: Row(mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: width * 0.1655,
                                    height: height * 0.0856,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Color(0xFFe0f2f1)),
                                    child: Container(margin: EdgeInsets.all(5),
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
                                          play
                                              ? MediaNotification.showNotification(
                                              title: 'Title',
                                              author: 'Radio',
                                              isPlaying: true)
                                              : MediaNotification.showNotification(
                                              title: 'Title',
                                              author: 'Radio',
                                              isPlaying: false);
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
                               SizedBox(width: 90,
                                 child: ElevatedButton(
                                    child: Text(
                                      !play ? "PLAYING" : "STOP",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    onPressed: () {
                                      callAudio("stop");
                                    },
                                    style: ButtonStyle(backgroundColor:
                                    MaterialStateProperty.resolveWith<
                                        Color>((Set<MaterialState> states) {
                                      if (states
                                          .contains(MaterialState.pressed))
                                        return Colors.green;
                                      return Color(
                                          0xff780001); // Use the component's default.
                                    })),
                                  ),)
                                ],
                              )),
                          // Positioned(
                          //   top: height * 0.0295,
                          //   left: width * 0.0738,
                          //   child: Container(
                          //     width: width * 0.1655,
                          //     height: height * 0.0856,
                          //     decoration: BoxDecoration(
                          //         shape: BoxShape.circle,
                          //         color: Color(0xFFe0f2f1)),
                          //   ),
                          // ),
                          // Positioned(
                          //   left: width * 0.086,
                          //   top: height * 0.036,
                          //   child: Container(
                          //     width: width * 0.1400,
                          //     height: height * 0.0724,
                          //     child: GestureDetector(
                          //       child: Icon(
                          //           stop
                          //               ? (play
                          //                   ? Icons.play_arrow_sharp
                          //                   : Icons.pause)
                          //               : Icons.stop,
                          //           size: 45,
                          //           color: Color(0xFFFFFEFF)),
                          //       onTap: () {
                          //         play
                          //             ? MediaNotification.showNotification(
                          //                 title: 'Title',
                          //                 author: 'Radio',
                          //                 isPlaying: true)
                          //             : MediaNotification.showNotification(
                          //                 title: 'Title',
                          //                 author: 'Radio',
                          //                 isPlaying: false);
                          //         setState(() {
                          //           play = !play;
                          //         });
                          //         play
                          //             ? callAudio("pause")
                          //             : callAudio("start");
                          //       },
                          //     ),
                          //     decoration: BoxDecoration(
                          //         shape: BoxShape.circle,
                          //         color: Color(0xFFFF3334)),
                          //   ),
                          // ),
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
                          // Positioned(
                          //   left: width * 0.6493,
                          //   top: height * 0.0368,
                          //   child: Container(
                          //     width: width * 0.2037,
                          //     height: height * 0.1053,
                          //     child: CircleAvatar(
                          //       backgroundImage:
                          //           AssetImage("assets/pic.jpg"),
                          //     ),
                          //     decoration: BoxDecoration(
                          //         shape: BoxShape.circle,
                          //         color: Color(0xFF374B6E)),
                          //   ),
                          // ),
                          Positioned(
                            top: height * 0.1283,
                            left: width * 0.0581,
                            child: Row(
                              children: [
                                Text("SCHEDULE: ",
                                    style: TextStyle(
                                        color: Color(0xFFC66E3A),
                                        fontSize: 14,
                                        fontStyle: FontStyle.italic)),
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
                    Container(
                      padding: const EdgeInsets.all(10.0),
                      width: width * 1.01998,
                      color: Color(0xFF222222),
                      child: (superherosLength != null)
                          ? SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            for (int i = 0;
                            i < superherosLength['free_content'].length;
                            i++)
                              Row(
                                children: [
                                  Container(
                                  child:SizedBox(
                                      width: 80,
                                      height: 60,
                                      child: ClipRRect(borderRadius: BorderRadius.circular(10),
                                      child: GestureDetector(
                                        child: CachedNetworkImage(
                                          imageUrl: superherosLength[
                                          'free_content'][i]
                                          ['featured_img'],
                                          fit: BoxFit.cover,
                                          placeholder: (context, url) => Center(
                                              child:
                                              CircularProgressIndicator()),
                                          errorWidget:
                                              (context, url, error) =>
                                              Icon(Icons.error),
                                        ),
                                        onTap: () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      InterviewNewPlayer(
                                                          superherosLength[
                                                          'free_content'][i]
                                                          [
                                                          'free_video_url'],superherosLength['free_content'][i]['post_title'])));
                                          setState(() {
                                            play = true;
                                          });
                                          callAudio("stop");
                                          MediaNotification.showNotification(
                                              title: 'Title',
                                              author: 'Radio',
                                              isPlaying: false);
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
                        child: SizedBox(
                            height: 60,
                            child:
                            Center(child: CircularProgressIndicator())),
                      ),
                    ),
                    Container(
                      height: height * 0.085,
                      color: Color(0xFF780001),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 5,bottom: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.home,
                                    size: width * 0.13,
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
                                    size: width * 0.12,
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
                                      size: width * 0.12,
                                      color: Color(0xFFE18D13)),
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
                                setState(() {
                                  play = true;
                                });
                                callAudio("stop");
                                MediaNotification.showNotification(
                                    title: 'Title',
                                    author: 'Radio',
                                    isPlaying: false);

                              },
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.more_vert,
                                size: width * 0.13,
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
              ),

            ),
            Positioned(
              top: AppBar().preferredSize.height*0.2,
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
