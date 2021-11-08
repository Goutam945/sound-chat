import 'package:sound_chat/common/index.dart';

class StudiovideoScreen extends StatefulWidget {
  StudiovideoScreen({Key key}) : super(key: key);

  @override
  _StudiovideoScreenState createState() => _StudiovideoScreenState();
}

class _StudiovideoScreenState extends State<StudiovideoScreen> {
  var apivideointerview;
  @override
  void initState() {
    super.initState();
    apivideointerview = createVideoState(context);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    // var superherosLength =
    //     (Provider.of<VideoResponse>(context, listen: false).data != null)
    //         ? Provider.of<VideoResponse>(context, listen: false).data['data']
    //         : null;
    return SafeArea(
      child: Stack(
        children: [
          Scaffold(
            backgroundColor: Color(0xFF222222),
            appBar: PreferredSize(
                preferredSize: Size.fromHeight(55), child: Backappbar()),
            body: FutureBuilder(
                future: apivideointerview,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    var superherosLength = snapshot.data.data['data'];
                    return Column(
                      children: [
                        Container(
                          height: height * 0.0512,
                          width: width,
                          margin: EdgeInsets.only(top: 25),
                          padding: EdgeInsets.only(left: 10),
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: <Color>[
                                Color(0xFF074516),
                                Color(0xFF074516),
                              ])),
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text("IN STUDIO INTERVIEWS",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontFamily: 'Montserrat'))),
                        ),
                        Expanded(
                          child: GridView.count(
                            crossAxisCount: 3,
                            primary: false,
                            //padding: const EdgeInsets.all(16),
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            children: <Widget>[
                              for (int i = 0;
                                  i < superherosLength['free_content'].length;
                                  i++)
                                GestureDetector(
                                  child: Stack(
                                    children: [
                                      SizedBox(
                                        width: width * 0.3094,
                                        height: height * 0.1577,
                                        child: Container(
                                          child: Opacity(
                                            opacity: 0.8,
                                            child: CachedNetworkImage(
                                              imageUrl: baseurlimageinetrviews +
                                                  superherosLength[
                                                          'free_content'][i]
                                                      ['feature_img'],
                                              fit: BoxFit.cover,
                                              placeholder: (context, url) => Center(
                                                  child:
                                                      CircularProgressIndicator()),
                                              errorWidget:
                                                  (context, url, error) =>
                                                      Icon(Icons.error),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                          bottom: 5,
                                          left: 0,
                                          right: 0,
                                          child: Container(
                                              // decoration: BoxDecoration(
                                              // boxShadow: [
                                              //   BoxShadow(offset: Offset(0.0,5.0),
                                              //     color: Colors.black,
                                              //     blurRadius: 15.0,
                                              //   ),
                                              // ]),
                                              height: 18,
                                              width: width * 0.3094,
                                              color: Colors.black,
                                              child: SizedBox(
                                                  child: Text(
                                                superherosLength['free_content']
                                                    [i]['post_title'],
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontFamily: fontfamily),
                                              ))))
                                    ],
                                  ),
                                  onTap: () {
                                    setState(() {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  InterviewNewPlayer(
                                                      superherosLength[
                                                              'free_content'][i]
                                                          ['video_url'],
                                                      superherosLength[
                                                              'free_content'][i]
                                                          ['post_title'],
                                                      superherosLength[
                                                              'free_content'][i]
                                                          ['post_excerpt'],
                                                      i)));
                                    });
                                  },
                                ),
                            ],
                          ),
                        ),
                      ],
                    );
                  }
                  if (snapshot.hasError) {
                    return Errorwidget(
                      onTap: () {
                        setState(() {
                          createVideoState(context);
                          createPhoneinterviewState(context);
                        });
                      },
                    );
                  }
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }),
          ),
          Positioned(
            top: AppBar().preferredSize.height * 0.2,
            left: width * 0.39865,
            child: SizedBox(
              height: height * 0.10168,
              width: width * 0.20275,
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
