import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class Podcast extends StatefulWidget {
  @override
  _PodcastState createState() => _PodcastState();
}

class _PodcastState extends State<Podcast> {
  String data;
  var superherosLength;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }
  void getData() async {
    http.Response response =
    await http.get("https://mintok.com/soundchat/wp-json/interview/v2/?post_type=podcast");
    if (response.statusCode == 200) {
      data = response.body; //store response as string
      setState(() {
        superherosLength = jsonDecode(
            data)['data']['free_content'];
      });
    } else {
      print(response.statusCode);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Radio Podcasts"),
        backgroundColor: Color(0xFFE18D13),
        //title: Text("Flutter Http Example"),
      ),
      body: (superherosLength != null) ?ListView.builder(
        itemCount: superherosLength == null ? 0 : superherosLength.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: Container( height: 250, decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/pic.jpg"),colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.6), BlendMode.dstATop),
                fit: BoxFit.cover,
              ),
            ),
              child: ListTile( tileColor: Colors.black,
                title: Text(superherosLength[index]['post_title'],style: TextStyle(color: Color(0xFF780001),fontSize: 25,fontStyle: FontStyle.italic,)),
                subtitle: Text(superherosLength[index]['post_content'],style: TextStyle(color: Colors.white,fontSize: 15,fontStyle: FontStyle.italic,),),
              ),
            ),
          );

        },

      ):Center(
        child: CircularProgressIndicator(),
      ),

    );
  }
}
