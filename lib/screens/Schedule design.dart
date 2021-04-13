import 'package:sound_chat/common/index.dart';

import 'NewLogin.dart';
class ScheduleDesign extends StatefulWidget {
  @override
  _ScheduleDesign createState() => _ScheduleDesign();
}

class _ScheduleDesign extends State<ScheduleDesign> {
  String data;
  int day;
  int weekday;
  String dropdownValue = 'FEATURED SHOWS';
  List<bool>_hasBeenPressed=[for(int i=0;i<7;i++)true];
  var superherosLength;
  String email;
  String name ;
  @override
  void initState() {
    super.initState();
    _loadSavedData();
    setState(() {
      weekday = DateTime.now().weekday - 1;
      if (weekday == -1) weekday = 6;

      day=DateTime.now().weekday-1;
      if(day==-1)
        day=6;
    });
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
  AudioStream stream = new AudioStream('https://s2.voscast.com:9059/stream');

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    if(Provider.of<ScheduleResponse>(context, listen: false).data!=null)
   superherosLength = Provider.of<ScheduleResponse>(context, listen: false).data['data'];
    return SafeArea(
      child: Stack(
        children:[ Scaffold(
          backgroundColor: Colors.black,
          appBar: PreferredSize( preferredSize: Size.fromHeight(55),child: Appbar(email,name)),
          bottomNavigationBar:   Container(
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
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
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
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
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
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => NewMenuScreen()));
                    },
                  ),
                ],
              ),
            ),
          ),
          body: (superherosLength != null)
              ? ListView(
                  children: [
                    Column(
                      children: [
                        Column(
                          children: [
                            SizedBox(
                              height: height * 0.2002,
                              width: width * 1.018,
                              child: Image.network(
                                'https://i0.wp.com/soundchatradio.com/wp-content/uploads/2020/07/rsz_soundchat_wall-min.jpg?fit=960%2C500&ssl=1&resize=350%2C200',
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          child: Padding(
                            padding: EdgeInsets.only(right: width * 0.3314),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 4, right: 90),
                              child: Text("UPCOMMING SHOWS",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontStyle: FontStyle.italic)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: (superherosLength.length != null)
                          ? Row(
                              children: [
                                for (int j = 0;
                                    j <
                                        superherosLength[weekday]['shows']
                                            .length;
                                    j++)
                                  SizedBox(
                                    height: height * 0.2341,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 10, left: 5),
                                          child: Container(
                                            width: width * 0.2037,
                                            height: height * 0.1053,
                                            child: CircleAvatar(
                                              backgroundImage:
                                                  AssetImage("assets/circle.png"),
                                            ),
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.white),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(top: 10),
                                          child: SizedBox(
                                              width: 120,
                                              child: Center(
                                                child: Text(
                                                  superherosLength[weekday]
                                                          ['shows'][j]['show_name']
                                                      .toString(),
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 14,
                                                    fontStyle: FontStyle.italic,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                              )),
                                        ),
                                        Text(
                                          superherosLength[weekday]
                                              ['post_title'],
                                          style: TextStyle(
                                            color: Colors.deepOrange,
                                            fontSize: 13,
                                            fontStyle: FontStyle.italic,
                                          ),
                                        ),
                                        Text(
                                          superherosLength[weekday]['shows']
                                              [j]['show_start_date'],
                                          style: TextStyle(
                                            color: Color(0xFFE18D13),
                                            fontSize: 12,
                                            fontStyle: FontStyle.italic,
                                          ),
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
                   /* Container(
                      child: Padding(
                        padding: EdgeInsets.only(right: width * 0.3314),
                        child: Padding(
                          padding:
                              const EdgeInsets.only(top: 10, left: 20, bottom: 10),
                          child: Text("WEEKLY SHEDULE",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontStyle: FontStyle.italic)),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 30,
                          width: 30,
                          // color: Colors.white,
                          color: _hasBeenPressed[0] ? Colors.white : Colors.grey,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                day = 6;
                                _hasBeenPressed=_hasBeenPressed.asMap().entries.map((e) => e.key==0 ? false:true).toList();
                              });
                            },
                            child: Center(
                                child: Text("S",
                                    style: TextStyle(
                                      color: Color(0xFFC66E3A),
                                      fontSize: 20,
                                    ))),
                          ),
                        ),
                        Container(
                          height: 30,
                          width: 30,
                          //  color: Colors.white,
                          color: _hasBeenPressed[1] ? Colors.white : Colors.grey,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                day = 0;
                                _hasBeenPressed=_hasBeenPressed.asMap().entries.map((e) => e.key==1 ? false:true).toList();
                              });
                            },
                            child: Center(
                                child: Text("M",
                                    style: TextStyle(
                                      color: Color(0xFFC66E3A),
                                      fontSize: 20,
                                    ))),
                          ),
                        ),
                        Container(
                          height: 30,
                          width: 30,
                          //color: Colors.white,
                          color: _hasBeenPressed[2] ? Colors.white : Colors.grey,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                day = 1;
                                _hasBeenPressed=_hasBeenPressed.asMap().entries.map((e) => e.key==2 ? false:true).toList();
                              });
                            },
                            child: Center(
                                child: Text("T",
                                    style: TextStyle(
                                      color: Color(0xFFC66E3A),
                                      fontSize: 20,
                                    ))),
                          ),
                        ),
                        Container(
                          height: 30,
                          width: 30,
                          // color: Colors.white,
                          color: _hasBeenPressed[3] ? Colors.white : Colors.grey,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                day = 2;
                                _hasBeenPressed=_hasBeenPressed.asMap().entries.map((e) => e.key==3 ? false:true).toList();
                              });
                            },
                            child: Center(
                                child: Text("W",
                                    style: TextStyle(
                                      color: Color(0xFFC66E3A),
                                      fontSize: 20,
                                    ))),
                          ),
                        ),
                        Container(
                          height: 30,
                          width: 30,
                          //color: Colors.white,
                          color: _hasBeenPressed[4] ? Colors.white : Colors.grey,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                day = 3;
                                _hasBeenPressed=_hasBeenPressed.asMap().entries.map((e) => e.key==4 ? false:true).toList();
                              });
                            },
                            child: Center(
                                child: Text("T",
                                    style: TextStyle(
                                      color: Color(0xFFC66E3A),
                                      fontSize: 20,
                                    ))),
                          ),
                        ),
                        Container(
                          height: 30,
                          width: 30,
                          // color: Colors.white,
                          color: _hasBeenPressed[5] ? Colors.white : Colors.grey,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                day = 4;
                                _hasBeenPressed=_hasBeenPressed.asMap().entries.map((e) => e.key==5 ? false:true).toList();
                              });
                            },
                            child: Center(
                                child: Text("F",
                                    style: TextStyle(
                                      color: Color(0xFFC66E3A),
                                      fontSize: 20,
                                    ))),
                          ),
                        ),
                        Container(
                          height: 30,
                          width: 30,
                          //color: Colors.white,
                          color: _hasBeenPressed[6] ? Colors.white : Colors.grey,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                day = 5;
                                _hasBeenPressed=_hasBeenPressed.asMap().entries.map((e) => e.key==6 ? false:true).toList();
                              });
                            },
                            child: Center(
                                child: Text("S",
                                    style: TextStyle(
                                      color: Color(0xFFC66E3A),
                                      fontSize: 20,
                                    ))),
                          ),
                        ),
                      ],
                    ),
                    for (int j = 0;
                        j < superherosLength[day]['shows'].length;
                        j++)
                      GestureDetector(
                        onTap: (){
                          stream.stop();
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=> (email==null)?DesignLogin():PodcastPlayCloud(j, weekday)));
                        },
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Row(
                                children: [
                                  Container(
                                    width: width * 0.2037,
                                    height: height * 0.1001,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.white, width: 4)),
                                    child: Image.asset("assets/pic.jpg"),
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 10),
                                        child: Text(
                                          superherosLength[day]['shows'][j]
                                              ['show_name'],
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 10, top: 5),
                                            child: Text(
                                              superherosLength[day]
                                                  ['post_title'],
                                              style: TextStyle(
                                                  color: Color(0xFF645D5D),
                                                  fontSize: 12),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 40, top: 5),
                                            child: Text(
                                              superherosLength[day]['shows']
                                                  [j]['show_start_date'],
                                              style: TextStyle(
                                                  color: Color(0xFF645D5D),
                                                  fontSize: 12),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),*/
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
                                    color: Color(0xFFA79A9A),
                                    fontSize: width * 0.0438,
                                  ))),
                        ),
                        Container(
                          color: Color(0xFF464646),
                          width: width * 0.652,
                          height: height * 0.0702,
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

                                  if (dropdownValue == 'Sunday') day = 6;
                                  if (dropdownValue == 'Monday') day = 0;
                                  if (dropdownValue == 'Tuesday') day = 1;
                                  if (dropdownValue == 'Wednesday') day = 2;
                                  if (dropdownValue == 'Thursday') day = 3;
                                  if (dropdownValue == 'Friday') day = 4;
                                  if (dropdownValue == 'Saturday') day = 5;
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
                      //height: height * 0.7056,
                      child: SingleChildScrollView(
                        child: (superherosLength.length != null)
                            ?
                        Column(
                          children: [
                            for (int j = 0;
                            j <
                                superherosLength[day]
                                ['shows']
                                    .length;
                            j++)
                              GestureDetector(
                                onTap: () {
                                  stream.stop();
                                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> (email==null)?NewLogin():PodcastPlayCloud(j, weekday)));
                                },
                                child: Container(
                                  // padding: const EdgeInsets.only(top: 5),
                                  margin: const EdgeInsets.only(top: 5),
                                  color: Colors.white10,
                                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                          width: width * 0.3037,
                                          child: Image.asset(
                                            'assets/imgpodcast.png',
                                            fit: BoxFit.fill,
                                          )),
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
                                              [day]
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
                                              [day]['post_title'],
                                              style: TextStyle(
                                                  color:
                                                  Color(0xFFA19895),
                                                  fontSize: 14,
                                                  fontFamily:
                                                  'Montserrat'),
                                            ),
                                          ),
                                          Text(superherosLength
                                          [day]
                                          ['shows'][j]
                                          ['show_start_date']+ "  - " +
                                                superherosLength
                                                [day]
                                                ['shows'][j]
                                                ['show_end_date'],
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
