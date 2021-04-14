import 'package:sound_chat/common/index.dart';
class AllOrderlist extends StatefulWidget {
  @override
  _AllOrderlistState createState() => _AllOrderlistState();
}

class _AllOrderlistState extends State<AllOrderlist> {
  bool play = true;
  String data;
  var superherosLength;
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
 //   if(Provider.of<ScheduleResponse>(context, listen: false).data!=null)
     // superherosLength = Provider.of<ScheduleResponse>(context, listen: false).data['data'];
    return SafeArea(
      child: Stack(
        children: [
          Scaffold(extendBody: false,
            backgroundColor: Colors.black,
              appBar: AppBar(
                backgroundColor: Color(0xFFE18D13),
                backwardsCompatibility: true,
              ),
            body: SizedBox(height: height,
              child: Column(
                children: [
                  SizedBox(height: 10,),
                  Expanded(
                    child: Container(
                      //height: height * 0.7056,
                      child: SingleChildScrollView(
                        child:Column(
                          children: [
                           // for (int j = 0; j <10; j++)
                              GestureDetector(
                                onTap: () {
                                  //Navigator.of(context).push(MaterialPageRoute(builder: (context)=> (email==null)?NewLogin():PodcastPlayCloud(j, weekday)));
                                },
                                child: Container(
                                  margin: const EdgeInsets.only(top: 5),
                                  color: Colors.white10,
                                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                          width: width * 0.3037,
                                          child: Image.network(
                                            'https://i0.wp.com/soundchatradio.com/wp-content/uploads/2021/02/cover-slick.jpg?resize=300%2C300&ssl=1',
                                            fit: BoxFit.cover,
                                          )),
                                      Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: width * 0.65,
                                            child: Text("testing",
                                              style: TextStyle(
                                                  color:
                                                  Color(0xFFA39597),
                                                  fontSize: 17,
                                                  fontWeight:
                                                  FontWeight.bold,
                                                  fontFamily:
                                                  'Montserrat'),
                                            ),
                                          ),
                                          SizedBox(
                                            width: width * 0.65,
                                            child: Text(
                                             "testing",
                                              style: TextStyle(
                                                  color:
                                                  Color(0xFFA19895),
                                                  fontSize: 14,
                                                  fontFamily:
                                                  'Montserrat'),
                                            ),
                                          ),
                                          Text(
                                            "testing:",
                                            style: TextStyle(
                                                color: Color(0xFFA19895),
                                                fontSize: 16,
                                                fontFamily: 'Montserrat'),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                          ],
    ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ),
//          Positioned(
//            top: AppBar().preferredSize.height*0.2,
//            left: width * 0.39865,
//            child: SizedBox(
//              height: height * 0.13168,
//              width: width * 0.21875,
//              child: Image.asset(
//                'assets/soundpic.png',
//              ),
//            ),
//          ),
        ],
      ),
    );
  }
}
