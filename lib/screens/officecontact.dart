import 'package:sound_chat/common/index.dart';
class OfficeContact  extends StatefulWidget {
  @override
  _OfficeContactState createState() => _OfficeContactState();
}

class _OfficeContactState extends State<OfficeContact> {
  String data;
  var superherosLength;
  @override
  void initState() {
    super.initState();
    // getData();
  }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Stack(
          children:[ Scaffold(
            backgroundColor: Colors.black,
            appBar: PreferredSize(preferredSize: Size.fromHeight(55),
                child: Backappbar()),
            body:Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF3F535E),
                      Color(0xFF3A432E),
                      //Color(0xFF0E0D13)
                    ])),
              child: ListView(
                children: [
                  SizedBox(height: 40,),
                  Center(child: Text("Office Contact Details",style: TextStyle(fontSize: 19,color: Color(0xFFE18D13),fontWeight: FontWeight.bold),)),
                  SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Stack(
                      children: [
                        Column(
                          children: [
                            Align(alignment: Alignment.centerLeft,
                              child: Text(
                                "New York Office",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white
                                ),
                                textAlign: TextAlign.start,
                              ),
                            ),
                            SizedBox(height: 10,),
                            Container(height: 0.5,color: Colors.orangeAccent,),
                            Container(height: 200,width: 410,padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                              child: Column(
                                  children: [
                                    SizedBox(height: 20,),
                                    Row(
                                      children: [
                                        Icon(Icons.home_outlined,size: 30,color: Colors.white,),
                                        SizedBox(width: 20,),
                                        Text("139-20 C 109th Ave,\n Jamaica, NY, 11435",
                                            style: TextStyle(fontSize: subtitlefontsize,
                                                color: Colors.white,fontFamily: fontfamily))
                                      ],
                                    ),
                                    SizedBox(height: 10,),
                                    Row(
                                      children: [
                                        Icon(Icons.phone,size: 30,color: Colors.white,),
                                        SizedBox(width: 20,),
                                        Text("(347)-514-7520 ", style: TextStyle(
                                            fontSize: subtitlefontsize,
                                            fontFamily: fontfamily,
                                            color: Colors.white))
                                      ],
                                    ),
                                    SizedBox(height: 10,),
                                    Row(
                                      children: [
                                        Icon(Icons.email_outlined,size: 30,color: Colors.white,),
                                        SizedBox(width: 20,),
                                        Text("info@soundchatradio.com,\nirishandchin@gmail.com",
                                            style: TextStyle(fontSize: subtitlefontsize,
                                                fontFamily: fontfamily,
                                                color: Colors.white))
                                      ],
                                    ),
                                  ]),),
                            Align(alignment: Alignment.centerLeft,
                              child: Text(
                                'Kingston, Jamaica',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white
                                ),
                                textAlign: TextAlign.start,
                              ),
                            ),
                            SizedBox(height: 10,),
                            Container(height: 0.5,color: Colors.orangeAccent,),
                            Container(height: 200,width: 400,padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                              child: Column(
                                  children: [
                                    SizedBox(height: 20,),
                                    Row(
                                      children: [
                                        Icon(Icons.home_outlined,size: 30,color: Colors.white,),
                                        SizedBox(width: 20,),
                                        Text("22 Westminster Rd,\nKingston 10,Jamaica,11435",
                                            style: TextStyle(fontSize: subtitlefontsize,
                                                fontFamily: fontfamily,
                                                color: Colors.white))
                                      ],
                                    ),
                                    SizedBox(height: 10,),
                                    Row(
                                      children: [
                                        Icon(Icons.phone,size: 30,color: Colors.white),
                                        SizedBox(width: 20,),
                                        Text("+1 (876)-000-0000,\n(347)-514-7520 ",
                                            style: TextStyle(fontSize: subtitlefontsize,
                                                fontFamily: fontfamily,
                                                color: Colors.white))
                                      ],
                                    ),
                                    SizedBox(height: 10,),
                                    Row(
                                      children: [
                                        Icon(Icons.email_outlined,size: 30,color: Colors.white,),
                                        SizedBox(width: 20,),
                                        Text("jamaica@soundchatradio.com,\nirishandchin@gmail.com",
                                            style: TextStyle(fontSize: subtitlefontsize,
                                                fontFamily: fontfamily,
                                                color: Colors.white))
                                      ],
                                    ),
                                  ]),),

                          ],
                        ),
                      ],
                    ),
                  ),
//                   Stack(
//                    children: [
//                        Container(height: 400,width: 400,color:Colors.black ,padding: EdgeInsets.symmetric(horizontal: 10,vertical: 80),
//                          child: Column(
//                              children: [
//                                SizedBox(height: 20,),
//                                Row(
//                                  children: [
//                                    Icon(Icons.home_outlined,size: 42,color: Color(0xFFA39597),),
//                                    SizedBox(width: 20,),
//                                    Text("22 Westminster Rd,\n Kingston 10,Jamaica,11435", style: TextStyle(fontSize: 18,color: Color(0xFFA39597)))
//                                  ],
//                                ),
//                                SizedBox(height: 10,),
//                                Row(
//                                  children: [
//                                    Icon(Icons.phone,size: 40,color: Color(0xFFA39597)),
//                                    SizedBox(width: 20,),
//                                    Text("+1 (876)-000-0000,\n(347)-514-7520 ", style: TextStyle(fontSize: 18,color: Color(0xFFA39597)))
//                                  ],
//                                ),
//                                SizedBox(height: 10,),
//                                Row(
//                                  children: [
//                                    Icon(Icons.email_outlined,size: 40,color: Color(0xFFA39597),),
//                                    SizedBox(width: 20,),
//                                    Text("jamaica@soundchatradio.com,\n irishandchin@gmail.com", style: TextStyle(fontSize: 18,color: Color(0xFFA39597)))
//                                  ],
//                                ),
//                              ]),),
//                  Positioned(
//                    child:Container(
//                        width: 80,
//                        height: 80,
//                        child: Image.asset(
//                          'assets/fl03.png',
//                          fit: BoxFit.fill,
//                        ),),
//                      ),
//                    ],
//                  ),

                ],
              ),
            ),

          ),
            Positioned(
              top: AppBar().preferredSize.height*0.2,
              left: width * 0.39865,
              child: SizedBox(
                height: height * 0.12168,
                width: width * 0.21875,
                child: Image.asset(
                  'assets/soundpic.png',
                ),
              ),
            ),
          ]
      ),
    );
  }
}
