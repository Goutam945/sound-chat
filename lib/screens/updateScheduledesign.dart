import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:sound_chat/api/schedule.dart';
import 'package:sound_chat/common/index.dart';
import 'design podcastshowplay.dart';

class UpdateSchedule extends StatefulWidget {
  @override
  _UpdateScheduleState createState() => _UpdateScheduleState();
}

class _UpdateScheduleState extends State<UpdateSchedule> {
  bool play = true;
  String dropdownValue = 'FEATURED SHOWS';
  String data;
  int day = 6;
  int weekday;

  @override
  void initState() {
    super.initState();
    setState(() {
      weekday = DateTime.now().weekday - 1;
      if (weekday == -1) weekday = 6;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var superherosLength = Provider.of<ScheduleResponse>(context, listen: false).data['data'];
    return Stack(
      children: [
        Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            backgroundColor: Color(0xFFE18D13),
            leading: Builder(builder: (BuildContext context) {
              return IconButton(
                icon: Icon(
                  Icons.arrow_back_rounded,
                  color: Colors.white,
                  size: 25,
                ),
                onPressed: () {
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
                    Container(
                      color: Color(0xFF252525),
                      height: height * 0.1024,
                      width: width,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 40),
                        child: Text(
                          "ALL YOUR FAVOURITE SHOW IN ONE PLACE",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color(0xFF606060),
                              fontSize: width * 0.0438,
                              fontStyle: FontStyle.italic),
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
                                    color: Color(0xFFA79A9A),
                                    fontSize: width * 0.0438,
                                  ))),
                        ),
                        Container(
                          color: Color(0xFF464646),
                          width: width * 0.652,
                          child: Center(
                            child: DropdownButton<String>(
                              dropdownColor: Color(0xFF464646),
                              value: dropdownValue,
                              icon: Icon(Icons.arrow_drop_down_sharp),
                              iconSize: 44,
                              elevation: 16,
                              style: TextStyle(color: Color(0xFFA79A9A)),
                              underline: Container(
                                height: 2,
                              ),
                              onChanged: (String newValue) {
                                setState(() {
                                  dropdownValue = newValue;

                                  if (dropdownValue == 'Sunday') weekday = 6;
                                  if (dropdownValue == 'Monday') weekday = 0;
                                  if (dropdownValue == 'Tuesday') weekday = 1;
                                  if (dropdownValue == 'Wednesday') weekday = 2;
                                  if (dropdownValue == 'Thursday') weekday = 3;
                                  if (dropdownValue == 'Friday') weekday = 4;
                                  if (dropdownValue == 'Saturday') weekday = 5;
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
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                    style: TextStyle(fontSize: width * 0.0438),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: height * 0.7056,
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
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    PodcastPlayCloud(
                                                        j, weekday)));
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.only(top: 5),
                                        color: Color(0xFF121212),
                                        child: Row(
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(
                                                right: 12,
                                              ),
                                              width: width * 0.3037,
                                              height: height * 0.1501,
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  border: Border.all(
                                                      color: Colors.white,
                                                      width: 2)),
                                              child: Image.asset(
                                                'assets/imgpodcast.png',
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  width: width * 0.65,
                                                  child: Text(
                                                    superherosLength
                                                                    [weekday]
                                                                ['shows'][j]
                                                            ['show_name']
                                                        .toString(),
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xFFA39597),
                                                        fontSize: 17,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontFamily:
                                                            'Montserrat'),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: width * 0.65,
                                                  child: Text(
                                                    superherosLength
                                                        [weekday]['post_title'],
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xFFA19895),
                                                        fontSize: 14,
                                                        fontFamily:
                                                            'Montserrat'),
                                                  ),
                                                ),
                                                Text(
                                                  "LIVE ON:    " +
                                                      superherosLength
                                                                  [weekday]
                                                              ['shows'][j]
                                                          ['show_start_date'],
                                                  style: TextStyle(
                                                      color: Color(0xFFA19895),
                                                      fontSize: 16,
                                                      fontFamily: 'Montserrat'),
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
                  ],
                )
              : Center(child: CircularProgressIndicator()),
        ),
        Positioned(
          top: height * 0.0402,
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
    );
  }
}
