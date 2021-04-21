import 'package:http/http.dart' as http;
import 'package:sound_chat/api/membership.dart';
import 'package:sound_chat/common/index.dart';
import 'package:sound_chat/screens/Myaccountprofile.dart';

class Subscription extends StatefulWidget {
  @override
  _SubscriptionState createState() => _SubscriptionState();
}

class _SubscriptionState extends State<Subscription> {
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
          body: ListView(
            children: [
              Image.asset(
                "assets/soundpic.png",
                width: width * 0.316,
                height: height * 0.1902,
              ),
              Center(
                  child: Text(
                    "Member Registration",
                    style: TextStyle(
                        fontSize: 19,
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
                    style: TextStyle(fontSize: 16, color: Color(0xFFA79A9A)),
                  )),
              SizedBox(
                height: 20,
              ),
              for(int i=1;i<=data.length;i++)
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
                              user = data['$i']['label'];
                            });
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Registrationship(data['$i'],i)));
                            // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> (email==null)?Registrationship(user):MyAccount()));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(50)),
                            child: Center(
                              child: Text(
                                data['$i']['label'],
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
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
                            color: Colors.pink,
                            borderRadius: BorderRadius.circular(50)),
                        child: Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50)),
                          child: Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: Colors.pink,
                                borderRadius: BorderRadius.circular(50)),
                            child: Container(
                              padding: EdgeInsets.all(0),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(50)),
                              child: Center(
                                  child: Text(
                                    "1",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 20, fontWeight: FontWeight.bold),
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
      ]),
    );
  }
}
