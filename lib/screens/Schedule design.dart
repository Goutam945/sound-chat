import 'package:sound_chat/api/schedule.dart';
import 'package:sound_chat/common/index.dart';

class ScheduleDesign extends StatefulWidget {
  @override
  _ScheduleDesign createState() => _ScheduleDesign();
}

class _ScheduleDesign extends State<ScheduleDesign> {
  String data;
  int day = 6;
  int weekday;
  bool _hasBeenPressed = true,
      _hasBeenPressed1 = true,
      _hasBeenPressed2 = true,
      _hasBeenPressed3 = true,
      _hasBeenPressed4 = true,
      _hasBeenPressed5 = true,
      _hasBeenPressed6 = true;

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
    return Scaffold(
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
        title: Text(
          "Show Schedule",
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
                          child: Image.asset(
                            'assets/shoundchat.png',
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
                Container(
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
                      color: _hasBeenPressed ? Colors.white : Colors.grey,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            day = 6;
                            _hasBeenPressed = !_hasBeenPressed;
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
                      color: _hasBeenPressed1 ? Colors.white : Colors.grey,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            day = 0;
                            _hasBeenPressed1 = !_hasBeenPressed1;
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
                      color: _hasBeenPressed2 ? Colors.white : Colors.grey,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            day = 1;
                            _hasBeenPressed2 = !_hasBeenPressed2;
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
                      color: _hasBeenPressed3 ? Colors.white : Colors.grey,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            day = 2;
                            _hasBeenPressed3 = !_hasBeenPressed3;
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
                      color: _hasBeenPressed4 ? Colors.white : Colors.grey,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            day = 3;
                            _hasBeenPressed4 = !_hasBeenPressed4;
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
                      color: _hasBeenPressed5 ? Colors.white : Colors.grey,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            day = 4;
                            _hasBeenPressed5 = !_hasBeenPressed5;
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
                      color: _hasBeenPressed6 ? Colors.white : Colors.grey,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            day = 5;
                            _hasBeenPressed6 = !_hasBeenPressed6;
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
                  Column(
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
              ],
            )
          : Center(child: CircularProgressIndicator()),
    );
  }
}
