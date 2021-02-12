import 'package:sound_chat/common/index.dart';
import 'package:sound_chat/screens/designGallery.dart';
import 'package:sound_chat/screens/newyoutube%20inetrview.dart';

class NewMenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Scaffold(
          backgroundColor: Color(0xFF111111),
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
              SizedBox(
                height: height * 0.20994,
                width: width * 1.06946,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 23),
                      child: Container(
                        child: Column(
                          children: [
                            GestureDetector(
                              child: SizedBox(
                                  height: height * 0.17558,
                                  width: width * 0.3645,
                                  child: Image.asset(
                                    'assets/livechat.png',
                                    fit: BoxFit.fill,
                                  )),
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => AllHomeInterview()));
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 5, left: 80),
                          child: Text(
                            "MENU",
                            style: TextStyle(
                                color: Color(0xFF8A8989), fontSize: 24),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Container(
                            child: Column(
                              children: [
                                GestureDetector(
                                  child: SizedBox(
                                      height: height * 0.1463,
                                      width: width * 0.5833,
                                      child: Image.asset(
                                        'assets/inteview.png',
                                        fit: BoxFit.fill,
                                      )),
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                InterviewNewPlayer()));
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    height: height * 0.44843,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: width * 0.60965,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: const EdgeInsets.only(top: 5),
                                child: Column(
                                  children: [
                                    GestureDetector(
                                      child: SizedBox(
                                          height: height * 0.2414,
                                          width: width * 0.291667,
                                          child: Image.asset(
                                            'assets/shopping.png',
                                            fit: BoxFit.fill,
                                          )),
                                      onTap: () {},
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.only(top: 5),
                                child: Column(
                                  children: [
                                    GestureDetector(
                                      child: SizedBox(
                                          height: height * 0.2414,
                                          width: width * 0.291667,
                                          child: Image.asset(
                                            'assets/photogallery.png',
                                            fit: BoxFit.fill,
                                          )),
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    gallerydesign()));
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 4),
                          child: Column(
                            children: [
                              Container(
                                child: Column(
                                  children: [
                                    GestureDetector(
                                      child: SizedBox(
                                          height: height * 0.1756,
                                          width: width * 0.6076,
                                          child: Image.asset(
                                            'assets/profile.png',
                                            fit: BoxFit.fill,
                                          )),
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Subcribtion()));
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: SizedBox(
                      height: height * 0.46584,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            child: Column(
                              children: [
                                GestureDetector(
                                  child: SizedBox(
                                    height: height * 0.2926,
                                    width: width * 0.34027,
                                    child: Image.asset(
                                      'assets/podcast.png',
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                WebviewPodcast()));
                                  },
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(top: 5),
                            child: Column(
                              children: [
                                GestureDetector(
                                  child: SizedBox(
                                      height: height * 0.1316,
                                      width: width * 0.36458,
                                      child: Image.asset(
                                        'assets/time.png',
                                        scale: 2.5,
                                      )),
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                UpdateSchedule()));
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 1),
                      child: Text("MORE OPTIONS",
                          style: TextStyle(
                              color: Color(0xFF8A8989),
                              fontSize: 24,
                              fontStyle: FontStyle.italic)),
                    ),
                    SizedBox(
                      width: width * 0.39009,
                      child: Divider(
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.3,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.circle,
                                color: Color(0xFF535353),
                                size: 5,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "Push Notifications",
                                style: TextStyle(
                                  color: Color(0xFF535353),
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.circle,
                                color: Color(0xFF535353),
                                size: 5,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "Acount Settings",
                                style: TextStyle(
                                  color: Color(0xFF535353),
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.circle,
                                color: Color(0xFF535353),
                                size: 5,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "App Settings",
                                style: TextStyle(
                                  color: Color(0xFF535353),
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.circle,
                                color: Color(0xFF535353),
                                size: 5,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "Menu Layout",
                                style: TextStyle(
                                  color: Color(0xFF535353),
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.circle,
                                color: Color(0xFF535353),
                                size: 5,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "Chat Settings",
                                style: TextStyle(
                                  color: Color(0xFF535353),
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.circle,
                                color: Color(0xFF535353),
                                size: 5,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "Dark Mode",
                                style: TextStyle(
                                  color: Color(0xFF535353),
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.circle,
                                color: Color(0xFF535353),
                                size: 5,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "Language",
                                style: TextStyle(
                                  color: Color(0xFF535353),
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.circle,
                                color: Color(0xFF535353),
                                size: 5,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "Contact Us",
                                style: TextStyle(
                                  color: Color(0xFF535353),
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.circle,
                                color: Color(0xFF535353),
                                size: 5,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "Cancel Subscription",
                                style: TextStyle(
                                  color: Color(0xFF535353),
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.circle,
                                color: Color(0xFF535353),
                                size: 5,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "EULA & Privacy",
                                style: TextStyle(
                                  color: Color(0xFF535353),
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.circle,
                                color: Color(0xFF535353),
                                size: 5,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "Terms & Condition",
                                style: TextStyle(
                                  color: Color(0xFF535353),
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.circle,
                                color: Color(0xFF535353),
                                size: 5,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "Refund Policy",
                                style: TextStyle(
                                  color: Color(0xFF535353),
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.circle,
                                color: Color(0xFF535353),
                                size: 5,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "lose Account",
                                style: TextStyle(
                                  color: Color(0xFF535353),
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.circle,
                                color: Color(0xFF535353),
                                size: 5,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "Order Tracking",
                                style: TextStyle(
                                  color: Color(0xFF535353),
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "@ Copyright 2020 Irish & Chin Inc.",
                      style: TextStyle(
                        color: Color(0xFF535353),
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        Positioned(
          top: height * 0.0502,
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
