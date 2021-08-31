import 'package:sound_chat/common/index.dart';

import 'PrimiumvideoPlay.dart';

class InterviewNewPlayer extends StatefulWidget {
  final playvideo, title;

  InterviewNewPlayer(this.playvideo, this.title);

  @override
  _InterviewNewPlayer createState() => _InterviewNewPlayer();
}

class _InterviewNewPlayer extends State<InterviewNewPlayer> {
  String data;
  String email, name;
  int day = 6;
  int j;
  String url;
  bool isTrue = true;
  String imageUrl;
  String titlepost;
  YoutubePlayerController youtubeController;
  double videoheight = 0.356;
  double videowidth = 1.018;
  bool roated = true;

  @override
  void initState() {
    super.initState();
    _loadSavedData();
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
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var superherosLength =
        (Provider.of<VideoResponse>(context, listen: false).data != null)
            ? Provider.of<VideoResponse>(context, listen: false).data['data']
                ['free_content']
            : null;
    return SafeArea(
      child: Stack(children: [
        Scaffold(
          backgroundColor: Color(0xFF222222),
         /* appBar: roated
              ? PreferredSize(
                  preferredSize: Size.fromHeight(55),
                  child: Appbar(email, name))
              : null,
          bottomNavigationBar: Offstage(
            offstage: !roated,
            child:  Bottumnavation(),
          ),*/
          appBar: PreferredSize(preferredSize: Size.fromHeight(55),
              child: Backappbar()),
          body: (superherosLength != null)
              ? Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [Color(0xFF2F3F51), Color(0xFF3A442D)])),
                child: Column(
                    children: [
                      Container(
                        height: height * 0.0044,
                        width: width,
                        color: Color(0xFF780001),
                      ),
                      (isTrue)
                          ? Expanded(
                              child: Container(
                                  //  height: height * videoheight,
                                  width: width * videowidth,
                                  child:
                                      youtubeplayer(url ?? widget.playvideo, () {
                                    setState(() {
                                      roated = !roated;
                                    });
                                  })),
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
                                    child: GestureDetector(
                                      child: Container( padding: EdgeInsets.all(5),
                                        decoration: BoxDecoration(shape: BoxShape.circle,border:Border.all(color: Colors.white,width: 2)),
                                        child: Icon(Icons.play_arrow,
                                            size: 50, color: Colors.white),
                                      ),
                                      onTap: () {
                                        setState(() {
                                          isTrue = !isTrue;
                                        });
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                      if (roated)
                        Row(
                          children: [
                            SizedBox(width: 10,),
                            Container(padding: EdgeInsets.all(5),
                              width: 50,
                              height: 50,

                              child: CircleAvatar(
                                backgroundColor: Colors.transparent,
                                backgroundImage:
                                AssetImage("assets/soundpic.png"),
                              ),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  gradient: LinearGradient(
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                      colors: [Colors.blue, Color(0xFF780001)])),
                            ),
                            Expanded(
                              child: ClipPath(clipper: Cc(),
                                child: Container(height:50 ,
                                  color: Colors.black,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Center(
                                      child: Text(titlepost ?? widget.title,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Color(0xFFF5F6F8),
                                              fontSize: 18,
                                              fontWeight: FontWeight.w900,
                                              fontFamily: 'Montserrat1')),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      SizedBox(height: 10,),
                      Expanded(
                        child: Container(
                          child: ListView(
                            children: [
                              Row(mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: width*0.9,
                                    decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight,
                                            colors: [Color(0xFF363F46), Color(0xFF2B2B2B)])),
                                    padding: EdgeInsets.only(bottom: 15,left: 5,right: 5,top: 5,),
                                    child: Text(
                                        "Multiple Grammy award winning artist Multiple Grammy award winning artist Multiple Grammy award winning artist Multiple Grammy award winning artist ",
                                        // textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Montserrat')),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10,),
                              Row(mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(padding: EdgeInsets.all(5),
                                    color: Colors.black,
                                    child: Text(
                                        "YOU MAY ALSO LIKE THESE INTERVIEWS",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                            fontFamily: 'Montserrat')),
                                  ),
                                ],
                              ),
                              SingleChildScrollView(
                                padding: EdgeInsets.all(10),
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
                                          //SizedBox(width: 80,height:60,child: GestureDetector(child: Image.network(jsonDecode(data)['data']['free_content']['$i']['featured_img'],fit: BoxFit.fill,),
                                          Column(
                                            children: [
                                              SizedBox(
                                                  width: 120,
                                                  height: 120,
                                                  child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(10),
                                                      child: GestureDetector(
                                                        child: CachedNetworkImage(
                                                          imageUrl:
                                                              superherosLength[i]
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
                                                          setState(() {
                                                            url = superherosLength[i]
                                                                ['video_url'];
                                                            imageUrl =
                                                                superherosLength[i]
                                                                    ['feature_img'];
                                                            titlepost =
                                                                superherosLength[i]
                                                                    ['post_title'];
                                                            //isTrue = true;
                                                            isTrue = false;
                                                          });
                                                        },
                                                      ))),
                                              Opacity(opacity: 0.7,
                                                child: Container(height: 20,width: 120,
                                                    color: Colors.black,
                                                    child: Text(superherosLength[i]
                                                    ['post_title'],textAlign: TextAlign.center,
                                                      style: TextStyle(color:Colors.white, fontWeight: FontWeight.w900,
                                                      fontFamily: 'Montserrat',),)),
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
                          ),
                        ),
                      ),
                    ],
                  ),
              )
              : Center(
                  child: CircularProgressIndicator(),
                ),
        ),
        if (roated)
          Positioned(
            top: AppBar().preferredSize.height * 0.2,
            left: width * 0.39865,
            child: SizedBox(
              height: height * 0.12168,
              width: width * 0.21875,
              child: Image.asset(
                'assets/soundpic.png',
              ),
            ),
          ),
      ]),
    );
  }
}

class youtubeplayer extends StatefulWidget {
  String videoURL;
  final ontap;

  @override
  _VideoState createState() => _VideoState();

  youtubeplayer(this.videoURL, this.ontap);
}

class _VideoState extends State<youtubeplayer> {
  YoutubePlayerController _controller;

  @override
  void initState() {
    _controller = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(widget.videoURL),
        flags: YoutubePlayerFlags());
    super.initState();
  }
  @override
  void dispose() {
    _controller.pause();
    // _controller.dispose();
    print("dispose");
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.black,
          body: Center(
            child: YoutubePlayerBuilder(
              onEnterFullScreen: widget.ontap,
              onExitFullScreen: widget.ontap,
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
