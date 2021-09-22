import 'package:sound_chat/common/index.dart';

class Couponcode extends StatefulWidget {
  @override
  _CouponcodeState createState() => _CouponcodeState();
}

class _CouponcodeState extends State<Couponcode> {
  String user;
  String email, name;
  var superherosLength;
  @override
  void initState() {
    super.initState();
    createCoupncodeState(context);
  }


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    if(Provider.of<CoupncodeResponse>(context, listen: false).data!=null)
    superherosLength = Provider.of<CoupncodeResponse>(context, listen: false).data['data'];
    return SafeArea(
      child: Stack(children: [
        Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xFFE18D13),
          ),
          backgroundColor: Colors.black,
          body:(superherosLength != null)? ListView(
            children: [
              SizedBox(
                height: 40,
              ),
              Center(
                  child: Text(
                    "Coupon Code",
                    style: TextStyle(
                        fontSize: 19,
                        color: Color(0xFFE18D13),
                        fontWeight: FontWeight.bold),
                  )),
              SizedBox(
                height: 40,
              ),
              for (int i = 0;
              i < superherosLength.length;
              i++)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Stack(
                    children: [
                     Column(crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Text(
                           superherosLength[i]['settings']['description'].toString(),
                           textAlign: TextAlign.start,
                           style: TextStyle(
                               color: Colors.white,
                               fontSize: 18,),
                         ),
                         Text("Price   "+
                           superherosLength[i]['settings']['discount_value'].toString(),
                           textAlign: TextAlign.start,
                           style: TextStyle(
                               color: Colors.white,
                               fontSize: 17,),
                         ),
                         Text("CODE:   "+
                             superherosLength[i]['code'].toString(),
                           textAlign: TextAlign.start,
                           style: TextStyle(
                               color: Colors.orange,
                               fontSize: 20,
                               fontWeight: FontWeight.bold),
                         )
                       ],
                     ),
                    ],
                  ),
                ),
              Container(height: 1,color: Colors.red,),
            ],
          ) : Center(child: CircularProgressIndicator()),
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
      ]),
    );
  }
}
