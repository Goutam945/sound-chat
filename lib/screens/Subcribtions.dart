import 'package:http/http.dart' as http;
import 'package:sound_chat/common/index.dart';
import 'package:sound_chat/screens/Myaccountprofile.dart';
class Subscription extends StatefulWidget {
  @override
  _SubscriptionState createState() => _SubscriptionState();
}

class _SubscriptionState extends State<Subscription> {
  String user;
  String email,name;
  @override
  void initState() {
    super.initState();
    // getData();
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
              SizedBox(height: 20,),
              Center(child: Text("Please choose a subscription plan to begin setting up your account.",textAlign: TextAlign.center,style: TextStyle(fontSize: 16,color: Color(0xFFA79A9A)),)),
              SizedBox(height: 60,),
              //  Column(
             //    children: [
             //      SizedBox(height: 40,),
             //      Text("Member Registration",style: TextStyle(fontSize: 19,color: Colors.white),),
             //      SizedBox(height: 10,),
             //      Padding(
             //        padding: const EdgeInsets.only(left: 15,right: 15),
             //        child: Text("Please choose a subscription plan to begin setting up your account.",style: TextStyle(fontSize: 16,color: Colors.white),),
             //      ),
             //      SizedBox(height: 10,),
             //      GestureDetector(
             //        onTap: (){
             //          setState(() {
             //            user='Free user';
             //          });
             //          Navigator.of(context).push(
             //              MaterialPageRoute(
             //              builder: (context) =>
             //                  Registrationship(user)));
             //          // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> (email==null)?Registrationship(user):MyAccount()));
             //        },
             //        child: Container(color: Color(0xFFE18D13),height: 80,margin: EdgeInsets.only(left: 15,right: 15),
             //          child: Center(
             //            child: Text("Subcription1",textAlign: TextAlign.center,style: TextStyle(color: Colors.white, fontSize: 20,),
             //            ),
             //          ),
             //        ),
             //      ),
             //      SizedBox(height: 10,),
             //      GestureDetector(
             //        onTap: (){
             //          setState(() {
             //            user='Prime user';
             //          });
             //          Navigator.of(context).push(
             //              MaterialPageRoute(
             //                  builder: (context) =>
             //                      Registrationship(user)));
             //
             //
             //        },
             //        child: Container(color: Color(0xFFE18D13),height: 80,margin: EdgeInsets.only(left: 15,right: 15),
             //          child: Center(
             //            child: Text("Subcription2",textAlign: TextAlign.center,style: TextStyle(color: Colors.white, fontSize: 20,),
             //            ),
             //          ),
             //        ),
             //      ),
             //      SizedBox(height: 10,),
             //      Container(color: Color(0xFFE18D13),height: 80,margin: EdgeInsets.only(left: 15,right: 15),
             //        child: Center(
             //          child: Text("Subcription3",textAlign: TextAlign.center,style: TextStyle(color: Colors.white, fontSize: 20,),
             //          ),
             //        ),
             //      ),
             //      // Divider(
             //      //   color: Colors.black,
             //      // ),
             //    ],
             // ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Stack(
                  children: [
            Positioned(bottom: 10,top: 10,left: 20,right: 20,
                child: GestureDetector(
                     onTap: (){
                       setState(() {
                         user='Free user';
                       });
                       Navigator.of(context).push(
                           MaterialPageRoute(
                           builder: (context) =>
                               Registrationship(user)));
                       // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> (email==null)?Registrationship(user):MyAccount()));
                     },
                     child: Container(
                       decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(50)),
                       child: Center(
                         child: Text("Subcription",textAlign: TextAlign.center,style: TextStyle(color: Colors.black, fontSize: 20,fontWeight: FontWeight.bold),
                         ),
                       ),
                     ),
                   ),
            ),
                    Container(width: 70,height: 70,padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(color: Colors.pink,borderRadius: BorderRadius.circular(50)),
                      child: Container(padding: EdgeInsets.all(5),decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(50)),
                        child: Container(padding: EdgeInsets.all(5),decoration: BoxDecoration(color: Colors.pink,borderRadius: BorderRadius.circular(50)),
                          child: Container(padding: EdgeInsets.all(0),decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(50)),
                            child: Center(child: Text("1",textAlign: TextAlign.center,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Stack(
                  children: [
                    Positioned(bottom: 10,top: 10,left: 20,right: 20,
                      child: GestureDetector(
                    onTap: (){
                           setState(() {
                             user='Prime user';
                           });
                           Navigator.of(context).push(
                               MaterialPageRoute(
                                   builder: (context) =>
                                       Registrationship(user)));
                           },
                        child: Container(
                          decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(50)),
                          child: Center(
                            child: Text("Subcription",textAlign: TextAlign.center,style: TextStyle(color: Colors.black, fontSize: 20,fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(width: 70,height: 70,padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(color: Colors.pink,borderRadius: BorderRadius.circular(50)),
                      child: Container(padding: EdgeInsets.all(5),decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(50)),
                        child: Container(padding: EdgeInsets.all(5),decoration: BoxDecoration(color: Colors.pink,borderRadius: BorderRadius.circular(50)),
                          child: Container(padding: EdgeInsets.all(0),decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(50)),
                            child: Center(child: Text("2",textAlign: TextAlign.center,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Stack(
                  children: [
                    Positioned(bottom: 10,top: 10,left: 20,right: 20,
                      child: GestureDetector(
                        child: Container(
                          decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(50)),
                          child: Center(
                            child: Text("Subcription",textAlign: TextAlign.center,style: TextStyle(color: Colors.black, fontSize: 20,fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(width: 70,height: 70,padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(color: Colors.pink,borderRadius: BorderRadius.circular(50)),
                      child: Container(padding: EdgeInsets.all(5),decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(50)),
                        child: Container(padding: EdgeInsets.all(5),decoration: BoxDecoration(color: Colors.pink,borderRadius: BorderRadius.circular(50)),
                          child: Container(padding: EdgeInsets.all(0),decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(50)),
                            child: Center(child: Text("3",textAlign: TextAlign.center,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )

            ],
          ),


        ),
         /* Positioned(
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
