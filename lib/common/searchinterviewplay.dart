import 'package:sound_chat/api/search_api.dart';
import 'package:sound_chat/common/index.dart';

class SearchinterviewNewPlayer extends StatefulWidget {
  final playvideo, title;

  SearchinterviewNewPlayer(this.playvideo, this.title);

  @override
  _SInterviewNewPlayer createState() => _SInterviewNewPlayer();
}

class _SInterviewNewPlayer extends State<SearchinterviewNewPlayer> {
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
  List video = [];
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
    Map data = Provider.of<SearchResponse>(context, listen: false).data;
    if (data != null) {
      video = data['data']['video'];
    }
    return SafeArea(
      child: Stack(children: [
        Scaffold(
          backgroundColor: Colors.black,
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(55), child: Appbar(email, name)),
          body: (video != null)
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
                                //  height: height * videoheight,
                                width: width * videowidth,
                                child: Youtubeplayer(
                                    globalKey, url ?? widget.playvideo, () {
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
                    Column(
                      children: [
                        Container(
                          color: Color(0xFFAD1E24),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Center(
                              child: Text(titlepost ?? widget.title,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Color(0xFFF5F6F8),
                                      fontSize: 18,
                                      fontFamily: 'Montserrat1')),
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
                              padding: EdgeInsets.all(10),
                              color: Color(0xFF252525),
                              child: Text(
                                  "Multiple Grammy award winning artist",
                                  textAlign: TextAlign.center,
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
                                child: Text(
                                    "YOU MAY ALSO LIKE THESE INTERVIEWS",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontFamily: 'Montserrat')),
                              ),
                            ),
                            if (video != null)
                              if (video.length != 0)
                                SingleChildScrollView(
                                  padding: EdgeInsets.all(10),
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      for (int i = 0; i < video.length; i++)
                                        Row(
                                          children: [
                                            //SizedBox(width: 80,height:60,child: GestureDetector(child: Image.network(jsonDecode(data)['data']['free_content']['$i']['featured_img'],fit: BoxFit.fill,),
                                            SizedBox(
                                                width: 120,
                                                height: 120,
                                                child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    child: GestureDetector(
                                                      child: CachedNetworkImage(
                                                        imageUrl: video[i]
                                                            ['featured_img'],
                                                        fit: BoxFit.fill,
                                                        placeholder: (context,
                                                                url) =>
                                                            Center(
                                                                child:
                                                                    CircularProgressIndicator()),
                                                        errorWidget: (context,
                                                                url, error) =>
                                                            Icon(Icons.error),
                                                      ),
                                                      onTap: () {
                                                        setState(() {
                                                          url = video[i][
                                                              'free_video_url'];
                                                          imageUrl = video[i]
                                                              ['featured_img'];
                                                          titlepost = video[i]
                                                              ['post_title'];

                                                          //isTrue = false;
                                                          globalKey.currentState
                                                              .load();
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
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              : Center(
                  child: CircularProgressIndicator(),
                ),
        ),
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
