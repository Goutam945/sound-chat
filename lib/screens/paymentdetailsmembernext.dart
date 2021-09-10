import 'package:sound_chat/common/index.dart';
class PaymentDetailsMembernext extends StatefulWidget {
  @override
  _PaymentDetailsMembernextPageState createState() => _PaymentDetailsMembernextPageState();
}
class _PaymentDetailsMembernextPageState extends State<PaymentDetailsMembernext> {
  @override
  void initState() {
    // SystemChrome.setEnabledSystemUIOverlays([]);
    super.initState();
  }

  //Future<SignUpResponse> _futureJwt;
  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Stack(
          children:[ Scaffold(
            backgroundColor: Colors.black,
            // appBar: AppBar(
            //   backgroundColor: Color(0xFFE18D13),
            //   //title: Text("Flutter Http Example"),
            // ),
            body:ListView(
              children: [
                SizedBox(height: 40,),
                Center(child: Text("Member Registration",style: TextStyle(fontSize: 19,color: Color(0xFFE18D13),fontWeight: FontWeight.bold),)),
                SizedBox(height: 60,),
                Center(child: Text("Payment Details",textAlign: TextAlign.center,style: TextStyle(fontSize: 16,color: Color(0xFFA79A9A)),)),
                SizedBox(height: 5,),
                Container(height: 2,color: Color(0xFF8E0E14),margin: EdgeInsets.only(left: 15,right: 15)),
                SizedBox(height: 10,),

                Padding(
                  padding: const EdgeInsets.only(left: 15,right: 15),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("%Subscription_Name%:",style: TextStyle(
                            color: Color(0xFF535353),
                            fontSize: 15,
                            fontFamily: 'Montserrat1',)),
                          Text("me%:",style: TextStyle(
                            color: Color(0xFF535353),
                            fontSize: 15,
                            fontFamily: 'Montserrat1',
                          )),
                          Text("%Discount%:",style: TextStyle(
                            color: Color(0xFF535353),
                            fontSize: 15,
                            fontFamily: 'Montserrat1',
                          )),
                          Text("Final Price:",style: TextStyle(
                              color: Color(0xFF535353),
                              fontSize: 18,
                              fontFamily: 'Montserrat1',
                              fontWeight: FontWeight.bold)),
                        ],
                      ),
                      Column(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("\$4.99 USD",style: TextStyle(
                            color: Color(0xFF535353),
                            fontSize: 15,
                            fontFamily: 'Montserrat1',
                          )),
                          Text("\$0.00 USD",style: TextStyle(
                            color: Color(0xFF535353),
                            fontSize: 15,
                            fontFamily: 'Montserrat1',
                          )),
                          Text("",style: TextStyle(
                            color: Color(0xFF535353),
                            fontSize: 15,
                            fontFamily: 'Montserrat1',
                          )),
                          Text("\$4.99 USD",style: TextStyle(
                              color: Color(0xFF535353),
                              fontSize: 18,
                              fontFamily: 'Montserrat1',
                              fontWeight: FontWeight.bold
                          )),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(height: 10,),
                Container(height: 200,color: Color(0xFF4472C4),
                  child: Center(child: Text("Strip Payment form ",style: TextStyle(color: Colors.white),)),
                ),
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 80),
                  child: SizedBox(height: 50,
                    child: ElevatedButton(style:ElevatedButton.styleFrom( primary: Color(0xFF8E0E14),
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0),
                        )),
                      onPressed: () {
                        // Navigator.of(context).push(
                        //     MaterialPageRoute(
                        //         builder: (context) =>
                        //             PaymentDetailsMember()));
                      },
                      child: Text('Continue',style: TextStyle(fontSize: 16),),
                    ),
                  ),
                ),

              ],
            ),

          ),
            /*Positioned(
              top: AppBar().preferredSize.height*0.2,
              left: width * 0.39865,
              child: SizedBox(
                height: height * 0.12168,
                width: width * 0.21875,
                child: Image.asset(
                  'assets/soundpic.png',
                ),
              ),
            ),*/
          ]
      ),
    );
  }
}
