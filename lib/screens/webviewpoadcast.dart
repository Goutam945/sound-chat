import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:url_audio_stream/url_audio_stream.dart';
import 'package:webview_flutter/webview_flutter.dart';
class webviewpodcast extends StatefulWidget {
  //final j,weekday;
  //webviewpodcast(this.j,this.weekday);

  @override
  _webviewpodcastState createState() => _webviewpodcastState();
}

class _webviewpodcastState extends State<webviewpodcast> {
  bool play = true;
  String data;
  var superheros_length;
  int day=6;

  String audiourl;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
    // setState(() {
    //   weekday=DateTime.now().weekday-1;
    //   if(weekday==-1)
    //     weekday=6;
    // });
  }
  void getData() async {
    http.Response response = await http.get(
        "https://mintok.com/soundchat/wp-json/schedule/v2/?post_type=schedule");
    if (response.statusCode == 200) {
      data = response.body; //store response as string
      setState(() {
        superheros_length = jsonDecode(
            data)['data']; //get all the data from json string superheros
        print(superheros_length
            .length); // just printed length of dathttps://www.impetrosys.com/soundchatradio/wp-content/uploads/2018/12/IMG-20181212-WA0060.jpga
      });
      var venam = jsonDecode(data)['data'][4]['url'];
      print(venam);
    } else {
      print(response.statusCode);
    }
  }





  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;
    //int weekday=widget.weekday;

    return Stack(
      children: [
        Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Color(0xFFE18D13),
            leading: Builder(
                builder: (BuildContext context){
                  return IconButton(
                    icon: Icon(Icons.arrow_back_rounded,color: Colors.white,size: 25,),
                    onPressed: () {
                      Navigator.of(context).pop();

                    },
                  );
                }),
            // title: Text("Flutter App"),
          ),
          // body: Center(
          //     child:Text("Welcome to Home Page",
          //         style: TextStyle( color: Colors.black, fontSize: 30)
          //     )
          // ),
          body: (superheros_length != null) ? ListView(
            children: [
              Container(height: height*0.0044,width:width,color: Color(0xFF780001),),
              Padding(
                padding: const EdgeInsets.all(0.0),
                child: Column(
                  children: [
                    SizedBox(child: Image.asset('assets/imgpodcast.png',fit: BoxFit.fill,),height:height*0.4103,width: width,),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Container(
                          child: Text("podcast from this show",style: TextStyle( color: Color(0xFF8A8889), fontSize: 18)),
                        ),
                      ),

                    ),
                  ],
                ),


              ),
                  Container(height: 200,
                    child: WebView(javascriptMode: JavascriptMode.unrestricted,
                            initialUrl: jsonDecode(data)['data'][0]['shows'][1]['show_audio_url'],
                         ),
                  ),
            ],
          ):Center(
              child: CircularProgressIndicator()
          ),



        ),
        Positioned(top: height*0.0402,left: width*0.39865,child: SizedBox(height:height * 0.12168,width: width * 0.21875,child: Image.asset('assets/soundpic.png',))),
      ],
    );
  }
}
