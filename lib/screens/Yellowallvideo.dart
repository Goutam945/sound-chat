import 'package:sound_chat/common/index.dart';
import 'InterviewvideoplayYellow.dart';
class YellowvideoScreen extends StatefulWidget {
  YellowvideoScreen({Key key}) : super(key: key);

  @override
  _YellowvideoScreenState createState() => _YellowvideoScreenState();
}
class _YellowvideoScreenState extends State<YellowvideoScreen> {
  String email;
  String name ;
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
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var superherosLength = (Provider.of<VideoResponse>(context, listen: false).data != null)?Provider.of<VideoResponse>(context, listen: false).data['data']: null;
    return SafeArea(
      child: Stack(
        children: [
          Scaffold(
            backgroundColor: Colors.black,
            appBar: AppBar(
              backgroundColor: Color(0xFFE18D13),
            ),
            body: Column(
              children: [
                Container( height: height*0.0512,width: width,margin: EdgeInsets.only(top: 25),padding: EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: <Color>[
                            Color(0xFF074516),
                            Color(0xFF074516),

                          ])
                  ),
                  child: Align(alignment: Alignment.centerLeft,child: Text("BIG YELLOW TENT INTERVIEWS",textAlign: TextAlign.center,style: TextStyle( color: Colors.white, fontSize: 15,fontFamily: 'Montserrat'))),
                ),
                Expanded(
                  child: GridView.count(crossAxisCount: 3,
                    primary: false,
                   // padding: const EdgeInsets.all(16),
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    children: <Widget>[
                      for (int i = 0; i < superherosLength['category'][0]['The big yellow tent'].length; i++)
                        GestureDetector(child:
                       /* CachedNetworkImage(
                          imageUrl:superherosLength['category'][0]['The big yellow tent'][i]['details']['featured_img'],fit: BoxFit.cover,
                          placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                          errorWidget: (context, url, error) => Icon(Icons.error),
                        ),*/
                        Stack(
                          children: [
                            SizedBox.expand(
                              child: Container(
                                child: Opacity(opacity: 0.8,
                                  child: CachedNetworkImage(
                                    imageUrl:superherosLength['category'][0]['The big yellow tent'][i]['details']['featured_img'],fit: BoxFit.cover,
                                    placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                                    errorWidget: (context, url, error) => Icon(Icons.error),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(bottom: 10,left: 20,right: 20,child: Container(decoration: BoxDecoration(
                              // BoxShape.circle or BoxShape.retangle
                              //color: const Color(0xFF66BB6A),
                                boxShadow: [
                                  BoxShadow(offset: Offset(0.0,5.0),
                                    color: Colors.black,
                                    blurRadius: 15.0,
                                  ),
                                ]),
                                child: SizedBox(height:30,child: Text(superherosLength['category'][0]['The big yellow tent'][i]['details']['post_title'],textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontWeight:FontWeight.normal,fontSize: 12),))))
                          ],
                        ),
                          onTap: (){
                            setState(() {
                              Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          InterviewPlay(
                                              superherosLength['category'][0]['The big yellow tent'][i]['details']['free_video_url'], superherosLength['category'][0]['The big yellow tent'][i]['details']['post_title'])));
                            });
                          },
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: AppBar().preferredSize.height * 0.2,
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
      ),
    );
  }
}