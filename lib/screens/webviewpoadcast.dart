import 'package:http/http.dart' as http;
import 'package:sound_chat/common/index.dart';

class WebviewPodcast extends StatefulWidget {
  @override
  _WebviewPodcastState createState() => _WebviewPodcastState();
}

class _WebviewPodcastState extends State<WebviewPodcast> {
  bool play = true;
  String data;
  var superherosLength;
  int day=6;
  String audiourl;

  @override
  void initState() {
    super.initState();
    getData();
  }
  void getData() async {
    http.Response response = await http.get(
        "https://mintok.com/soundchat/wp-json/schedule/v2/?post_type=schedule");
    if (response.statusCode == 200) {
      data = response.body;
      setState(() {
        superherosLength = jsonDecode(
            data)['data'];
      });
    } else {
      print(response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;

    return Stack(
      children: [
        Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Color(0xFFE18D13),
            leading: Builder(
                builder: (BuildContext context){
                  return IconButton(
                    icon: Icon(Icons.arrow_back_rounded,color: Colors.white,size: 25,),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  );
                }),
          ),
          body: (superherosLength != null) ? ListView(
            children: [
              Container(height: height*0.0044,width:width,color: Color(0xFF780001),),
              Padding(
                padding: const EdgeInsets.all(0.0),
                child: Column(
                  children: [
                    SizedBox(child: Image.asset('assets/imgpodcast.png',fit: BoxFit.fill,),height:height*0.4103,width: width,),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Container(
                          child: Text("podcast from this show",style: TextStyle( color: Color(0xFF8A8889), fontSize: 18)),
                        ),
                      ),

                    ),
                  ],
                ),


              ),
                  Container(height: 200,
                    child: WebView(javascriptMode: JavascriptMode.unrestricted,
                            initialUrl: jsonDecode(data)['data'][0]['shows'][1]['show_audio_url'],
                         ),
                  ),
            ],
          ):Center(
              child: CircularProgressIndicator()
          ),



        ),
        Positioned(top: height*0.0402,left: width*0.39865,child: SizedBox(height:height * 0.12168,width: width * 0.21875,child: Image.asset('assets/soundpic.png',))),
      ],
    );
  }
}
