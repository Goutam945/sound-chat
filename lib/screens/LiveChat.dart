import 'package:http/http.dart' as http;
import 'package:sound_chat/common/index.dart';

class LivechatRoom extends StatefulWidget {
  @override
  _LivechatRoomState createState() => _LivechatRoomState();
}

class _LivechatRoomState extends State<LivechatRoom> {
  bool isLoading = true;
 String email,name;
  @override
  void initState() {
    super.initState();
    _loadSavedData();
  }
  _loadSavedData() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      if(sharedPreferences.getString('email') != null && sharedPreferences.getString('email').isNotEmpty){
        email = sharedPreferences.getString('email');
        name = sharedPreferences.getString('name');
      }
      // else{
      //   email = "Empty";
      //   name = "Empty";
      // }
    });
  }
  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;

    return SafeArea(
      child: Stack(
        children: [
          Scaffold(extendBodyBehindAppBar: true,
            backgroundColor: Colors.white,
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
            body: Column(
              children: [
                Container(height: height*0.0044,width:width,color: Color(0xFF780001),),
                Expanded(
                  child: Container(
                    child: WebView(javascriptMode: JavascriptMode.unrestricted,
                      onPageFinished: (finish) {
                        setState(() {
                          isLoading = false;
                        });
                      },
                      initialUrl: "http://3.23.210.57/chatapp/userview/loginapi/10",
                    ),
                  ),
                ),
              ],
            )



          ),
          Positioned( top: AppBar().preferredSize.height*0.2,left: width*0.39865,child: SizedBox(height:height * 0.12168,width: width * 0.21875,child: Image.asset('assets/soundpic.png',))),
          isLoading
              ? Center(
            child: Container(padding: EdgeInsets.only(top: 30),child: CircularProgressIndicator()),
          )
              : Stack()
        ],
      ),
    );
  }
}
