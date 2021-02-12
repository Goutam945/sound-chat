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
      home: podcost(),
    );
  }
}

class podcost extends StatefulWidget {
  @override
  _VidolistPageState createState() => _VidolistPageState();
}

class _VidolistPageState extends State<podcost> {
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
    await http.get("https://mintok.com/soundchat/wp-json/interview/v2/?post_type=podcast");
    if (response.statusCode == 200) {
      data = response.body; //store response as string
      setState(() {
        superheros_length = jsonDecode(
            data)['data']['free_content']; //get all the data from json string superheros
        print(superheros_length.length); // just printed length of dathttps://www.impetrosys.com/soundchatradio/wp-content/uploads/2018/12/IMG-20181212-WA0060.jpga
      });
      var venam = jsonDecode(data)['data']['free_content'][4]['url'];
      print(venam);
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
      body: (superheros_length != null) ?ListView.builder(

        itemCount: superheros_length == null ? 0 : superheros_length.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(

            child: Container( height: 250, decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/pic.jpg"),colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.6), BlendMode.dstATop),
                fit: BoxFit.cover,
              ),
            ),
              child: ListTile( tileColor: Colors.black,
                title: Text(jsonDecode(data)['data']['free_content'][index]['post_title'],style: TextStyle(color: Color(0xFF780001),fontSize: 25,fontStyle: FontStyle.italic,)),
                subtitle: Text(jsonDecode(data)['data']['free_content'][index]['post_content'],style: TextStyle(color: Colors.white,fontSize: 15,fontStyle: FontStyle.italic,),),
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
