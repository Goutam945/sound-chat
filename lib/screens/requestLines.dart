import 'package:sound_chat/common/index.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';

class RequestLines extends StatefulWidget {
  @override
  _RequestLinesState createState() => _RequestLinesState();
}

class _RequestLinesState extends State<RequestLines> {
  @override
  void initState() {
    super.initState();
    // getData();
  }
  void launchUrl(String url) async {
    if (await canLaunch(url)) {
      launch(url);
    } else {
      throw "Could not launch $url";
    }
  }
  void whatsAppOpen() async {
    final link = WhatsAppUnilink(
      phoneNumber: '+1-(347)7579865',
      text: "Hey! I'm inquiring about the apartment listing",
    );
    // Convert the WhatsAppUnilink instance to a string.
    // Use either Dart's string interpolation or the toString() method.
    // The "launch" method is part of "url_launcher".
    await launch('$link');
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Stack(children: [
        Scaffold(
          backgroundColor: Colors.black,
          appBar: PreferredSize(preferredSize: Size.fromHeight(55),
              child: Backappbar()),
          body: ListView(
            children: [
              SizedBox(
                height: 40,
              ),
              Text(
                "Request Lines",textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.orange),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Tune in to SoundChat Radio Live",textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12,color: Color(0xFFA79A9A)),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Stack(
                  children: [
                    Positioned(
                      bottom: 10,
                      top: 10,
                      left: 20,
                      right: 20,
                      child: GestureDetector(
                        onTap: () {
                          launchUrl("tel:+17185548598");
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50)),
                          child: Center(
                            child:Padding(padding: EdgeInsets.only(left: 20),
                            child: Text("+1(718)-554-8598",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: titlefontsize,
                                  fontWeight: FontWeight.bold),
                            ),)
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 80,
                      height: 80,
                      child: Image.asset(
                        'assets/fl01.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Stack(
                  children: [
                    Positioned(
                      bottom: 10,
                      top: 10,
                      left: 20,
                      right: 20,
                      child: GestureDetector(
                        onTap: () {
                          launchUrl("tel:+442080680507");
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50)),
                          child: Center(
                            child:Padding(padding: EdgeInsets.only(left: 20),
                            child: Text("+44 208-068-0507",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: titlefontsize,
                                  fontWeight: FontWeight.bold),
                            ),),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 80,
                      height: 80,
                      child: Image.asset(
                        'assets/fl02.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Stack(
                  children: [
                    Positioned(
                      bottom: 10,
                      top: 10,
                      left: 20,
                      right: 20,
                      child: GestureDetector(
                        onTap: () {
                          launchUrl("tel:+16464847826");
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50)),
                          child: Center(child:Padding(padding: EdgeInsets.only(left: 20),
                            child: Text("+1(646)-484-7826",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: titlefontsize,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),),
                        ),
                      ),
                    ),
                    Container(
                      width: 80,
                      height: 80,
                      child: Image.asset(
                        'assets/fl03.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Stack(
                  children: [
                    Positioned(
                      bottom: 10,
                      top: 10,
                      left: 20,
                      right: 20,
                      child: GestureDetector(
                        onTap: () {
                          whatsAppOpen();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50)),
                          child: Center(child:Padding(padding: EdgeInsets.only(left: 20),
                            child: Text("+1(347)-757-9865",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: titlefontsize,
                                  fontWeight: FontWeight.bold),
                            ),),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 80,
                      height: 80,
                      child: Image.asset(
                        'assets/fl04.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
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
      ]),
    );
  }
}
