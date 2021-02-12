import 'package:sound_chat/common/index.dart';
import 'package:http/http.dart' as http;

class InterviewNewPlayer extends StatefulWidget {
  @override
  _InterviewNewPlayer createState() => _InterviewNewPlayer();
}

class _InterviewNewPlayer extends State<InterviewNewPlayer> {
  String data;
  var superherosLength;
  int day = 6;
  int j;
  String url;
  bool isTrue = true;
  String imageUrl;
  String titlepost;
  YoutubePlayerController youtubeController;
  double videoheight = 0.356;
  double videowidth = 1.018;

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    http.Response response = await http.get(
        "https://mintok.com/soundchat/wp-json/interview/v2/?post_type=qtvideo");
    if (response.statusCode == 200) {
      data = response.body;
      setState(() {
        superherosLength = jsonDecode(data)['data']
            ['free_content'];
      });
    } else {
      print(response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
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
        // title: Text("Flutter App"),
      ),
      body: (superherosLength != null)
          ? ListView(
              children: [
                Container(
                  height: height * 0.0044,
                  width: width,
                  color: Color(0xFF780001),
                ),
                (isTrue)
                    ? Container(
                        height: height * videoheight,
                        width: width * videowidth,
                        child: YoutubePlayers(url ??
                            superherosLength[0]
                                ['free_video_url']))
                    : Stack(
                        children: [
                          Image.network(
                            imageUrl,
                            fit: BoxFit.fill,
                            height: height * 0.356,
                          ),
                          Positioned(
                              top: 0,
                              bottom: 0,
                              right: 0,
                              left: 0,
                              child: IconButton(
                                icon: Icon(
                                  Icons.play_circle_fill,
                                  color: Colors.red,
                                  size: 45,
                                ),
                                onPressed: () {
                                  setState(() {
                                    isTrue = !isTrue;
                                  });
                                },
                              ))
                        ],
                      ),
                Column(
                  children: [
                    Container(
                      width: width,
                      height: height * 0.0742,
                      color: Color(0xFFB91F24),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, top: 0),
                        child: Center(
                          child: Text(
                              titlepost ??
                                  superherosLength[0]
                                          ['post_title']
                                      .toString(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Montserrat')),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  width: width,
                  height: height * 0.2987,
                  color: Color(0xFF252525),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, top: 5),
                    child: Text("Multiple Grammy award winning artist",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        )),
                  ),
                ),
                Container(
                  width: width,
                  height: 50,
                  color: Color(0xFF363636),
                  child: Center(
                    child: Text("YOU MAY ALSO LIKE THESE INTERVIEWS",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontFamily: 'Montserrat')),
                  ),
                ),
                SingleChildScrollView(
                  padding: EdgeInsets.only(top: 5),
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      for (int i = 0; i < superherosLength.length; i++)
                        Row(
                          children: [
                            //SizedBox(width: 80,height:60,child: GestureDetector(child: Image.network(jsonDecode(data)['data']['free_content']['$i']['featured_img'],fit: BoxFit.fill,),
                            SizedBox(
                                width: 80,
                                height: 60,
                                child: GestureDetector(
                                  child: CachedNetworkImage(
                                    imageUrl: superherosLength[i]['featured_img'],
                                    fit: BoxFit.fill,
                                    placeholder: (context, url) => Center(
                                        child: CircularProgressIndicator()),
                                    errorWidget: (context, url, error) =>
                                        Icon(Icons.error),
                                  ),
                                  onTap: () {
                                    setState(() {
                                      url = superherosLength[i]['free_video_url'];
                                      imageUrl = superherosLength[i]['featured_img'];
                                      titlepost = superherosLength[i]['post_title'];
                                      isTrue = !isTrue;
                                    });
                                  },
                                )),
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
              child: CircularProgressIndicator(),
            ),
    );
  }
}

class YoutubePlayers extends StatefulWidget {
  final videoURL;
  YoutubePlayers(
    this.videoURL,
  );
  @override
  _VideoState createState() => _VideoState();
}

class _VideoState extends State<YoutubePlayers> {
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
              ],
            );
          },
        ),
      ),
    );
  }
}
