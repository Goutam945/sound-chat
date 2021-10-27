import 'package:audioplayers/audioplayers.dart';
import 'package:sound_chat/common/index.dart';

class PodcastSchedule extends StatefulWidget {
  @override
  _PodcastScheduleState createState() => _PodcastScheduleState();
}

class _PodcastScheduleState extends State<PodcastSchedule> {
  bool play = true;
  String dropdownValue = 'FEATURED SHOWS';
  String data;
  //int day = 6;
  int weekday;
  // var superherosLength;
  String email;
  String name;
  var membership;
  int id;
  @override
  void initState() {
    super.initState();
    setState(() {
      //weekday = 7 - DateTime.now().weekday;
      weekday =
          7 - DateTime.now().subtract(Duration(hours: 9, minutes: 30)).weekday;
    });
    _loadSavedData()
        .then((value) => createSubcriptionlevalState(id, context).then((value) {
              membership = value.data['data'];
            }));
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

  AudioPlayer audioPlayer = new AudioPlayer(
      playerId: 'Soundchat Radio', mode: PlayerMode.MEDIA_PLAYER);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    // if (Provider.of<ScheduleResponse>(context, listen: false).data != null)
    //   superherosLength =
    //       Provider.of<ScheduleResponse>(context, listen: false).data['data'];
    return SafeArea(
      child: Stack(
        children: [
          Scaffold(
              extendBody: false,
              backgroundColor: Colors.black,
              appBar: PreferredSize(
                  preferredSize: Size.fromHeight(55), child: Backappbar()),
              body: FutureBuilder(
                  future: createScheduleState(context),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      var superherosLength = snapshot.data.data['data'];
                      return SizedBox(
                        height: height,
                        child: Column(
                          children: [
                            Container(
                              color: Colors.black,
                              height: height * 0.1224,
                              width: width,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 50),
                                child: Text(
                                  "ALL YOUR FAVOURITE SHOW IN ONE PLACE",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontFamily: fontfamily,
                                  ),
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Container(
                                  color: Color(0xFF8E0E14),
                                  height: height * 0.0702,
                                  width: width * 0.3469,
                                  child: Center(
                                      child: Text("PODCAST FOR:",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontFamily: fontfamily))),
                                ),
                                Container(
                                  color: Color(0xFF464646),
                                  width: width * 0.652,
                                  height: height * 0.0702,
                                  child: Center(
                                    child: DropdownButton<String>(
                                      dropdownColor: Colors.black,
                                      value: dropdownValue,
                                      icon: Icon(Icons.arrow_drop_down_sharp),
                                      iconSize: 44,
                                      elevation: 16,
                                      style: TextStyle(color: Colors.white),
                                      underline: Container(
                                        height: 2,
                                      ),
                                      onChanged: (String newValue) {
                                        setState(() {
                                          dropdownValue = newValue;

                                          if (dropdownValue == 'Sunday')
                                            weekday = 0;
                                          if (dropdownValue == 'Monday')
                                            weekday = 6;
                                          if (dropdownValue == 'Tuesday')
                                            weekday = 5;
                                          if (dropdownValue == 'Wednesday')
                                            weekday = 4;
                                          if (dropdownValue == 'Thursday')
                                            weekday = 3;
                                          if (dropdownValue == 'Friday')
                                            weekday = 2;
                                          if (dropdownValue == 'Saturday')
                                            weekday = 1;
                                        });
                                      },
                                      items: <String>[
                                        'FEATURED SHOWS',
                                        'Sunday',
                                        'Monday',
                                        'Tuesday',
                                        'Wednesday',
                                        'Thursday',
                                        'Friday',
                                        'Saturday'
                                      ].map<DropdownMenuItem<String>>(
                                          (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(
                                            value,
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontFamily: fontfamily),
                                          ),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Expanded(
                              child: Container(
                                //height: height * 0.7056,
                                child: SingleChildScrollView(
                                  child: (superherosLength.length != null)
                                      ? Column(
                                          children: [
                                            for (int j = 0;
                                                j <
                                                    superherosLength[weekday]
                                                            ['shows']
                                                        .length;
                                                j++)
                                              GestureDetector(
                                                onTap: () {
                                                  audioPlayer.pause();
                                                  Navigator.push(
                                                      context,
                                                      PageTransition(
                                                          type:
                                                              PageTransitionType
                                                                  .rightToLeft,
                                                          child: (email == null)
                                                              ? NewLogin()
                                                              : (membership !=
                                                                          null &&
                                                                      membership[
                                                                              'stripe_status'] ==
                                                                          'ACTIVE')
                                                                  ? PodcastPlayCloud(
                                                                      j,
                                                                      weekday)
                                                                  : UpgradeSubscription()));
                                                },
                                                child: Container(
                                                  // padding: const EdgeInsets.only(top: 5),
                                                  margin: const EdgeInsets.only(
                                                      top: 5),
                                                  color: Colors.white10,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      SizedBox(
                                                        width: 120,
                                                        child: (superherosLength[
                                                                            weekday]
                                                                        [
                                                                        'shows'][j]
                                                                    [
                                                                    'show_image'] !=
                                                                null)
                                                            ? CachedNetworkImage(
                                                                imageUrl: baseurlimagepodcast +
                                                                    superherosLength[weekday]['shows'][j]
                                                                            [
                                                                            'show_image']
                                                                        .toString(),
                                                                fit:
                                                                    BoxFit.fill,
                                                                placeholder:
                                                                    (context,
                                                                            url) =>
                                                                        SizedBox(
                                                                  height: 120,
                                                                  child: Center(
                                                                      child:
                                                                          CircularProgressIndicator()),
                                                                ),
                                                                errorWidget:
                                                                    (context,
                                                                            url,
                                                                            error) =>
                                                                        SizedBox(
                                                                  height: 120,
                                                                  child: Icon(
                                                                    Icons.error,
                                                                    color: Colors
                                                                        .white,
                                                                  ),
                                                                ),
                                                              )
                                                            : Container(
                                                                color: Color(
                                                                    0xff324a69),
                                                                child:
                                                                    Image.asset(
                                                                  'assets/soundpic.png',
                                                                  fit: BoxFit
                                                                      .fill,
                                                                ),
                                                              ),
                                                      ),
                                                      Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          SizedBox(
                                                            width: width * 0.65,
                                                            child: Text(
                                                              superherosLength[
                                                                              weekday]
                                                                          [
                                                                          'shows'][j]
                                                                      [
                                                                      'show_name']
                                                                  .toString(),
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize: 17,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontFamily:
                                                                      fontfamily),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: width * 0.65,
                                                            child: Text(
                                                              superherosLength[
                                                                      weekday][
                                                                  'post_title'],
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize: 14,
                                                                  fontFamily:
                                                                      fontfamily),
                                                            ),
                                                          ),
                                                          Text(
                                                            "LIVE ON:  " +
                                                                superherosLength[
                                                                            weekday]
                                                                        [
                                                                        'shows'][j]
                                                                    [
                                                                    'show_start_date'],
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 16,
                                                                fontFamily:
                                                                    fontfamily),
                                                          )
                                                        ],
                                                      )
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
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                    if (snapshot.hasError) {
                      return Errorwidget(
                        onTap: () {
                          setState(() {
                            createScheduleState(context);
                          });
                        },
                      );
                    }
                    return Center(child: CircularProgressIndicator());
                  })),
          Positioned(
            top: AppBar().preferredSize.height * 0.2,
            left: width * 0.39865,
            child: SizedBox(
              height: height * 0.13168,
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
