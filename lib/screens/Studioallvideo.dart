import 'package:sound_chat/common/index.dart';
import 'InetrviewvideoplayStudio.dart';
class StudiovideoScreen extends StatefulWidget {
  StudiovideoScreen({Key key}) : super(key: key);

  @override
  _StudiovideoScreenState createState() => _StudiovideoScreenState();
}
class _StudiovideoScreenState extends State<StudiovideoScreen> {
  @override
  void initState() {
    super.initState();
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
                  child: Align(alignment: Alignment.centerLeft,child: Text("IN STUDIO INTERVIEWS",textAlign: TextAlign.center,style: TextStyle( color: Colors.white, fontSize: 15,fontFamily: 'Montserrat'))),
                ),
                Expanded(
                  child: GridView.count(crossAxisCount: 3,
                    primary: false,
                    //padding: const EdgeInsets.all(16),
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    children: <Widget>[
                      for (int i = 0; i < superherosLength['free_content'].length; i++)
                        GestureDetector(child:
                        Stack(
                          children: [
                            SizedBox.expand(
                              child: Container(
                                child: Opacity(opacity: 0.8,
                                  child: CachedNetworkImage(
                                    imageUrl: superherosLength['free_content'][i]['featured_img'],fit: BoxFit.cover,

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
                                child: SizedBox(height: 30,child: Text(superherosLength['free_content'][i]['post_title'],textAlign:TextAlign.center,style: TextStyle(color: Colors.white,fontWeight:FontWeight.normal,fontSize: 12),))))
                          ],
                        ),
                          onTap: (){
                            setState(() {
                              Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          InterviewNewPlayer(
                                              superherosLength['free_content'][i]['free_video_url'],superherosLength['free_content'][i]['post_title'])));
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
