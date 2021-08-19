import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:sound_chat/common/index.dart';
import 'package:sound_chat/screens/TestingHome.dart';

import 'appConfig.dart';

class Bottumnavation extends StatefulWidget {
  @override
  _BottumnavationState createState() => _BottumnavationState();
}


class _BottumnavationState extends State<Bottumnavation> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return CurvedNavigationBar(
      backgroundColor: Color(0xFF222222),color: Color(0xFF780001),
      buttonBackgroundColor:Color(0xFF780001),
      animationCurve: Curves.easeInOut,
      height: 60,
      items: <Widget>[
        Icon(Icons.home, size: 30,color:Color(0xFFE18D13) ,),
        Icon(Icons.radio, size: 30,color:Color(0xFFE18D13)),
        Icon(Icons.live_tv, size: 30,color:Color(0xFFE18D13)),
        Icon(Icons.menu, size: 30,color:Color(0xFFE18D13)),
      ],
      onTap: (index) {
        switch(index) {
          case 0: {
            pageIndex=0;
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (BuildContext context) => MyBottomBarDemo()),
                ModalRoute.withName('/')
            );
          }
          break;

          case 1: {
            pageIndex=1;
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (BuildContext context) => MyBottomBarDemo()),
                ModalRoute.withName('/')
            );

          }
          break;
          case 2:{
            pageIndex=2;
            OverlayService().addVideosOverlay(context, MyBottomBarDemo());

          }
          break;
          case 3:{
            pageIndex=3;
            Navigator.push(context,
                PageTransition(type:
                PageTransitionType.rightToLeft, child: MyBottomBarDemo()));

          }
          break;
          default: {
            //statements;
          }
          break;
        }


        //Handle button tap
      },
    );

    /* Container(
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
    );*/

  }
}