import 'package:flutter/material.dart';

class PodcastList extends StatefulWidget {
  @override
  _PodcastListState createState() => _PodcastListState();
}

class _PodcastListState extends State<PodcastList> {
  bool play = true;
  String dropdownValue = 'FEATURED SHOWS';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
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
          ),
          body: Column(
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
                          });
                        },
                        items: <String>[
                          'FEATURED SHOWS',
                          'SUNDAY',
                          'MONDAY',
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
                  child: Column(
                    children: [
                      for (int i = 0; i < 15; i++)
                        GestureDetector(
                          onTap: () {},
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: Container(
                                  color: Color(0xFF121212),
                                  child: Row(
                                    children: [
                                      Container(
                                          padding: EdgeInsets.only(
                                            left: 0,
                                          ),
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
                                          )),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "NATRAL'S NOOK",
                                            style: TextStyle(
                                                color: Color(0xFFA39597),
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'Montserrat'),
                                          ),
                                          SizedBox(
                                              width: 270,
                                              child: Text(
                                                "The Contraversal radio talk Shows",
                                                style: TextStyle(
                                                    color: Color(0xFFA19895),
                                                    fontSize: 14,
                                                    fontFamily: 'Montserrat'),
                                              )),
                                          Text(
                                            "LIVE ON",
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
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
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
