import 'package:sound_chat/common/index.dart';

class PrimiumvideoScreen extends StatefulWidget {
  PrimiumvideoScreen({Key key}) : super(key: key);

  @override
  _PrimiumvideoScreenState createState() => _PrimiumvideoScreenState();
}

class _PrimiumvideoScreenState extends State<PrimiumvideoScreen> {
  String email;
  String name;
  var membership;
  int id;
  var apivideointerview;
  @override
  void initState() {
    super.initState();
    _loadSavedData()
        .then((value) => createSubcriptionlevalState(id, context).then((value) {
              membership = value.data['data'];
            }));
    apivideointerview = createVideoState(context);
  }

  _loadSavedData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      if (sharedPreferences.getString('email') != null &&
          sharedPreferences.getString('email').isNotEmpty) {
        email = sharedPreferences.getString('email');
        name = sharedPreferences.getString('name');
        id = sharedPreferences.getInt('id');
      }
    });
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
                              child: Text("PRIMIUM INTERVIEWS",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontFamily: 'Montserrat'))),
                        ),
                        Expanded(
                          child: GridView.count(
                            crossAxisCount: 3,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            primary: false,
                            children: <Widget>[
                              for (int i = 0;
                                  i <
                                      superherosLength['premium_content']
                                          .length;
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
                                                          'premium_content'][i]
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
                                              height: 18,
                                              width: width * 0.3094,
                                              color: Colors.black,
                                              child: SizedBox(
                                                  child: Text(
                                                superherosLength[
                                                        'premium_content'][i]
                                                    ['post_title'],
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
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) => (email ==
                                                    null)
                                                ? NewLogin()
                                                : (membership != null &&
                                                        membership[
                                                                'stripe_status'] ==
                                                            'ACTIVE')
                                                    ? Primiumvideo(
                                                        superherosLength[
                                                                'premium_content']
                                                            [i]['video_url'],
                                                        superherosLength[
                                                                'premium_content']
                                                            [i]['post_title'],
                                                        superherosLength[
                                                                'premium_content']
                                                            [i]['post_excerpt'],
                                                        i)
                                                    : UpgradeSubscription()));
                                    // Toast.show("PREMIUM MEMBERSHIP", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
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
