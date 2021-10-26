import 'package:sound_chat/common/index.dart';
import "dart:math";

class AllHomeInterview extends StatefulWidget {
  @override
  _AllHomeInterviewState createState() => _AllHomeInterviewState();
}

class _AllHomeInterviewState extends State<AllHomeInterview> {
  double videoheight = 1.356;
  double videowidth = 1.018;
  String url;
  bool isTrue = true;
  String imageUrl;
  String titlepost;
  String email;
  String name;

  bool roated = true;
  int randomNumber;
  List<int> number;
  int id;
  var membership;

  @override
  void initState() {
    super.initState();
    // createVideoState(context);
    // createPhoneinterviewState(context);
    _loadSavedData()
        .then((value) => createSubcriptionlevalState(id, context).then((value) {
              membership = value.data['data'];
            }));
    setState(() {
      var rng = new Random();
      randomNumber = rng.nextInt(100);
    });
  }

  _loadSavedData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      if (sharedPreferences.getString('email') != null &&
          sharedPreferences.getString('email').isNotEmpty) {
        email = sharedPreferences.getString('email');
        name = sharedPreferences.getString('name');
        id = sharedPreferences.getInt('id');
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
    // var phonesuperherosLength =
    //     (Provider.of<PhoneinterviewResponse>(context, listen: false).data !=
    //             null)
    //         ? Provider.of<PhoneinterviewResponse>(context, listen: false)
    //             .data['data']
    //         : null;
    return SafeArea(
      child: Stack(
        children: [
          Scaffold(
              backgroundColor: Colors.black,
              appBar: PreferredSize(
                  preferredSize: Size.fromHeight(55), child: Backappbar()),
              body: FutureBuilder(
                  future: createVideoState(context),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      var superherosLength = snapshot.data.data['data'];
                      return Container(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [
                              Color(0xFF2F3F51),
                              Color(0xFF3A442D)
                            ])),
                        child: Column(
                          children: [
                            (isTrue)
                                ? Container(
                                    height: height * 0.356,
                                    width: width * videowidth,
                                    child: GestureDetector(
                                      child: Stack(
                                        children: [
                                          SizedBox.expand(
                                            child: (superherosLength != null)
                                                ? CarouselSlider(
                                                    options: CarouselOptions(
                                                      height: double.infinity,
                                                      autoPlay: true,
                                                      enlargeCenterPage: true,
                                                      viewportFraction: 1,
                                                      autoPlayInterval:
                                                          Duration(seconds: 10),
                                                      autoPlayAnimationDuration:
                                                          Duration(seconds: 1),
                                                    ),
                                                    items: <Widget>[
                                                      for (int i = 0;
                                                          i <
                                                              superherosLength[
                                                                      'free_content']
                                                                  .length;
                                                          i++)
                                                        Stack(children: [
                                                          Opacity(
                                                            opacity: 0.9,
                                                            child: Container(
                                                              width:
                                                                  MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width,
                                                              margin: EdgeInsets
                                                                  .symmetric(
                                                                      horizontal:
                                                                          5.0),
                                                              decoration:
                                                                  BoxDecoration(
                                                                image:
                                                                    DecorationImage(
                                                                  image: NetworkImage(baseurlimageinetrviews +
                                                                      superherosLength['free_content']
                                                                              [
                                                                              i]
                                                                          [
                                                                          'feature_img']),
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                                // border:
                                                                //     Border.all(color: Theme.of(context).accentColor),
                                                              ),
                                                            ),
                                                          ),
                                                          Positioned(
                                                              bottom: 70,
                                                              left: 20,
                                                              right:
                                                                  width * 0.4,
                                                              child: Container(
                                                                  child:
                                                                      SizedBox(
                                                                          child:
                                                                              Text(
                                                                superherosLength[
                                                                        'free_content'][i]
                                                                    [
                                                                    'post_title'],
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                    backgroundColor:
                                                                        Colors
                                                                            .black26,
                                                                    fontSize:
                                                                        18),
                                                              )))),
                                                          Positioned(
                                                            bottom: 20,
                                                            left: 20,
                                                            child:
                                                                GestureDetector(
                                                              onTap: () {
                                                                Navigator.of(context).push(MaterialPageRoute(
                                                                    builder: (context) => InterviewNewPlayer(
                                                                        superherosLength['free_content'][i]
                                                                            [
                                                                            'video_url'],
                                                                        superherosLength['free_content'][i]
                                                                            [
                                                                            'post_title'],
                                                                        superherosLength['free_content'][i]
                                                                            [
                                                                            'post_excerpt'],
                                                                        i)));
                                                              },
                                                              child: Container(
                                                                height: 35,
                                                                width: 95,
                                                                decoration: BoxDecoration(
                                                                    color: Colors
                                                                        .black38,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            5),
                                                                    border: Border.all(
                                                                        color: Colors
                                                                            .white)),
                                                                child: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Icon(
                                                                      Icons
                                                                          .play_arrow_sharp,
                                                                      color: Colors
                                                                          .white,
                                                                    ),
                                                                    Text(
                                                                      'WATCH',
                                                                      style: TextStyle(
                                                                          color:
                                                                              Colors.white),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ]),
                                                    ],
                                                  )
                                                : Center(
                                                    child:
                                                        CircularProgressIndicator()),
                                          ),
                                        ],
                                      ),
                                      onTap: () {
                                        setState(() {
                                          // Navigator.of(context).push(
                                          //     MaterialPageRoute(
                                          //         builder: (context) =>
                                          //             InterviewNewPlayer(
                                          //                 superherosLength['free_content'][randomNumber]['free_video_url'],superherosLength['free_content'][randomNumber]['post_title'])));
                                        });
                                      },
                                    ),
                                  )
                                : Container(
                                    height: height * 0.346,
                                    child: Stack(
                                      children: [
                                        SizedBox(
                                          height: height * 0.346, width: width,
                                          // ),
                                          child: CachedNetworkImage(
                                            imageUrl: imageUrl,
                                            fit: BoxFit.fill,
                                            placeholder: (context, url) => Center(
                                                child:
                                                    CircularProgressIndicator()),
                                            errorWidget:
                                                (context, url, error) =>
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
                                        padding:
                                            const EdgeInsets.only(left: 15),
                                        child: Center(
                                          child: Text(
                                              "CURRENTLY THREDING INTERVIEWS",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Color(0xFFF5F6F8),
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w900,
                                                  fontFamily: 'Montserrat1')),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            if (roated)
                              Expanded(
                                child: Container(
                                  child: ListView(
                                    children: [
                                      Container(
                                        height: height * 0.0512,
                                        width: width,
                                        decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                                begin: Alignment.topLeft,
                                                end: Alignment.bottomRight,
                                                colors: <Color>[
                                              Color(0xFF074516),
                                              Color(0xFF050608),
                                            ])),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 5, left: 10),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("PRIMIUM INTERVIEWS",
                                                  textAlign: TextAlign.start,
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 15,
                                                      fontFamily:
                                                          'Montserrat')),
                                              GestureDetector(
                                                onTap: () {
                                                  Navigator.push(
                                                      context,
                                                      PageTransition(
                                                          type:
                                                              PageTransitionType
                                                                  .rightToLeft,
                                                          child:
                                                              PrimiumvideoScreen()));
                                                },
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 10),
                                                  child: Text(
                                                    "View More",
                                                    style: TextStyle(
                                                        color: Colors.red),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Container(
                                          width: width * 1.01998,
                                          color: Color(0xFF222222),
                                          child: SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                for (int i = 0;
                                                    i <
                                                        superherosLength[
                                                                'premium_content']
                                                            .length;
                                                    i++)
                                                  Row(
                                                    children: [
                                                      Column(
                                                        children: [
                                                          SizedBox(
                                                              width: width *
                                                                  0.3094,
                                                              height: height *
                                                                  0.1977,
                                                              child:
                                                                  GestureDetector(
                                                                child: Stack(
                                                                  children: [
                                                                    SizedBox
                                                                        .expand(
                                                                      child:
                                                                          Container(
                                                                        child:
                                                                            Opacity(
                                                                          opacity:
                                                                              0.7,
                                                                          child:
                                                                              ClipRRect(
                                                                            borderRadius:
                                                                                BorderRadius.circular(10),
                                                                            child:
                                                                                CachedNetworkImage(
                                                                              imageUrl: baseurlimageinetrviews + superherosLength['premium_content'][i]['feature_img'],
                                                                              fit: BoxFit.cover,
                                                                              placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                                                                              errorWidget: (context, url, error) => Icon(Icons.error),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                onTap: () {
                                                                  Navigator.of(context).push(MaterialPageRoute(
                                                                      builder: (context) => (email == null)
                                                                          ? NewLogin()
                                                                          : (membership != null && membership['stripe_status'] == 'ACTIVE')
                                                                              ? Primiumvideo(superherosLength['premium_content'][i]['video_url'], superherosLength['premium_content'][i]['post_title'], superherosLength['premium_content'][i]['post_excerpt'], i)
                                                                              : UpgradeSubscription()));
                                                                  // Toast.show("PREMIUM MEMBERSHIP", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
                                                                },
                                                              )),
                                                          Opacity(
                                                            opacity: 0.7,
                                                            child: Container(
                                                                height: 20,
                                                                width: width *
                                                                    0.3094,
                                                                color: Colors
                                                                    .black,
                                                                child: Text(
                                                                  superherosLength[
                                                                          'premium_content'][i]
                                                                      [
                                                                      'post_title'],
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style:
                                                                      TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w900,
                                                                    fontFamily:
                                                                        'Montserrat',
                                                                  ),
                                                                )),
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
                                        ),
                                      ),
                                      Container(
                                        height: height * 0.0512,
                                        width: width,
                                        decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                                begin: Alignment.topLeft,
                                                end: Alignment.bottomRight,
                                                colors: <Color>[
                                              Color(0xFF050406),
                                              Color(0xFF1B1C1E),
                                            ])),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 5, left: 10),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("BIG YELLOW TENT INTERVIEWS",
                                                  textAlign: TextAlign.start,
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 15,
                                                      fontFamily:
                                                          'Montserrat')),
                                              GestureDetector(
                                                onTap: () {
                                                  Navigator.push(
                                                      context,
                                                      PageTransition(
                                                          type:
                                                              PageTransitionType
                                                                  .rightToLeft,
                                                          child:
                                                              YellowvideoScreen()));
                                                },
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 10),
                                                  child: Text(
                                                    "View More",
                                                    style: TextStyle(
                                                        color: Colors.red),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Container(
                                          width: width * 1.01998,
                                          color: Color(0xFF222222),
                                          child: SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                for (int i = 0;
                                                    i <
                                                        superherosLength[
                                                                'yellow_content']
                                                            .length;
                                                    i++)
                                                  Row(
                                                    children: [
                                                      //SizedBox(width: 80,height:60,child: GestureDetector(child: Image.network(jsonDecode(data)['data']['free_content']['$i']['featured_img'],fit: BoxFit.fill,),
                                                      Column(
                                                        children: [
                                                          SizedBox(
                                                              width: width *
                                                                  0.3094,
                                                              height: height *
                                                                  0.1977,
                                                              child:
                                                                  GestureDetector(
                                                                child: Stack(
                                                                  children: [
                                                                    SizedBox
                                                                        .expand(
                                                                      child:
                                                                          Container(
                                                                        child:
                                                                            Opacity(
                                                                          opacity:
                                                                              0.7,
                                                                          child:
                                                                              ClipRRect(
                                                                            borderRadius:
                                                                                BorderRadius.circular(10),
                                                                            child:
                                                                                CachedNetworkImage(
                                                                              imageUrl: baseurlimageinetrviews + superherosLength['yellow_content'][i]['feature_img'],
                                                                              fit: BoxFit.cover,
                                                                              placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                                                                              errorWidget: (context, url, error) => Icon(Icons.error),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    /*Positioned(bottom: 5,left: 20,right: 20,child: Container(decoration: BoxDecoration(
                                                          boxShadow: [
                                                            BoxShadow(offset: Offset(0.0,5.0),
                                                              color: Colors.black,
                                                              blurRadius: 15.0,
                                                            ),
                                                          ]),
                                                          child: SizedBox(height: 30,child: Text(superherosLength['yellow_content'][i]['post_title'],textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontWeight:FontWeight.normal,fontSize: 12),))))*/
                                                                  ],
                                                                ),
                                                                onTap: () {
                                                                  setState(() {
                                                                    Navigator.of(context).push(MaterialPageRoute(
                                                                        builder: (context) => InterviewPlay(
                                                                            superherosLength['yellow_content'][i]['video_url'],
                                                                            superherosLength['yellow_content'][i]['post_title'],
                                                                            superherosLength['yellow_content'][i]['post_excerpt'],
                                                                            i)));
                                                                  });
                                                                },
                                                              )),
                                                          Opacity(
                                                            opacity: 0.7,
                                                            child: Container(
                                                                height: 20,
                                                                width: width *
                                                                    0.3094,
                                                                color: Colors
                                                                    .black,
                                                                child: Text(
                                                                  superherosLength[
                                                                          'yellow_content'][i]
                                                                      [
                                                                      'post_title'],
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style:
                                                                      TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w900,
                                                                    fontFamily:
                                                                        'Montserrat',
                                                                  ),
                                                                )),
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
                                        ),
                                      ),
                                      Container(
                                        height: height * 0.0512,
                                        width: width,
                                        decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                                begin: Alignment.topLeft,
                                                end: Alignment.bottomRight,
                                                colors: <Color>[
                                              Color(0xFF050406),
                                              Color(0xFF1B1C1E),
                                            ])),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 5, left: 10),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("IN STUDIO INTERVIEWS",
                                                  textAlign: TextAlign.start,
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 15,
                                                      fontFamily:
                                                          'Montserrat')),
                                              GestureDetector(
                                                onTap: () {
                                                  Navigator.push(
                                                      context,
                                                      PageTransition(
                                                          type:
                                                              PageTransitionType
                                                                  .rightToLeft,
                                                          child:
                                                              StudiovideoScreen()));
                                                },
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 10),
                                                  child: Text(
                                                    "View More",
                                                    style: TextStyle(
                                                        color: Colors.red),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Container(
                                          width: width * 1.01998,
                                          color: Color(0xFF222222),
                                          child: SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                for (int i = 0;
                                                    i <
                                                        superherosLength[
                                                                'free_content']
                                                            .length;
                                                    i++)
                                                  Row(
                                                    children: [
                                                      Column(
                                                        children: [
                                                          SizedBox(
                                                              width: width *
                                                                  0.3094,
                                                              height: height *
                                                                  0.1977,
                                                              child:
                                                                  GestureDetector(
                                                                child: Stack(
                                                                  children: [
                                                                    SizedBox
                                                                        .expand(
                                                                      child:
                                                                          Container(
                                                                        child:
                                                                            Opacity(
                                                                          opacity:
                                                                              0.7,
                                                                          child:
                                                                              ClipRRect(
                                                                            borderRadius:
                                                                                BorderRadius.circular(10),
                                                                            child:
                                                                                CachedNetworkImage(
                                                                              imageUrl: baseurlimageinetrviews + superherosLength['free_content'][i]['feature_img'],
                                                                              fit: BoxFit.cover,
                                                                              placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                                                                              errorWidget: (context, url, error) => Icon(Icons.error),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    /*Positioned(bottom: 10,left: 20,right: 20,child: Container(decoration: BoxDecoration(
                                                          boxShadow: [
                                                            BoxShadow(offset: Offset(0.0,5.0),
                                                              color: Colors.black,
                                                              blurRadius: 15.0,
                                                            ),
                                                          ]),
                                                          child: SizedBox(height: 30,child: Text(superherosLength['free_content'][i]['post_title'],textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontWeight:FontWeight.normal,fontSize: 12),))))*/
                                                                  ],
                                                                ),
                                                                onTap: () {
                                                                  setState(() {
                                                                    Navigator.of(context).push(MaterialPageRoute(
                                                                        builder: (context) => InterviewNewPlayer(
                                                                            superherosLength['free_content'][i]['video_url'],
                                                                            superherosLength['free_content'][i]['post_title'],
                                                                            superherosLength['free_content'][i]['post_excerpt'],
                                                                            i)));
                                                                  });
                                                                },
                                                              )),
                                                          Opacity(
                                                            opacity: 0.7,
                                                            child: Container(
                                                                height: 20,
                                                                width: width *
                                                                    0.3094,
                                                                color: Colors
                                                                    .black,
                                                                child: Text(
                                                                  superherosLength[
                                                                          'free_content'][i]
                                                                      [
                                                                      'post_title'],
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style:
                                                                      TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w900,
                                                                    fontFamily:
                                                                        'Montserrat',
                                                                  ),
                                                                )),
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
                                        ),
                                      ),
                                      FutureBuilder(
                                          future: createPhoneinterviewState(
                                              context),
                                          builder: (context, snapshot) {
                                            if (snapshot.hasData) {
                                              var phonesuperherosLength =
                                                  snapshot.data.data['data'];
                                              return Column(
                                                children: [
                                                  Container(
                                                    height: height * 0.0512,
                                                    width: width,
                                                    decoration: BoxDecoration(
                                                      gradient: LinearGradient(
                                                          begin:
                                                              Alignment.topLeft,
                                                          end: Alignment
                                                              .bottomRight,
                                                          colors: <Color>[
                                                            Color(0xFF050406),
                                                            Color(0xFF1B1C1E),
                                                          ]),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 5, left: 10),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                              "PHONE INTERVIEWS",
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize: 15,
                                                                  fontFamily:
                                                                      'Montserrat')),
                                                          GestureDetector(
                                                            onTap: () {
                                                              Navigator.push(
                                                                  context,
                                                                  PageTransition(
                                                                      type: PageTransitionType
                                                                          .rightToLeft,
                                                                      child:
                                                                          PhonevideoScreen()));
                                                            },
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      right:
                                                                          10),
                                                              child: Text(
                                                                "View More",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .red),
                                                              ),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            5.0),
                                                    child: Container(
                                                      width: width * 1.01998,
                                                      color: Color(0xFF222222),
                                                      child:
                                                          SingleChildScrollView(
                                                        scrollDirection:
                                                            Axis.horizontal,
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceEvenly,
                                                          children: [
                                                            for (int i = 0;
                                                                i <
                                                                    phonesuperherosLength
                                                                        .length;
                                                                i++)
                                                              Row(
                                                                children: [
                                                                  Column(
                                                                    children: [
                                                                      SizedBox(
                                                                          width: width *
                                                                              0.3094,
                                                                          height: height *
                                                                              0.1977,
                                                                          child:
                                                                              GestureDetector(
                                                                            child:
                                                                                Stack(
                                                                              children: [
                                                                                SizedBox.expand(
                                                                                  child: Container(
                                                                                    child: Opacity(
                                                                                      opacity: 0.7,
                                                                                      child: ClipRRect(
                                                                                        borderRadius: BorderRadius.circular(10),
                                                                                        child: CachedNetworkImage(
                                                                                          imageUrl: baseurlimageinetrviews + phonesuperherosLength[i]['feature_img'],
                                                                                          fit: BoxFit.cover,
                                                                                          placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                                                                                          errorWidget: (context, url, error) => Icon(Icons.error),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                /*Positioned(bottom: 10,left: 20,right: 20,child: Container(decoration: BoxDecoration(
                                                              boxShadow: [
                                                                BoxShadow(offset: Offset(0.0,5.0),
                                                                  color: Colors.black,
                                                                  blurRadius: 15.0,
                                                                ),
                                                              ]),
                                                              child: SizedBox(height: 30,child: Text(phonesuperherosLength[i]['post_title'],textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontWeight:FontWeight.normal,fontSize: 12),))))*/
                                                                              ],
                                                                            ),
                                                                            onTap:
                                                                                () {
                                                                              setState(() {
                                                                                Navigator.of(context).push(MaterialPageRoute(
                                                                                    builder: (context) => PhoneinteviewPlayer(
                                                                                          phonesuperherosLength[i]['video_url'],
                                                                                          phonesuperherosLength[i]['post_title'],
                                                                                          phonesuperherosLength[i]['post_excerpt'],
                                                                                          i,
                                                                                        )));
                                                                              });
                                                                            },
                                                                          )),
                                                                      Opacity(
                                                                        opacity:
                                                                            0.7,
                                                                        child: Container(
                                                                            height: 20,
                                                                            width: width * 0.3094,
                                                                            color: Colors.black,
                                                                            child: Text(
                                                                              phonesuperherosLength[i]['post_title'],
                                                                              textAlign: TextAlign.center,
                                                                              style: TextStyle(
                                                                                color: Colors.white,
                                                                                fontWeight: FontWeight.w900,
                                                                                fontFamily: 'Montserrat',
                                                                              ),
                                                                            )),
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
                                                    ),
                                                  ),
                                                ],
                                              );
                                            }
                                            if (snapshot.hasError)
                                              return Center(
                                                child:
                                                    CircularProgressIndicator(),
                                              );
                                            return Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            );
                                          }),
                                    ],
                                  ),
                                ),
                              ),
                          ],
                        ),
                      );
                    }
                    if (snapshot.hasError)
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                    ;
                  })),
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
        ],
      ),
    );
  }
}
