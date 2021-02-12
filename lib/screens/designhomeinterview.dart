import 'package:sound_chat/common/index.dart';

class AllHomeInterview extends StatefulWidget {
  @override
  _AllHomeInterviewState createState() => _AllHomeInterviewState();
}

class _AllHomeInterviewState extends State<AllHomeInterview> {
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
          body: ListView(
            children: [
              Container(
                height: height * 0.0044,
                width: width,
                color: Color(0xFF780001),
              ),
              Column(
                children: [
                  SizedBox(
                    child: Image.asset(
                      'assets/images.jpeg',
                      fit: BoxFit.fill,
                    ),
                    height: height * 0.3103,
                    width: width,
                  ),
                  Container(
                    height: height * 0.0512,
                    width: width,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.bottomRight,
                            colors: <Color>[
                          Color(0xFFA10B0F),
                          Color(0xFF074516),
                        ])),
                    child: Center(
                        child: Text("CURRENTLY THREDING INTERVIEW",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ))),
                  ),
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
                      padding: const EdgeInsets.only(top: 5, left: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("PRIMIUM INTERVIEWS",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontFamily: 'Montserrat')),
                          GestureDetector(
                            child: Icon(
                              Icons.add,
                              color: Colors.red,
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
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            for (int i = 0; i < 130; i++)
                              Row(
                                children: [
                                  SizedBox(
                                      width: width * 0.1944,
                                      height: height * 0.0877,
                                      child: GestureDetector(
                                        child: CachedNetworkImage(
                                          imageUrl:
                                              "https://soundchatradio.com/wp-content/uploads/2019/07/A-451606-1321738107.jpeg.jpg",
                                          placeholder: (context, url) => Center(
                                              child:
                                                  CircularProgressIndicator()),
                                          errorWidget: (context, url, error) =>
                                              Icon(Icons.error),
                                        ),
                                        onTap: () {},
                                      )),
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
                      padding: const EdgeInsets.only(top: 5, left: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("BIG YELLOW TENT INTERVIEWS",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontFamily: 'Montserrat')),
                          GestureDetector(
                            child: Icon(
                              Icons.add,
                              color: Colors.red,
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
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            for (int i = 0; i < 130; i++)
                              Row(
                                children: [
                                  SizedBox(
                                      width: width * 0.1944,
                                      height: height * 0.0877,
                                      child: GestureDetector(
                                        child: CachedNetworkImage(
                                          imageUrl:
                                              "https://www.soundchatradio.com/wp-content/uploads/2014/09/unnamed-3.jpg",
                                          placeholder: (context, url) => Center(
                                              child:
                                                  CircularProgressIndicator()),
                                          errorWidget: (context, url, error) =>
                                              Icon(Icons.error),
                                        ),
                                        onTap: () {},
                                      )),
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
                      padding: const EdgeInsets.only(top: 5, left: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("IN STUDIO INTERVIEWS",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontFamily: 'Montserrat')),
                          GestureDetector(
                            child: Icon(
                              Icons.add,
                              color: Colors.red,
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
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            for (int i = 0; i < 130; i++)
                              Row(
                                children: [
                                  SizedBox(
                                      width: width * 0.1944,
                                      height: height * 0.0877,
                                      child: GestureDetector(
                                        child: CachedNetworkImage(
                                          imageUrl:
                                              "https://www.soundchatradio.com/wp-content/uploads/2014/08/freddy-krueger.jpg",
                                          placeholder: (context, url) => Center(
                                              child:
                                                  CircularProgressIndicator()),
                                          errorWidget: (context, url, error) =>
                                              Icon(Icons.error),
                                        ),
                                        onTap: () {},
                                      )),
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
                      padding: const EdgeInsets.only(top: 5, left: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("SOUNDCHAT TVINTERVIEWS",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontFamily: 'Montserrat')),
                          GestureDetector(
                            child: Icon(
                              Icons.add,
                              color: Colors.red,
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
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            for (int i = 0; i < 130; i++)
                              Row(
                                children: [
                                  SizedBox(
                                      width: width * 0.1944,
                                      height: height * 0.0877,
                                      child: GestureDetector(
                                        child: CachedNetworkImage(
                                          imageUrl:
                                              "https://www.soundchatradio.com/wp-content/uploads/2013/07/MG_8596-copy.jpg",
                                          placeholder: (context, url) => Center(
                                              child:
                                                  CircularProgressIndicator()),
                                          errorWidget: (context, url, error) =>
                                              Icon(Icons.error),
                                        ),
                                        onTap: () {},
                                      )),
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
              ),
            ],
          ),
        ),
        Positioned(
          top: height * 0.0402,
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
    );
  }
}
