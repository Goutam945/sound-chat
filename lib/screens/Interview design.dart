import 'package:http/http.dart' as http;
import 'package:sound_chat/common/index.dart';

class Interviewdesign extends StatefulWidget {
  @override
  _Interviewdesign createState() => _Interviewdesign();
}

class _Interviewdesign extends State<Interviewdesign> {
  String data;
  var superherosLength;
  int day = 6;
  YoutubePlayerController mYoutubePlayerController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  void getData() async {
    http.Response response = await http.get(
        "https://mintok.com/soundchat/wp-json/interview/v2/?post_type=qtvideo");
    if (response.statusCode == 200) {
      data = response.body; //store response as string
      setState(() {
        superherosLength = jsonDecode(data)['data']
            ['free_content']; //get all the data from json string superheros
        print(superherosLength
            .length); // just printed length of dathttps://www.impetrosys.com/soundchatradio/wp-content/uploads/2018/12/IMG-20181212-WA0060.jpga
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
    return YoutubePlayerBuilder(
      player: YoutubePlayer(controller: mYoutubePlayerController),
      builder: (context, player) {
        return Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            backgroundColor: Colors.black,
            actions: <Widget>[
              IconButton(
                icon: Image.asset(
                  'assets/search.png',
                  color: Color(0xFFE18D13),
                  scale: 2,
                ),
                onPressed: () {},
              ),
            ],
          ),
          body: (superherosLength != null)
              ? ListView(
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          child: player,
                          height: height * 0.5002,
                          width: width * 1.018,
                        ),
                        Container(
                          child: Padding(
                            padding: EdgeInsets.only(right: width * 0.3314),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 4, right: 90),
                              child: Text("UPCOMMING SHOWS",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontStyle: FontStyle.italic)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            for (int i = 0; i < 130; i++)
                              SizedBox(
                                height: 300,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 10, left: 5),
                                      child: Positioned(
                                        left: width * 0.6493,
                                        top: height * 0.0368,
                                        child: Stack(
                                          children: [
                                            Container(
                                              width: width * 0.2397,
                                              height: height * 0.1393,
                                              child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                  child: Image.asset(
                                                    "assets/images.jpeg",
                                                    fit: BoxFit.fitWidth,
                                                  )),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                color: Colors.white,
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 45, left: 45),
                                              child: IconButton(
                                                icon: Icon(
                                                  Icons.play_circle_fill,
                                                  color: Colors.pink,
                                                  size: 35,
                                                ),
                                                onPressed: () {
                                                  mYoutubePlayerController = YoutubePlayerController(
                                                      initialVideoId: YoutubePlayer
                                                          .convertUrlToId(jsonDecode(
                                                                          data)[
                                                                      'data'][
                                                                  'free_content']['$i']
                                                              [
                                                              'free_video_url']),
                                                      flags:
                                                          const YoutubePlayerFlags(
                                                              autoPlay: true,
                                                              mute: false));
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: SizedBox(
                                          width: 120,
                                          child: Center(
                                              child: Text(
                                            jsonDecode(data)['data']
                                                        ['free_content']['$i']
                                                    ['post_title']
                                                .toString(),
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontStyle: FontStyle.italic,
                                            ),
                                            textAlign: TextAlign.center,
                                          ))),
                                    ),
                                  ],
                                ),
                              ),
                          ],
                        )),
                  ],
                )
              : Center(
                  child: CircularProgressIndicator(),
                ),
        );
      },
    );
  }
}

class YoutubeVideoApp extends StatefulWidget {
  final videoURL;

  YoutubeVideoApp(
    this.videoURL,
  );

  @override
  VideoState createState() => VideoState();
}

class VideoState extends State<YoutubeVideoApp> {
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
      body: Container(
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
