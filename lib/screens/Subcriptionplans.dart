import 'package:http/http.dart' as http;
import 'package:sound_chat/api/membership.dart';
import 'package:sound_chat/common/index.dart';
import 'package:sound_chat/screens/Myaccountprofile.dart';

class Subscriptionplans extends StatefulWidget {
  @override
  _SubscriptionplansState createState() => _SubscriptionplansState();
}

class _SubscriptionplansState extends State<Subscriptionplans> {
  int levelId;
  String user;
  String email, name;

  @override
  void initState() {
    super.initState();
    // getData();
    _loadSavedData();
    createMembershipState(context);
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
    var data1 = context.watch<MembershipResponse>().data;
    var data = (data1!=null)?data1['data']:[];
    return SafeArea(
      child: Stack(children: [
        Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            backgroundColor: Colors.black,
          ),
          body: ListView(
            children: [
              SizedBox(
                height: 40,
              ),
              Center(
                  child: Text(
                    "Member Registration",
                    style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Montserrat1',
                        color: Color(0xFFE18D13),
                        fontWeight: FontWeight.bold),
                  )),
              SizedBox(
                height: 20,
              ),
              Center(
                  child: Text(
                    "Please choose a subscription plan to begin setting up your account.",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: subtitlefontsize,fontFamily: 'Montserrat1', color: Color(0xFFA79A9A)),
                  )),
              SizedBox(
                height: 20,
              ),
              for(int i=0;i<data.length;i++)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Stack(
                    children: [
                      Positioned(
                        bottom: 10,
                        top: 10,
                        left: 20,
                        right: 20,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              user = data[i]['plan_type'];
                              levelId = data[i]['id'];
                            });
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Registrationship(data[i],levelId)));

                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(50)),
                            child: Center(
                              child: Text(
                                data[i]['plan_type'],
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontFamily: 'Montserrat1',
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 70,
                        height: 70,
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.circular(50)),
                        child: Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50)),
                          child: Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: Colors.orange,
                                borderRadius: BorderRadius.circular(50)),
                            child: Container(
                              padding: EdgeInsets.all(0),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(50)),
                              child: Center(
                                  child: Text(
                                    data[i]['id'].toString(),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 18, fontWeight: FontWeight.bold),
                                  )),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
        Positioned(
          top: AppBar().preferredSize.height*0.1,
          left: width * 0.39865,
          child: SizedBox(
            height: height * 0.13168,
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
