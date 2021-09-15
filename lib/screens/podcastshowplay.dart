import 'package:sound_chat/common/index.dart';

class PodcastPlayCloud extends StatefulWidget {
  final j, weekday;

  PodcastPlayCloud(this.j, this.weekday);

  @override
  _ListenState createState() => _ListenState();
}

class _ListenState extends State<PodcastPlayCloud> {
  bool play = true;
  String data;
  var superheroslength;
  int day = 6;
  bool isLoading = true;
  String audiourl;
  String email, name;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadSavedData();
  }

  _loadSavedData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      if (sharedPreferences.getString('email') != null &&
          sharedPreferences.getString('email').isNotEmpty) {
        email = sharedPreferences.getString('email');
        name = sharedPreferences.getString('name');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    int weekday = widget.weekday;
    superheroslength =
        Provider.of<ScheduleResponse>(context, listen: false).data['data'];
    return SafeArea(
      child: Stack(
        children: [
          Scaffold(
            backgroundColor: Colors.black,
            appBar: PreferredSize(preferredSize: Size.fromHeight(55),
                child: Backappbar()),
            body: (superheroslength != null)
                ? Column(
                    children: [
                      Container(
                        height: height * 0.0044,
                        width: width,
                        color: Color(0xFF780001),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Column(
                        children: [
                          //SizedBox(child: Image.asset('assets/imgpodcast.png',fit: BoxFit.fill,),height:height*0.3013,width: width,),
                          Text("Podcast from this show",
                              style: TextStyle(
                                  color: Color(0xFF8A8889), fontSize: 20)),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Expanded(
                        child: WebView(
                          javascriptMode: JavascriptMode.unrestricted,
                          onPageFinished: (finish) {
                            setState(() {
                              isLoading = false;
                            });
                          },
                          initialUrl: superheroslength[weekday]['shows']
                              [widget.j]['show_audio_url'],
                        ),
                      ),
                    ],
                  )
                : null,
          ),
          Positioned(
              top: AppBar().preferredSize.height * 0.1,
              left: width * 0.39865,
              child: SizedBox(
                  height: height * 0.12168,
                  width: width * 0.21875,
                  child: Image.asset(
                    'assets/soundpic.png',
                  ))),
          isLoading
              ? Center(
                  child: Container(
                      padding: EdgeInsets.only(top: 30),
                      child: CircularProgressIndicator()),
                )
              : Stack()
        ],
      ),
    );
  }
}
