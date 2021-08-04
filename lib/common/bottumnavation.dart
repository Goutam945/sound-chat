import 'package:sound_chat/common/index.dart';

class Bottumnavation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      height: height * 0.075,
      color: Color(0xFF780001),
      child: Padding(
        padding: const EdgeInsets.only(top: 5,bottom: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              child: Row(
                children: [
                  Icon(
                    Icons.home,
                    size: width * 0.08,
                    color: Color(0xFFE18D13),
                  ),
                  Text(
                    "HOME",
                    style: TextStyle(
                        color: Colors.white, fontSize: 14),
                  ),
                ],
              ),
              onTap: () {
                // Navigator.of(context).pushReplacement(MaterialPageRoute(
                //     builder: (context) => HomeScreen()));
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (BuildContext context) => HomeScreen()),
                    ModalRoute.withName('/')
                );

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
                    size: width * 0.08,
                    color: Color(0xFFE18D13),
                  ),
                  Text(
                    " LISTEN",
                    style: TextStyle(
                        color: Colors.white, fontSize: 14),
                  ),
                ],
              ),
              onTap: () {
                // Navigator.of(context).pushReplacement(MaterialPageRoute(
                //     builder: (context) => HomeScreen()));
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (BuildContext context) => HomeScreen()),
                    ModalRoute.withName('/')
                );
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
                      size: width * 0.08,
                      color: Color(0xFFE18D13)),
                  Text(
                    " WATCH",
                    style: TextStyle(
                        color: Colors.white, fontSize: 14),
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
                size: width * 0.10,
                color: Colors.white,
              ),
              padding: EdgeInsets.only(bottom: 30),
              onPressed: () {
                // Navigator.of(context).pushReplacement(MaterialPageRoute(
                //     builder: (context) => NewMenuScreen()));
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (BuildContext context) => NewMenuScreen()),
                    ModalRoute.withName('/')
                );
              },
            ),
          ],
        ),
      ),
    );

  }
}