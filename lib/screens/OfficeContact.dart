import 'package:http/http.dart' as http;
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
            appBar: AppBar(
              backgroundColor: Color(0xFFE18D13),
              //title: Text("Flutter Http Example"),
            ),
            body:ListView(
              children: [
                SizedBox(height: 40,),
                Center(child: Text("Office Contact Details",style: TextStyle(fontSize: 19,color: Color(0xFFE18D13),fontWeight: FontWeight.bold),)),
                SizedBox(height: 20,),
                Align(alignment: Alignment.centerLeft,
                  child: Text(
                    'New York Office',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
            SizedBox(height: 10,),
            Container(height: 0.5,color: Colors.orange,),
            SizedBox(height: 20,),
            Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Address: Studio Address: Studio \n139-20 C 109th Ave, Jamaica, NY,\n 11435.',
                  style: TextStyle(fontSize: 16,color: Color(0xFFA39597)),
                ),
                SizedBox(height: 10,),
                Text(
                  'Phone: (347)-514-7520 (Office)',
                  style: TextStyle(fontSize: 16,color: Color(0xFFA39597)),
                ),
                SizedBox(height: 10,),
                Text(
                  ' Email: info@soundchatradio.com,\n            irishandchin@gmail.com',
                  style: TextStyle(fontSize: 16,color: Color(0xFFA39597)),
                ),
              ],
            ),
                SizedBox(height: 20,),
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
                Container(height: 0.5,color: Colors.orange,),
                SizedBox(height: 20,),
                Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Address: 22 Westminster Rd, Kingston 10,\nJamaica,11435.',
                      style: TextStyle(fontSize: 16,color: Color(0xFFA39597)),
                    ),
                    SizedBox(height: 10,),
                    Text(
                      'Phone: +1 (876)-000-0000,(347)-514-7520',
                      style: TextStyle(fontSize: 16,color: Color(0xFFA39597)),
                    ),
                    SizedBox(height: 10,),
                    Text(
                      ' Email: jamaica@soundchatradio.com,\n             irishandchin@gmail.com',
                      style: TextStyle(fontSize: 16,color: Color(0xFFA39597)),
                    ),
                  ],
                ),


                // Column(
                //   children: [
                //     SizedBox(height: 5,),
                //     Text("Office Contact Details",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                //     SizedBox(height: 30,),
                //     Container(color: Colors.white, margin:EdgeInsets.only(right: 50),
                //       child: Padding(
                //         padding: const EdgeInsets.only(left: 20),
                //         child: Text("New York Office / \nStudio Address: Studio \n139-20 C 109th Ave, Jamaica, NY,\n 11435 Phone: (347)-514-7520 (Office) Email: info@soundchatradio.com,\nirishandchin@gmail.com",
                //         style: TextStyle(fontSize: 16,fontStyle: FontStyle.italic),),
                //       ),
                //     ),
                //     SizedBox(height: 20,),
                //     Container(color: Colors.white, margin:EdgeInsets.only(left: 50,),
                //       child: Text("Kingston, Jamaica / \nStudio Address: 22 Westminster Rd, Kingston 10,Jamaica,\n 11435 Phone: +1 (876)-000-0000,(347)-514-7520 ex.500 (Office)\n Email: jamaica@soundchatradio.com,\nirishandchin@gmail.com",
                //         style: TextStyle(fontSize: 16,fontStyle: FontStyle.italic),),
                //     )
                //     // Divider(
                //     //   color: Colors.black,
                //     // ),
                //   ],
                // ),


              ],
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
