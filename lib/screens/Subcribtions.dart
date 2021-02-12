import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      theme: ThemeData(
      ),
      home: Subcribtion(),
    );
  }
}

class Subcribtion extends StatefulWidget {
  @override
  _SubcribtionState createState() => _SubcribtionState();
}

class _SubcribtionState extends State<Subcribtion> {
  String data;
  var superheros_length;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }
  void getData() async {
    http.Response response =
    await http.get("https://mintok.com/soundchat/wp-json/membership/v2/");
    if (response.statusCode == 200) {
      data = response.body; //store response as string
      setState(() {
        superheros_length = jsonDecode(
            data)['data']; //get all the data from json string superheros
        print(superheros_length.length); // just printed length of dathttps://www.impetrosys.com/soundchatradio/wp-content/uploads/2018/12/IMG-20181212-WA0060.jpga
      });
      var venam = jsonDecode(data)['data'][4]['url'];
      print(venam);
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
      body: (superheros_length != null) ?ListView(

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
