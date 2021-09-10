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
