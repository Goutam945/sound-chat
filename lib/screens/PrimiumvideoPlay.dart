import 'package:sound_chat/common/index.dart';
class Primiumvideo extends StatefulWidget {
  final playvideo, title;
  Primiumvideo(this.playvideo, this.title);
  @override
  _PrimiumvideoDesign createState() => _PrimiumvideoDesign();
}
class _PrimiumvideoDesign extends State<Primiumvideo> {
  String data;
  int day = 6;
  int j;
  String url;
  bool isTrue = true;
  String imageUrl;
  String titlepost;
  YoutubePlayerController youtubeController;
  double videoheight = 0.356;
  double videowidth = 1.018;
String email,name;
  bool roated=true;
  @override
  void initState() {
    super.initState();
    _loadSavedData();
  }
  _loadSavedData() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      if(sharedPreferences.getString('email') != null && sharedPreferences.getString('email').isNotEmpty){
        email = sharedPreferences.getString('email');
        name = sharedPreferences.getString('name');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var superherosLength =
        (Provider.of<VideoResponse>(context, listen: false).data != null)
            ? Provider.of<VideoResponse>(context, listen: false).data['data']
            : null;
    return SafeArea(
      child: Stack(
        children: [
          Scaffold(
          backgroundColor: Colors.black,
            appBar: roated?PreferredSize( preferredSize: Size.fromHeight(55),child: Appbar(email,name)):null,
            bottomNavigationBar:   Offstage(offstage:!roated,
              child: Container(
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
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => HomeScreen()));
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
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => HomeScreen()));
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
                          OverlayService().addVideosOverlay(context, VideoPlayerPage());
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
            ),
          body: (superherosLength != null)
              ? Column(
                  children: [
                    Container(
                      height: height * 0.0044,
                      width: width,
                      color: Color(0xFF780001),
                    ),
                    (isTrue)
                        ? Expanded(
                          child: Container(
                              //height: height * videoheight,
                              width: width * videowidth,
                      child: youtubeplayer(url??widget.playvideo,(){setState(() {
                          roated=!roated;
                      });})),
                        )

                      : Container(
                            height: height * 0.346,
                            child: Stack(
                              children: [
                                SizedBox(
                                  height: height * 0.346,
                                  width: width,
                                  child: CachedNetworkImage(
                                    imageUrl: imageUrl,
                                    fit: BoxFit.fill,
                                    placeholder: (context, url) => Center(
                                        child: CircularProgressIndicator()),
                                    errorWidget: (context, url, error) =>
                                        Icon(Icons.error),
                                  ),
                                ),
                                Center(
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
                                  ),
                                )
                              ],
                            ),
                          ),
                    if(roated)
                      Column(
                        children: [
                          Container(
                            color: Color(0xFFB91F24),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Center(
                                child: Text(titlepost ?? widget.title,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Montserrat')),
                              ),
                            ),
                          ),
                        ],
                      ),
            Expanded(
              child: Container(
                  child: ListView(
                    children: [
                    Container(
                      width: width,
                      //height: height * 0.2987,
                      padding: EdgeInsets.all(10),
                      color: Color(0xFF252525),
                      child: Text("Multiple Grammy award winning artist",textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat')),
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
                      padding: EdgeInsets.all(10),
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          for (int i = 0;
                              i < superherosLength['premium_content'].length;
                              i++)
                            Row(
                              children: [
                                //SizedBox(width: 80,height:60,child: GestureDetector(child: Image.network(jsonDecode(data)['data']['free_content']['$i']['featured_img'],fit: BoxFit.fill,),
                                SizedBox(
                                    width: 120,
                                    height: 120,
                                    child: ClipRRect(borderRadius: BorderRadius.circular(10),
                                    child: GestureDetector(
                                      child: CachedNetworkImage(
                                        imageUrl:
                                            superherosLength['premium_content'][i]
                                                ['featured_img'],
                                        fit: BoxFit.fill,
                                        placeholder: (context, url) => Center(
                                            child: CircularProgressIndicator()),
                                        errorWidget: (context, url, error) =>
                                            Icon(Icons.error),
                                      ),
                                      onTap: () {
                                        setState(() {
                                          url =
                                              superherosLength['premium_content']
                                                  [i]['premium_video_url'];
                                          imageUrl =
                                              superherosLength['premium_content']
                                                  [i]['featured_img'];
                                          titlepost =
                                              superherosLength['premium_content']
                                                  [i]['post_title'];
                                          isTrue = false;
                                        });
                                      },
                                    ))),
                                SizedBox(
                                  width: 10,
                                ),
                              ],
                            ),
                        ],
                      ),
                    ),
                      ],),),),
                  ],
                ): Center(
                  child: CircularProgressIndicator(),
                ),
        ),
          if(roated)
          Positioned(
            top: AppBar().preferredSize.height*0.2,
            left: width * 0.39865,
            child: SizedBox(
              height: height * 0.12168,
              width: width * 0.21875,
              child: Image.asset(
                'assets/soundpic.png',
              ),
            ),
          ),
      ]
      ),
    );
  }
}

class youtubeplayer extends StatefulWidget {
  String  videoURL;
  final ontap;
  @override
  _VideoState createState() => _VideoState();
  youtubeplayer(this.videoURL,this.ontap);
}
class _VideoState extends State<youtubeplayer> {
  YoutubePlayerController _controller;
  @override
  void initState() {
    _controller = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(widget.videoURL),
        flags:YoutubePlayerFlags()
    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.black,
          body: Center(
            child: YoutubePlayerBuilder(onEnterFullScreen: widget.ontap,onExitFullScreen: widget.ontap,
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
          )),
    );
  }
}

