import 'package:http/http.dart' as http;
import 'package:sound_chat/common/index.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      theme: ThemeData(
      ),
      home: Subscription(),
    );
  }
}

class Subscription extends StatefulWidget {
  @override
  _SubscriptionState createState() => _SubscriptionState();
}

class _SubscriptionState extends State<Subscription> {
  String data;
  var superherosLength;
  @override
  void initState() {
    super.initState();
    getData();
  }
  void getData() async {
    http.Response response =
    await http.get("https://mintok.com/soundchat/wp-json/membership/v2/");
    if (response.statusCode == 200) {
      data = response.body; 
      setState(() {
        superherosLength = jsonDecode(
            data)['data']; 
      });
    } else {
      print(response.statusCode);
    }
  }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Subcribtions"),
        backgroundColor: Color(0xFFE18D13),
        //title: Text("Flutter Http Example"),
      ),
      body: (superherosLength != null) ?ListView(

          children: [
      for(int i=1;i<5;i++)
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Container(color: Color(0xFF5bcc80),
                  child: Row(
                    children: [
                      Container(
                        width: width * 0.2037,
                        height: height * 0.1001,
                        decoration: BoxDecoration(
                          color: Colors.white,
                            border: Border.all(color: Color(0xFF5bcc80), width: 4)),
                        child:Center(child: Text(jsonDecode(data)['data']['$i']['price_text'],style: TextStyle(color: Color(0xFF8A8989),fontSize: 20),textAlign: TextAlign.center,)),
                      ),
                      Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 50),
                            child: Text(jsonDecode(data)['data']['$i']['label'],style: TextStyle(color: Colors.white, fontSize: 20,),
                            ),
                          ),
                          // Padding(
                          //   padding: const EdgeInsets.only(left: 10),
                          //   child: Text(jsonDecode(data)['data']['$i']['description'], style: TextStyle(color: Colors.white, fontSize: 14,),
                          //   ),
                          // ),
                          // Padding(
                          //   padding: const EdgeInsets.only(left: 10),
                          //   child: Text("test", style: TextStyle(color: Colors.white, fontSize: 14,),
                          //   ),
                          // ),
                        ],
                      ),
                    ],
                  ),
                ),

              ),
              Divider(
                color: Colors.black,
              ),
            ],
         ),

        ],

      ):Center(
        child: CircularProgressIndicator(),
      ),

    );
  }
}
