import 'package:http/http.dart' as http;
import 'package:sound_chat/common/index.dart';

class PodcastPlayCloud extends StatefulWidget {
  final j, weekday;

  PodcastPlayCloud(this.j, this.weekday);

  @override
  _ListenState createState() => _ListenState();
}

class _ListenState extends State<PodcastPlayCloud> {
  bool play = true;
  String data;
  var superherosLength;
  int day = 6;

  String audiourl;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
    // setState(() {
    //   weekday=DateTime.now().weekday-1;
    //   if(weekday==-1)
    //     weekday=6;
    // });
  }

  void getData() async {
    http.Response response = await http.get(
        "https://mintok.com/soundchat/wp-json/schedule/v2/?post_type=schedule");
    if (response.statusCode == 200) {
      data = response.body; //store response as string
      setState(() {
        superherosLength = jsonDecode(
            data)['data']; //get all the data from json string superheros
        print(superherosLength
            .length); // just printed length of dathttps://www.impetrosys.com/soundchatradio/wp-content/uploads/2018/12/IMG-20181212-WA0060.jpga
      });
      var venam = jsonDecode(data)['data'][4]['url'];
      print(venam);
    } else {
      print(response.statusCode);
    }
  }

  // AudioStream stream =  AudioStream(audiourl);
  Future<void> callAudio(String action) async {
    if (action == "start") {
      new AudioStream(audiourl).start();
    } else if (action == "pause") {
      new AudioStream(audiourl).pause();
    } else if (action == "stop") {
      new AudioStream(audiourl).stop();
    }
  }

  Future<void> start() async {
    try {
      const MethodChannel _channel = const MethodChannel('url_audio_stream');
      await _channel.invokeMethod(audiourl, "start");
    } on PlatformException catch (e) {
      print("Stream start error : $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    int weekday = widget.weekday;

    return Stack(
      children: [
        Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Color(0xFFE18D13),
            leading: Builder(
              builder: (BuildContext context) {
                return IconButton(
                  icon: Icon(
                    Icons.arrow_back_rounded,
                    color: Colors.white,
                    size: 25,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                );
              },
            ),
          ),
          body: (superherosLength != null)
              ? ListView(
                  children: [
                    Container(
                      height: height * 0.0044,
                      width: width,
                      color: Color(0xFF780001),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: Column(
                        children: [
                          SizedBox(
                            child: Image.asset(
                              'assets/imgpodcast.png',
                              fit: BoxFit.fill,
                            ),
                            height: height * 0.4103,
                            width: width,
                          ),
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: Container(
                                child: Text("podcast from this show",
                                    style: TextStyle(
                                        color: Color(0xFF8A8889),
                                        fontSize: 18)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(top: 5),
                          child: Row(
                            children: [
                              Container(
                                  padding: EdgeInsets.only(left: 10),
                                  width: width * 0.3037,
                                  height: height * 0.1501,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                          color: Colors.white, width: 2)),
                                  child: Image.asset(
                                    'assets/imgpodcast.png',
                                    fit: BoxFit.fill,
                                  )),
                              Column(
                                children: [
                                  Container(
                                    width: width * 0.1300,
                                    height: height * 0.0524,
                                    child: GestureDetector(
                                      child: Icon(
                                          play
                                              ? Icons.play_arrow_sharp
                                              : Icons.pause,
                                          size: 30,
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
                                ],
                              ),
                              Text(jsonDecode(data)['data'][weekday]['shows']
                                  [widget.j]['show_name'])
                            ],
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: height * 0.2565,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: (jsonDecode(data)['data'].length != null)
                              ? Column(
                                  children: [
                                    for (int j = 0;
                                        j <
                                            jsonDecode(data)['data'][weekday]
                                                        ['shows'][widget.j]
                                                    ['show_audio_url']
                                                .length;
                                        j++)
                                      Column(
                                        children: [
                                          SizedBox(
                                            height: 40,
                                            child: GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  audiourl =
                                                      jsonDecode(data)['data']
                                                                      [weekday]
                                                                  ['shows']
                                                              [widget.j]
                                                          ['show_audio_url'];
                                                  play = false;
                                                });
                                                callAudio("start");
                                              },
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Container(
                                                        width: width * 0.0801,
                                                        height: height * 0.0401,
                                                        decoration: BoxDecoration(
                                                            color: Colors.white,
                                                            border: Border.all(
                                                                color: Colors
                                                                    .white,
                                                                width: 1)),
                                                        child: Image.asset(
                                                          'assets/imgpodcast.png',
                                                          fit: BoxFit.fill,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Text(jsonDecode(
                                                                        data)[
                                                                    'data'][
                                                                weekday]['shows']
                                                            [widget
                                                                .j]['show_name']),
                                                      ),
                                                    ],
                                                  ),
                                                  IconButton(
                                                    icon: Icon(
                                                        Icons.play_arrow_sharp),
                                                    onPressed: null,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Container(
                                            height: 1,
                                            width: width,
                                            color: Color(0xFFA79A9A),
                                          )
                                        ],
                                      ),
                                  ],
                                )
                              : Center(
                                  child: CircularProgressIndicator(),
                                ),
                        ),
                      ),
                    ),
                  ],
                )
              : Center(child: CircularProgressIndicator()),
        ),
        Positioned(
            top: height * 0.0402,
            left: width * 0.39865,
            child: SizedBox(
                height: height * 0.12168,
                width: width * 0.21875,
                child: Image.asset(
                  'assets/soundpic.png',
                ))),
      ],
    );
  }
}
