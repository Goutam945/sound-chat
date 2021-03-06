import 'dart:io';
import 'dart:ui';
import 'package:sound_chat/common/index.dart';
import 'package:sound_chat/screens/image_slider.dart';

class Updatehome extends StatefulWidget {
  const Updatehome({Key key}) : super(key: key);

  @override
  _UpdatehomeState createState() => _UpdatehomeState();
}

class _UpdatehomeState extends State<Updatehome> {
  int id;

  Future<int> loadSavedData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      if (sharedPreferences.getString('email') != null &&
          sharedPreferences.getString('email').isNotEmpty) {
        email = sharedPreferences.getString('email');
        name = sharedPreferences.getString('name');
        id = sharedPreferences.getInt('id');
      }
    });
    return id;
  }

  String email;
  String name;
  String data;
  bool listen = true;

  // bool play = true;
  bool stop = true;
  String status = 'hidden';
  //var superherosLength;
  var timeAndDate;
  int day;
  int weekday;
  int time;
  var startTime;
  var endTime;
  var endTimeMin;
  int showtime = 0;
  var homeslider;
  //var bannerads;
  int imageNo = 0;
  int bannerno = 0;
  bool isButtonPressed = false;
  var apivideointerview;
  var scheduleapi;
  var bannerapi;
  @override
  void initState() {
    super.initState();
    //_loadSavedData().then((value) => createSubcriptionlevalState(id, context));
    setState(() {
      //  weekday = 7 - DateTime.now().weekday;
      weekday =
          7 - DateTime.now().subtract(Duration(hours: 9, minutes: 30)).weekday;
    });

    //apis calls
    // createPhoneinterviewState(context);
    // createScheduleState(context);
    // createHomesliderState(context);
    // createAllpr   oductState(context);
    // createtermsState(context);
    // createCoupncodeState(context);
    apivideointerview = createVideoState(context);
    scheduleapi = createScheduleState(context);
    bannerapi = createBanneradsState(context);
  }

  void didChangeAppLifecycleState(AppLifecycleState state) {
    // Fluttertoast.showToast(msg: state.toString());
    // print('AppLifeCycle State: ' + state.toString());
    switch (state) {
      case AppLifecycleState.detached:
        exit(0);
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    // if (Provider.of<ScheduleResponse>(context, listen: false).data != null)
    //   timeAndDate =
    //       Provider.of<ScheduleResponse>(context, listen: false).data['data'];

    return SafeArea(
        child: Scaffold(
      extendBody: true,
      body: Container(
        // padding: EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Color(0xFF2F3F51), Color(0xFF3A442D)])),
        child: ListView(
          children: [
            SizedBox(
              height: 100,
              child: Opacity(
                  opacity: 0.7,
                  child: FutureBuilder(
                      future: bannerapi,
                      builder: (context, snapshot) {
                        if (snapshot.hasData)
                          return CarouselSlider(
                            options: CarouselOptions(
                              onPageChanged: (value, image) {
                                setState(() {
                                  bannerno = value;
                                });
                              },
                              height: 100,
                              autoPlay: true,
                              enlargeCenterPage: true,
                              viewportFraction: 1,
                              autoPlayInterval: Duration(seconds: 10),
                              autoPlayAnimationDuration: Duration(seconds: 5),
                            ),
                            items: <Widget>[
                              for (int i = 0;
                                  i < snapshot.data.data['data'].length;
                                  i++)
                                Container(
                                  width: width * 0.9,
                                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                                  child: CachedNetworkImage(
                                    imageUrl: baseurlimage +
                                        snapshot.data.data['data'][i]
                                            ['mobilebanner'],
                                    fit: BoxFit.fill,
                                    placeholder: (context, url) => SizedBox(
                                      child: Shimmer.fromColors(
                                          baseColor: Colors.red,
                                          highlightColor: Colors.yellow,
                                          child: Container(
                                            color: Colors.black12,
                                          )),
                                    ),
                                    errorWidget: (context, url, error) =>
                                        Icon(Icons.error),
                                  ),
                                ),
                            ],
                          );
                        if (snapshot.hasError)
                          return Shimmer.fromColors(
                            baseColor: Colors.black12,
                            highlightColor: Colors.grey[600],
                            child: Container(
                              margin: EdgeInsets.symmetric(vertical: 10),
                              color: Colors.black,
                              width: width * 0.95,
                              height: height * 0.5,
                            ),
                          );
                        return SizedBox();
                      })),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ImageSlider(),
            ),
            Container(
                //padding: const EdgeInsets.all(8.0),
                width: width * 1.01998,
                color: Color(0xFF171719),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          pageIndex = 1;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 40,
                              width: 85,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                      color: Colors.white, width: 4)),
                              child: Text(
                                "LIVE",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 26,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              width: 40,
                            ),
                            SizedBox(
                              width: 200,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  FutureBuilder(
                                      future: scheduleapi,
                                      builder: (context, snapshot) {
                                        if (snapshot.hasData) {
                                          showtime = getschedule(
                                              context: context,
                                              data: snapshot.data.data['data']);

                                          return Text(
                                            snapshot
                                                .data
                                                .data['data'][weekday]
                                                    ['scheduleperdays']
                                                    [showtime]['show_name']
                                                .toString(),
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          );
                                        }
                                        if (snapshot.hasError)
                                          return Shimmer.fromColors(
                                            baseColor: Colors.black12,
                                            highlightColor: Colors.grey[600],
                                            child: Container(
                                              margin: EdgeInsets.symmetric(
                                                  vertical: 10),
                                              color: Colors.black,
                                              width: 200,
                                              height: 20,
                                            ),
                                          );
                                        return Shimmer.fromColors(
                                          baseColor: Colors.black12,
                                          highlightColor: Colors.grey[600],
                                          child: Container(
                                            margin: EdgeInsets.symmetric(
                                                vertical: 10),
                                            color: Colors.black,
                                            width: 200,
                                            height: 20,
                                          ),
                                        );
                                      }),
                                  Divider(
                                    thickness: 3,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    "Soundchat Radio",
                                    style: TextStyle(
                                      color: Colors.white54,
                                      fontSize: 10,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    FutureBuilder(
                        future: apivideointerview,
                        builder: (context, snapshot) {
                          if (snapshot.hasData)
                            return Container(
                              color: Color(0xFF171719),
                              padding: EdgeInsets.only(
                                  bottom: 10, right: 10, left: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(
                                        left: 10, right: 10, top: 2),
                                    margin: EdgeInsets.only(right: width * 0.5),
                                    color: Colors.black,
                                    height: height * 0.0366,
                                    child: Text("RECENT INTERVIEWS",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontFamily: fontfamily,
                                        )),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        for (int i = 0;
                                            i <
                                                snapshot
                                                    .data
                                                    .data['data']
                                                        ['free_content']
                                                    .length;
                                            i++)
                                          Row(
                                            children: [
                                              Column(
                                                children: [
                                                  SizedBox(
                                                      width: 100,
                                                      height: 100,
                                                      child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          child:
                                                              GestureDetector(
                                                            child:
                                                                CachedNetworkImage(
                                                              imageUrl: baseurlimageinetrviews +
                                                                  snapshot.data.data[
                                                                              'data']
                                                                          [
                                                                          'free_content'][i]
                                                                      [
                                                                      'feature_img'],
                                                              fit: BoxFit.cover,
                                                              placeholder: (context,
                                                                      url) =>
                                                                  Center(
                                                                      child:
                                                                          CircularProgressIndicator()),
                                                              errorWidget: (context,
                                                                      url,
                                                                      error) =>
                                                                  Icon(Icons
                                                                      .error),
                                                            ),
                                                            onTap: () {
                                                              Navigator.of(context).push(
                                                                  MaterialPageRoute(
                                                                      builder: (context) =>
                                                                          InterviewNewPlayer(
                                                                            snapshot.data.data['data']['free_content'][i]['video_url'],
                                                                            snapshot.data.data['data']['free_content'][i]['post_title'],
                                                                            snapshot.data.data['data']['free_content'][i]['post_excerpt'],
                                                                            i,
                                                                          )));
                                                            },
                                                          ))),
                                                  /*  Opacity(
                                                        opacity: 0.7,
                                                        child: Container(
                                                            height: 20,
                                                            width: 120,
                                                            color: Colors.black,
                                                            child: Text(
                                                              superherosLength[
                                                                      'free_content'][i]
                                                                  ['post_title'],
                                                              textAlign: TextAlign.center,
                                                              style: TextStyle(
                                                                color: Colors.white,
                                                                fontWeight: FontWeight.w900,
                                                                fontFamily: 'Montserrat',
                                                              ),
                                                            )),
                                                      )*/
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
                            );
                          if (snapshot.hasError)
                            return Center(
                              child: Shimmer.fromColors(
                                baseColor: Colors.black12,
                                highlightColor: Colors.grey[600],
                                child: Container(
                                    color: Colors.black,
                                    width: width,
                                    height: height * 0.13),
                              ),
                            );
                          return Shimmer.fromColors(
                            baseColor: Colors.black12,
                            highlightColor: Colors.grey[600],
                            child: Container(
                              margin: EdgeInsets.symmetric(vertical: 10),
                              color: Colors.black,
                              width: width,
                              height: height * 0.13,
                            ),
                          );
                        }),
                  ],
                )),
          ],
        ),
      ),
    ));
  }
}
