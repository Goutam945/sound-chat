import 'package:sound_chat/common/index.dart';

class YellowvideoScreen extends StatefulWidget {
  YellowvideoScreen({Key key}) : super(key: key);

  @override
  _YellowvideoScreenState createState() => _YellowvideoScreenState();
}

class _YellowvideoScreenState extends State<YellowvideoScreen> {
  String email;
  String name;
  var apivideointerview;
  @override
  void initState() {
    super.initState();
    _loadSavedData();
    apivideointerview = createVideoState(context);
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
    // var superherosLength =
    //     (Provider.of<VideoResponse>(context, listen: false).data != null)
    //         ? Provider.of<VideoResponse>(context, listen: false).data['data']
    //         : null;
    return SafeArea(
      child: Stack(
        children: [
          Scaffold(
            backgroundColor: Color(0xFF222222),
            appBar: AppBar(
              backgroundColor: themeColor,
              titleSpacing: 0,
              title: Image.asset(
                'assets/soundpic.png',
                scale: 9.5,
              ),
              actions: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Text("BIG YELLOW TENT INTERVIEWS",
                        maxLines: 1,
                        overflow: TextOverflow.clip,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        )),
                  ),
                )
              ],
            ),
            body: FutureBuilder(
                future: apivideointerview,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    var superherosLength = snapshot.data.data['data'];
                    return
                        /*Column(
                      children: [
                        // Container(
                        //   height: height * 0.0512,
                        //   width: width,
                        //   margin: EdgeInsets.only(top: 25),
                        //   padding: EdgeInsets.only(left: 10),
                        //   decoration: BoxDecoration(
                        //       gradient: LinearGradient(
                        //           begin: Alignment.topLeft,
                        //           end: Alignment.bottomRight,
                        //           colors: <Color>[
                        //         Color(0xFF074516),
                        //         Color(0xFF074516),
                        //       ])),
                        //   child: Align(
                        //       alignment: Alignment.centerLeft,
                        //       child: Text("BIG YELLOW TENT INTERVIEWS",
                        //           textAlign: TextAlign.center,
                        //           style: TextStyle(
                        //               color: Colors.white,
                        //               fontSize: 15,
                        //               fontFamily: 'Montserrat'))),
                        // ),

                        Expanded(
                          child: GridView.count(
                            crossAxisCount: 2,
                            primary: false,
                            // padding: const EdgeInsets.all(16),
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            children: <Widget>[
                              for (int i = 0;
                                  i < superherosLength['yellow_content'].length;
                                  i++)
                                GestureDetector(
                                  child: Stack(
                                    children: [
                                      AspectRatio(
                                        aspectRatio: 1,
                                        child: Opacity(
                                          opacity: 0.8,
                                          child: CachedNetworkImage(
                                            imageUrl: baseurlimageinetrviews +
                                                superherosLength[
                                                        'yellow_content'][i]
                                                    ['feature_img'],
                                            fit: BoxFit.cover,
                                            placeholder: (context, url) => Center(
                                                child:
                                                    CircularProgressIndicator()),
                                            errorWidget:
                                                (context, url, error) =>
                                                    Icon(Icons.error),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                          bottom: 0,
                                          left: 0,
                                          right: 0,
                                          child: Container(
                                              height: 18,
                                              width: width * 0.3094,
                                              color: Colors.black,
                                              child: SizedBox(
                                                  child: Text(
                                                superherosLength[
                                                        'yellow_content'][i]
                                                    ['post_title'],
                                                textAlign: TextAlign.center,
                                                maxLines: 1,
                                                overflow: TextOverflow.clip,
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontFamily: fontfamily),
                                              ))))
                                    ],
                                  ),
                                  onTap: () {
                                    setState(() {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  InterviewPlay(
                                                      superherosLength[
                                                              'yellow_content']
                                                          [i]['video_url'],
                                                      superherosLength[
                                                              'yellow_content']
                                                          [i]['post_title'],
                                                      superherosLength[
                                                              'yellow_content']
                                                          [i]['post_excerpt'],
                                                      i)));
                                    });
                                  },
                                ),
                            ],
                          ),
                        ),
                      ],
                    );*/
                        ListView.builder(
                            itemCount:
                                superherosLength['yellow_content'].length,
                            itemBuilder: (context, i) {
                              return Column(
                                children: [
                                  GestureDetector(
                                    child: Stack(
                                      children: [
                                        Opacity(
                                          opacity: 0.8,
                                          child: CachedNetworkImage(
                                            height: 220,
                                            width: width,
                                            imageUrl: baseurlimageinetrviews +
                                                superherosLength[
                                                        'yellow_content'][i]
                                                    ['feature_img'],
                                            fit: BoxFit.cover,
                                            placeholder: (context, url) => Center(
                                                child:
                                                    CircularProgressIndicator()),
                                            errorWidget:
                                                (context, url, error) =>
                                                    Icon(Icons.error),
                                          ),
                                        ),
                                        Positioned(
                                          top: 75,
                                          left: width * 0.4,
                                          child: Container(
                                            padding: EdgeInsets.all(5),
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                    color: Colors.white,
                                                    width: 2)),
                                            child: Icon((Icons.play_arrow),
                                                size: 50,
                                                color: Color(0xFFFFFEFF)),
                                          ),
                                        ),
                                      ],
                                    ),
                                    onTap: () {
                                      setState(() {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    InterviewPlay(
                                                        superherosLength[
                                                                'yellow_content']
                                                            [i]['video_url'],
                                                        superherosLength[
                                                                'yellow_content']
                                                            [i]['post_title'],
                                                        superherosLength[
                                                                'yellow_content']
                                                            [i]['post_excerpt'],
                                                        i)));
                                      });
                                    },
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(5),
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
                                                colors: [
                                                  Colors.blue,
                                                  Color(0xFF780001)
                                                ])),
                                      ),
                                      Expanded(
                                        child: ClipPath(
                                          clipper: Cc(),
                                          child: Container(
                                            height: 50,
                                            color: Colors.black,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 15),
                                              child: Center(
                                                child: Text(
                                                    superherosLength[
                                                            'yellow_content'][i]
                                                        ['post_title'],
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      color: Color(0xFFF5F6F8),
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    )),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  )
                                ],
                              );
                            });
                  }
                  if (snapshot.hasError) {
                    return Errorwidget(
                      onTap: () {
                        setState(() {
                          createVideoState(context);
                          createPhoneinterviewState(context);
                        });
                      },
                    );
                  }
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }),
          ),
          // Positioned(
          //   top: AppBar().preferredSize.height * 0.2,
          //   left: width * 0.39865,
          //   child: SizedBox(
          //     height: height * 0.10168,
          //     width: width * 0.20275,
          //     child: Image.asset(
          //       'assets/soundpic.png',
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
