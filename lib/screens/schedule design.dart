import 'package:flutter/material.dart';
import 'package:sound_chat/common/index.dart';
import 'package:audioplayers/audioplayers.dart';

class ScheduleDesign extends StatefulWidget {
  @override
  _ScheduleDesign createState() => _ScheduleDesign();
}

class _ScheduleDesign extends State<ScheduleDesign> {
  String data;
  int day;
  int weekday;
  String dropdownValue = 'FEATURED SHOWS';
  //var superherosLength;
  String email;
  String name;
  var membership;
  int showtime = 0;
  int id;
  @override
  void initState() {
    super.initState();
    _loadSavedData()
        .then((value) => createSubcriptionlevalState(id, context).then((value) {
              membership = value.data['data'];
            }));
    setState(() {
      weekday =
          7 - DateTime.now().subtract(Duration(hours: 9, minutes: 30)).weekday;
      day =
          7 - DateTime.now().subtract(Duration(hours: 9, minutes: 30)).weekday;

      // weekday =
      //     DateTime.now().subtract(Duration(hours: 10, minutes: 30)).weekday - 1;
      // if (weekday == -1) weekday = 6;
      // day =
      //     DateTime.now().subtract(Duration(hours: 10, minutes: 30)).weekday - 1;
      // if (day == -1) day = 6;
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
      child: Stack(children: [
        Scaffold(
            backgroundColor: Colors.black,
            appBar: PreferredSize(
                preferredSize: Size.fromHeight(55), child: Backappbar()),
            body: FutureBuilder(
                future: createScheduleState(context),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    var superherosLength = snapshot.data.data['data'];
                    showtime =
                        getschedule(context: context, data: superherosLength);
                    return ListView(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            // Column(
                            //   children: [
                            //     SizedBox(
                            //       height: height * 0.2002,
                            //       width: width * 1.018,
                            //       child: Image.network(
                            //         'https://i0.wp.com/soundchatradio.com/wp-content/uploads/2020/07/rsz_soundchat_wall-min.jpg?fit=960%2C500&ssl=1&resize=350%2C200',
                            //         fit: BoxFit.fitWidth,
                            //       ),
                            //     ),
                            //   ],
                            // ),
                            Container(
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(top: 4, left: 10),
                                child: Text("UPCOMMING SHOWS",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                    )),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: (superherosLength.length != null)
                              ? Row(
                                  children: [
                                    for (int j = showtime;
                                        j <
                                            superherosLength[weekday]
                                                    ['scheduleperdays']
                                                .length;
                                        j++)
                                      SizedBox(
                                        height: height * 0.2341,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 10, left: 5),
                                              child: Container(
                                                width: width * 0.2037,
                                                height: height * 0.1053,
                                                child: CircleAvatar(
                                                  backgroundColor:
                                                      Color(0xff324a69),
                                                  backgroundImage: (superherosLength[
                                                                          weekday]
                                                                      [
                                                                      'scheduleperdays'][j]
                                                                  [
                                                                  'show_image'] !=
                                                              null &&
                                                          superherosLength[
                                                                          weekday]
                                                                      [
                                                                      'scheduleperdays'][j]
                                                                  [
                                                                  'show_image'] !=
                                                              "")
                                                      ? NetworkImage(
                                                          baseurlimagepodcast +
                                                              superherosLength[
                                                                              weekday]
                                                                          [
                                                                          'scheduleperdays'][j]
                                                                      [
                                                                      'show_image']
                                                                  .toString(),
                                                        )
                                                      : AssetImage(
                                                          'assets/soundpic.png',
                                                        ),
                                                ),
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: Colors.white),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 10),
                                              child: SizedBox(
                                                  width: 120,
                                                  child: Center(
                                                    child: SizedBox(
                                                      height: 20,
                                                      child: Text(
                                                        superherosLength[
                                                                        weekday]
                                                                    [
                                                                    'scheduleperdays']
                                                                [j]['show_name']
                                                            .toString(),
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 13,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontFamily:
                                                                fontfamily),
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                    ),
                                                  )),
                                            ),
                                            Text(
                                              superherosLength[weekday]
                                                  ['post_title'],
                                              style: TextStyle(
                                                color: Colors.deepOrange,
                                                fontSize: 11,
                                                fontFamily: fontfamily,
                                              ),
                                            ),
                                            Text(
                                              superherosLength[weekday]
                                                      ['scheduleperdays'][j]
                                                  ['show_start_date'],
                                              style: TextStyle(
                                                  color: Color(0xFFE18D13),
                                                  fontSize: 11,
                                                  fontFamily: fontfamily),
                                            ),
                                          ],
                                        ),
                                      ),
                                  ],
                                )
                              : Center(
                                  child: CircularProgressIndicator(),
                                ),
                        ),
                        Row(
                          children: [
                            Container(
                              color: Color(0xFF8E0E14),
                              height: height * 0.0702,
                              width: width * 0.3469,
                              child: Center(
                                  child: Text("WEEKLY SHEDULE:",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontFamily: fontfamily,
                                      ))),
                            ),
                            Container(
                              color: Color(0xFF464646),
                              width: width * 0.652,
                              height: height * 0.0702,
                              child: Center(
                                child: DropdownButton<String>(
                                  dropdownColor: Colors.black,
                                  value: dropdownValue,
                                  icon: Icon(
                                    Icons.arrow_drop_down_sharp,
                                    color: Colors.white,
                                  ),
                                  iconSize: 44,
                                  elevation: 16,
                                  style: TextStyle(color: Colors.white),
                                  underline: Container(
                                    height: 2,
                                  ),
                                  onChanged: (String newValue) {
                                    setState(() {
                                      dropdownValue = newValue;

                                      /* if (dropdownValue == 'Sunday') day = 6;
                                      if (dropdownValue == 'Monday') day = 0;
                                      if (dropdownValue == 'Tuesday') day = 1;
                                      if (dropdownValue == 'Wednesday') day = 2;
                                      if (dropdownValue == 'Thursday') day = 3;
                                      if (dropdownValue == 'Friday') day = 4;
                                      if (dropdownValue == 'Saturday') day = 5;*/
                                      if (dropdownValue == 'Sunday') day = 0;
                                      if (dropdownValue == 'Saturday') day = 1;
                                      if (dropdownValue == 'Friday') day = 2;
                                      if (dropdownValue == 'Thursday') day = 3;
                                      if (dropdownValue == 'Wednesday') day = 4;
                                      if (dropdownValue == 'Tuesday') day = 5;
                                      if (dropdownValue == 'Monday') day = 6;
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
                                            fontSize: 14,
                                            fontFamily: fontfamily),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          //height: height * 0.7056,
                          child: SingleChildScrollView(
                            child: (superherosLength.length != null)
                                ? Column(
                                    children: [
                                      for (int j = 0;
                                          j <
                                              superherosLength[day]
                                                      ['scheduleperdays']
                                                  .length;
                                          j++)
                                        GestureDetector(
                                          onTap: () {
                                            audioPlayer.pause();
                                            //Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> (email==null)?NewLogin():PodcastPlayCloud(j, weekday)));

                                            Navigator.push(
                                                context,
                                                PageTransition(
                                                    type: PageTransitionType
                                                        .rightToLeft,
                                                    child: (email == null)
                                                        ? NewLogin()
                                                        : (membership != null &&
                                                                membership[
                                                                        'stripe_status'] ==
                                                                    'ACTIVE')
                                                            ? PodcastPlayCloud(
                                                                j, day)
                                                            : UpgradeSubscription()));
                                          },
                                          child: Container(
                                            // padding: const EdgeInsets.only(top: 5),
                                            margin:
                                                const EdgeInsets.only(top: 5),
                                            color: Colors.white10,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  width: 80,
                                                  child: (superherosLength[day][
                                                                      'scheduleperdays'][j]
                                                                  [
                                                                  'show_image'] !=
                                                              null &&
                                                          superherosLength[day][
                                                                      'scheduleperdays'][j]
                                                                  [
                                                                  'show_image'] !=
                                                              "")
                                                      ? CachedNetworkImage(
                                                          imageUrl: baseurlimagepodcast +
                                                              superherosLength[
                                                                              day]
                                                                          [
                                                                          'scheduleperdays'][j]
                                                                      [
                                                                      'show_image']
                                                                  .toString(),
                                                          fit: BoxFit.fill,
                                                          placeholder:
                                                              (context, url) =>
                                                                  SizedBox(
                                                            height: 80,
                                                            child: Center(
                                                                child:
                                                                    CircularProgressIndicator()),
                                                          ),
                                                          errorWidget: (context,
                                                                  url, error) =>
                                                              SizedBox(
                                                            height: 80,
                                                            child: Icon(
                                                              Icons.error,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                        )
                                                      : Container(
                                                          color:
                                                              Color(0xff324a69),
                                                          child: Image.asset(
                                                            'assets/soundpic.png',
                                                            fit: BoxFit.fill,
                                                          ),
                                                        ),
                                                ),
                                                SizedBox(
                                                  width: 30,
                                                ),
                                                Expanded(
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        superherosLength[day][
                                                                    'scheduleperdays']
                                                                [j]['show_name']
                                                            .toString(),
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontFamily:
                                                                fontfamily),
                                                      ),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      Text(
                                                        superherosLength[day]
                                                            ['post_title'],
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 11,
                                                            fontFamily:
                                                                fontfamily),
                                                      ),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      Text(
                                                        superherosLength[day][
                                                                    'scheduleperdays'][j]
                                                                [
                                                                'show_start_date'] +
                                                            "  - " +
                                                            superherosLength[
                                                                        day][
                                                                    'scheduleperdays'][j]
                                                                [
                                                                'show_end_date'],
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 11,
                                                            fontFamily:
                                                                fontfamily),
                                                      )
                                                    ],
                                                  ),
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
                      ],
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
            height: height * 0.10168,
            width: width * 0.20275,
            child: Image.asset(
              'assets/soundpic.png',
            ),
          ),
        ),
      ]),
    );
  }
}
