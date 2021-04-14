import 'package:http/http.dart' as http;
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
          backgroundColor: Color(0xFFDEEBF7),
          appBar: AppBar(
            backgroundColor: Color(0xFFE18D13),
            //title: Text("Flutter Http Example"),
          ),
          body: ListView(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    "Request Lines",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Tune in to SoundChat Radio Live",
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      launchUrl("tel:+17185548598");
                    },
                    child: Image.asset(
                      'assets/img1.png',
                      fit: BoxFit.fill,
                      scale: 1.3,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      launchUrl("tel:+442080680507");
                    },
                    child: Image.asset(
                      'assets/img2.png',
                      fit: BoxFit.fill,
                      scale: 1.3,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      launchUrl("tel:+16464847826");
                    },
                    child: Image.asset(
                      'assets/img3.png',
                      fit: BoxFit.fill,
                      scale: 1.3,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      whatsAppOpen();
                    },
                    child: Image.asset(
                      'assets/imgg4.png',
                      fit: BoxFit.fill,
                      scale: 1.3,
                    ),
                  ),
                ],
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
