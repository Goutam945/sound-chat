// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_app1/Interview.dart';
// import 'package:flutter_app1/reponsive%20testing.dart';
//
// import 'Gellaryimages.dart';
// import 'Interview design.dart';
// import 'Podcost.dart';
// import 'Schedule design.dart';
// import 'Schedule.dart';
// import 'designGallery.dart';
// class NewMenuscreen1 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     double width=MediaQuery.of(context).size.width;
//     double height=MediaQuery.of(context).size.height;
//     return Stack(
//       children: [
//
//         Scaffold(
//           backgroundColor: Color(0xFF111111),
//           appBar: AppBar(
//             backgroundColor: Color(0xFFE18D13),
//             leading: Builder(
//                 builder: (BuildContext context){
//                   return IconButton(
//                     icon: Icon(Icons.search,color: Colors.white,size: 25,),
//                     onPressed: () {
//
//                     },
//                   );
//                 }),
//             // title: Text("Flutter App"),
//             actions: <Widget>[
//               IconButton(
//                 icon: Icon(Icons.close,color: Colors.white,size: 25,),
//                 onPressed: () {
//                 },
//               ),
//             ],
//           ),
//           body: ListView(
//             children: [
//               SizedBox(height: height*0.20994,width: width*1.06946,
//                 child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.only(top: 15),
//                       child: Container(
//                         child: Column(children: [
//                           GestureDetector(child: SizedBox(height: height*0.17558,width:width*0.3645,child: Image.asset('assets/livechat.png',fit: BoxFit.fill,)),
//                             onTap: (){
//                               // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>podcost()));
//                             },
//
//                           ),
//                           //  Text("LIVECHATROOM",style: TextStyle(color: Colors.white,fontSize: 14),),
//                         ],),
//                       ),
//                     ),
//
//
//
//
//
//
//                     Column(children: [
//                       Text("MENU",style: TextStyle(color:  Color(0xFF8A8989),fontSize: 20),),
//                     // check divice  Text('\n\n$height\n $width',style: TextStyle(color:  Color(0xFF8A8989),fontSize: 20),),
//                       Padding(
//                         padding: const EdgeInsets.only(top: 10),
//                         child: Container(
//                           child: Column(children: [
//                             GestureDetector(child: SizedBox(height:height*0.1463,width: width*0.5833 ,child: Image.asset('assets/inteview.png',fit: BoxFit.fill,)),
//                               onTap: (){
//                                 Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Interviewdesign()));
//                               },
//
//                             ),
//                             //  Text("LIVECHATROOM",style: TextStyle(color: Colors.white,fontSize: 14),),
//                           ],),
//                         ),
//                       ),
//                     ],)
//                   ],
//                 ),
//               ),
//
//
//
//
//               Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   SizedBox(height: height*0.44843,
//                     child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
//                       SizedBox(width: width*0.60965,
//                         child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Padding(
//                               padding: const EdgeInsets.only(top: 5),
//                               child: Container(
//                                 child: Column(children: [
//                                   GestureDetector(child: SizedBox(height: height*0.2414,width: width*0.291667,child: Image.asset('assets/shopping.png',fit: BoxFit.fill,)),
//                                     onTap: (){
//                                       //Navigator.of(context).push(MaterialPageRoute(builder: (context)=>NewMenuscreen1()));
//                                     },
//
//                                   ),
//                                   //  Text("LIVECHATROOM",style: TextStyle(color: Colors.white,fontSize: 14),),
//                                 ],),
//                               ),
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.only(top: 5),
//                               child: Container(
//                                 child: Column(children: [
//                                   GestureDetector(child: SizedBox(height: height*0.2414,width: width*0.291667,child: Image.asset('assets/photogallery.png',fit: BoxFit.fill,)),
//                                     onTap: (){
//                                       Navigator.of(context).push(MaterialPageRoute(builder: (context)=>gallerydesign()));
//                                     },
//
//                                   ),
//                                   //  Text("LIVECHATROOM",style: TextStyle(color: Colors.white,fontSize: 14),),
//                                 ],),
//                               ),
//                             ),
//
//
//                           ],
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(top: 4),
//                         child: Column(children: [
//                           Container(
//                             child: Column(children: [
//                               GestureDetector(child: SizedBox(height: height*0.1756,width: width*0.6076,child: Image.asset('assets/profile.png',fit: BoxFit.fill,)),
//                                 onTap: (){
//                                   // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>podcost()));
//                                 },
//
//                               ),
//                               //  Text("LIVECHATROOM",style: TextStyle(color: Colors.white,fontSize: 14),),
//                             ],),
//                           ),
//
//                         ],),
//                       ),
//                     ],),
//                   ),
//
//                   Padding(
//                     padding: const EdgeInsets.only(top: 10),
//                     child: SizedBox(height: height*0.46584,
//                       child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: [
//                         Container(
//                           child: Column(children: [
//                             GestureDetector(child: SizedBox(height: height*0.2926,width: width*0.34027,child: Image.asset('assets/podcast.png',fit: BoxFit.fill,)),
//                               onTap: (){
//                                 Navigator.of(context).push(MaterialPageRoute(builder: (context)=>podcost()));
//                               },
//
//                             ),
//                             //  Text("LIVECHATROOM",style: TextStyle(color: Colors.white,fontSize: 14),),
//                           ],),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(top: 5),
//                           child: Container(
//                             child: Column(children: [
//                               GestureDetector(child: SizedBox(height: height*0.1316,width: width*0.36458,child: Image.asset('assets/time.png',scale: 2.5,)),
//                                 onTap: (){
//                                   Navigator.of(context).push(MaterialPageRoute(builder: (context)=>scheduledesign()));
//                                 },
//
//                               ),
//                               //  Text("LIVECHATROOM",style: TextStyle(color: Colors.white,fontSize: 14),),
//                             ],),
//                           ),
//                         ),
//                       ],),
//                     ),
//                   )
//
//
//                 ],
//               ),
//               SizedBox(height: 20,),
//               Container(
//                 child: Column(crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.only(left: 1),
//                       child: Text("MORE OPTIONS",style: TextStyle( color: Color(0xFF8A8989), fontSize: 24,fontStyle: FontStyle.italic)),
//                     ),
//                     SizedBox(width: width*0.39009,child: Divider(color: Colors.white,))
//                   ],
//                 ),
//               ),
//               SizedBox(width: width*0.763903,
//                 child: Padding(
//                   padding: const EdgeInsets.all(12.0),
//                   child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: [
//                     Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
//                       Padding(
//                         padding: const EdgeInsets.all(3.0),
//                         child: Row(
//                           children: [
//                             Icon(Icons.circle,color: Color(0xFF535353),size: 5,),
//                             SizedBox(width: 5,),
//                             Text("Push Notifications",style: TextStyle( color: Color(0xFF535353), fontSize: 18,)),
//                           ],
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(3.0),
//                         child: Row(
//                           children: [
//                             Icon(Icons.circle,color: Color(0xFF535353),size: 5,),
//                             SizedBox(width: 5,),
//                             Text("Acount Settings",style: TextStyle( color: Color(0xFF535353), fontSize: 18,)),
//                           ],
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(3.0),
//                         child: Row(
//                           children: [
//                             Icon(Icons.circle,color: Color(0xFF535353),size: 5,),
//                             SizedBox(width: 5,),
//                             Text("App Settings",style: TextStyle( color: Color(0xFF535353), fontSize: 18,)),
//                           ],
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(3.0),
//                         child: Row(
//                           children: [
//                             Icon(Icons.circle,color: Color(0xFF535353),size: 5,),
//                             SizedBox(width: 5,),
//                             Text("Menu Layout",style: TextStyle( color:Color(0xFF535353), fontSize: 18,)),
//                           ],
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(3.0),
//                         child: Row(
//                           children: [
//                             Icon(Icons.circle,color: Color(0xFF535353),size: 5,),
//                             SizedBox(width: 5,),
//                             Text("Chat Settings",style: TextStyle( color: Color(0xFF535353), fontSize: 18,)),
//                           ],
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(3.0),
//                         child: Row(
//                           children: [
//                             Icon(Icons.circle,color: Color(0xFF535353),size: 5,),
//                             SizedBox(width: 5,),
//                             Text("Dark Mode",style: TextStyle( color: Color(0xFF535353), fontSize: 18,)),
//                           ],
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(3.0),
//                         child: Row(
//                           children: [
//                             Icon(Icons.circle,color: Color(0xFF535353),size: 5,),
//                             SizedBox(width: 5,),
//                             Text("Language",style: TextStyle( color: Color(0xFF535353), fontSize: 18,)),
//                           ],
//                         ),
//                       ),
//                     ],),
//
//                     Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
//                       Padding(
//                         padding: const EdgeInsets.all(3.0),
//                         child: Row(
//                           children: [
//                             Icon(Icons.circle,color: Color(0xFF535353),size: 5,),
//                             SizedBox(width: 5,),
//                             Text("Contact Us",style: TextStyle( color: Color(0xFF535353), fontSize: 18,)),
//                           ],
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(3.0),
//                         child: Row(
//                           children: [
//                             Icon(Icons.circle,color: Color(0xFF535353),size: 5,),
//                             SizedBox(width: 5,),
//                             Text("Cancel Subscription",style: TextStyle( color: Color(0xFF535353), fontSize: 18,)),
//                           ],
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(3.0),
//                         child: Row(
//                           children: [
//                             Icon(Icons.circle,color: Color(0xFF535353),size: 5,),
//                             SizedBox(width: 5,),
//                             Text("EULA & Privacy",style: TextStyle( color: Color(0xFF535353), fontSize: 18,)),
//                           ],
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(3.0),
//                         child: Row(
//                           children: [
//                             Icon(Icons.circle,color: Color(0xFF535353),size: 5,),
//                             SizedBox(width: 5,),
//                             Text("Terms & Condition",style: TextStyle( color: Color(0xFF535353), fontSize: 18,)),
//                           ],
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(3.0),
//                         child: Row(
//                           children: [
//                             Icon(Icons.circle,color: Color(0xFF535353),size: 5,),
//                             SizedBox(width: 5,),
//                             Text("Refund Policy",style: TextStyle( color: Color(0xFF535353), fontSize: 18,)),
//                           ],
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(3.0),
//                         child: Row(
//                           children: [
//                             Icon(Icons.circle,color: Color(0xFF535353),size: 5,),
//                             SizedBox(width: 5,),
//                             Text("lose Account",style: TextStyle( color: Color(0xFF535353), fontSize: 18,)),
//                           ],
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(3.0),
//                         child: Row(
//                           children: [
//                             Icon(Icons.circle,color: Color(0xFF535353),size: 5,),
//                             SizedBox(width: 5,),
//                             Text("Order Tracking",style: TextStyle( color: Color(0xFF535353), fontSize: 18,)),
//                           ],
//                         ),
//                       ),
//                     ],),
//
//
//
//                   ],),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(10.0),
//                 child: Row(mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text("@ Copyright 2020 Irish & Chin Inc.",style: TextStyle( color: Color(0xFF535353), fontSize: 14,)),
//                   ],
//                 ),
//               )
//             ],
//           ),
//
//         ),
//         Positioned(top: height*0.0702,left: width*0.39865,child: Image.asset('assets/toolpic.png',)),
//       ],
//     );
//   }
// }

import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:video_player/video_player.dart';

import 'package:youtube_player_iframe/youtube_player_iframe.dart';

import 'Interview design.dart';
import 'NewMenu.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      home: Interviewdesign1(),
    );
  }
}

class Interviewdesign1 extends StatefulWidget {
  @override
  _Interviewdesign createState() => _Interviewdesign();
}

class _Interviewdesign extends State<Interviewdesign1> {
  String data;
  var superheros_length;
  int day = 6;
  int j;
  String url;
  bool isTrue = false;

  //YoutubePlayerController controller;
  YoutubePlayerController youtubeController;
  double videoheight = 0.5602;
  double videowidth = 1.018;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  void getData() async {
    http.Response response = await http.get(
        "https://mintok.com/soundchat/wp-json/interview/v2/?post_type=qtvideo");
    if (response.statusCode == 200) {
      data = response.body; //store response as string
      setState(() {
        superheros_length = jsonDecode(data)['data']
            ['free_content']; //get all the data from json string superheros
        print(superheros_length
            .length); // just printed length of dathttps://www.impetrosys.com/soundchatradio/wp-content/uploads/2018/12/IMG-20181212-WA0060.jpga
      });
      var venam = jsonDecode(data)['data']['free_content'][4]['url'];
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
          backgroundColor: Colors.black,
          appBar: AppBar(
            title: Text("Tv Interviews"),
            backgroundColor: Color(0xFFE18D13),
            leading: Builder(builder: (BuildContext context) {
              return IconButton(
                icon: Icon(
                  Icons.arrow_back_rounded,
                  color: Colors.white,
                  size: 25,
                ),
                onPressed: () {
                  SystemChrome.setPreferredOrientations(
                      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
                  // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>NewMenuscreen()));
                  Navigator.of(context).pop();
                },
              );
            }),
            // title: Text("Flutter App"),
            actions: <Widget>[
              // IconButton(
              //   icon: Image.asset(
              //     'assets/search.png',
              //     color: Color(0xFFE18D13),
              //     scale: 2,
              //   ),
              //   onPressed: () {},
              // ),
            ],
          ),
          body: (superheros_length != null)
              ? ListView(
                  children: [
                    (isTrue)
                        ? Container(
                            height: height * videoheight,
                            width: width * videowidth,
                             child: YoutubeVideoApp(url)




                            // child: YoutubePlayerContainer(
                            //   // thumbnail: thumbnail,
                            //   youtubeController: YoutubePlayerController(
                            //       initialVideoId:
                            //           YoutubePlayer.convertUrlToId(url),
                            //       flags: YoutubePlayerFlags()),
                            // ),

                          ) : Image.asset('assets/images.jpeg', fit: BoxFit.fill, height: height * 0.556,
                          ),
                    Column(
                      children: [
                        // SizedBox(
                        //   // child: Image.asset(
                        //   //   'assets/images.jpeg',
                        //   //   fit: BoxFit.fitWidth,
                        //   // ),
                        //  // child: player,
                        //
                        //
                        //   height: height * 0.5002,
                        //   width: width * 1.018,
                        // ),
                        Container(
                          child: Padding(
                            padding: EdgeInsets.only(right: width * 0.3314),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 4, right: 90),
                              child: Text("UPCOMMING SHOWS",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontStyle: FontStyle.italic)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            for (int i = 0; i < 130; i++)
                              SizedBox(
                                height: height * 0.4926,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 10, left: 5),
                                      child: Stack(
                                        children: [
                                          Container(
                                            width: width * 0.2397,
                                            height: height * 0.1393,
                                            child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                // child: Image.network(jsonDecode(data)['data']['free_content']['$i']['featured_img'], fit: BoxFit.fill,
                                                // )
                                            child: CachedNetworkImage(
                                              imageUrl:  jsonDecode(data)['data']['free_content']['$i']['featured_img'],fit: BoxFit.fill,
                                              placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                                              errorWidget: (context, url, error) => Icon(Icons.error),
                                            ),



                                            ),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              color: Colors.white,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 45, left: 45),
                                            child: IconButton(
                                              icon: Icon(
                                                Icons.play_circle_fill,
                                                color: Colors.pink[300],
                                                size: 35,
                                              ),
                                              //           onPressed:()async{
                                              // await launch(jsonDecode(data)['data']['free_content']['$i']['free_video_url']);
                                              //
                                              //     }
                                              //
                                              onPressed: () {
                                                // Navigator.of(context).push(MaterialPageRoute(
                                                //     builder: (context) =>
                                                //         youtubeVideoApp(jsonDecode(data)['data']['free_content']['$i']['free_video_url'])));
                                                //

                                                setState(() {
                                                  url = jsonDecode(data)['data']['free_content']['$i']['free_video_url'];
                                                  //jsonDecode(data)['data']['free_content']['$i']['free_video_url'];
                                                  // for(j=0;j<jsonDecode(data)['data']['free_content']['$j']['free_video_url'].length;j++)
                                                  isTrue = true;
                                                 // isTrue =!isTrue;


                                                });
                                               // Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(context)=>Interviewdesign1() ));
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: SizedBox(
                                          width: 120,
                                          child: Center(
                                              child: Text(
                                            jsonDecode(data)['data']
                                                        ['free_content']['$i']
                                                    ['post_title']
                                                .toString(),
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontStyle: FontStyle.italic,
                                            ),
                                            textAlign: TextAlign.center,
                                          ))),
                                    ),
                                    // Text(jsonDecode(data)['data']['free_content']['$i']['post_name'],
                                    //   style: TextStyle(
                                    //     color: Color(0xFFE18D13),
                                    //     fontSize: 12,
                                    //     fontStyle: FontStyle.italic,
                                    //   ),
                                    // ),
                                  ],
                                ),
                              ),
                          ],
                        )),
                  ],
                )
              : Center(
                  child: CircularProgressIndicator(),
                ),
        );
      }

}

// class youtubeVideoApp extends StatefulWidget {
//   String videoURL;
//
//   @override
//   VideoState createState() => VideoState();
//
//   youtubeVideoApp(
//     this.videoURL,
//   );
// }
//
// class VideoState extends State<youtubeVideoApp> {
//   YoutubePlayerController _controller;
//
//   @override
//   void initState() {
//     _controller = YoutubePlayerController(
//         initialVideoId: YoutubePlayer.convertUrlToId(widget.videoURL),
//         flags: YoutubePlayerFlags());
//
//     super.initState();
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//         body: Center(
//       child: YoutubePlayerBuilder(
//         player: YoutubePlayer(
//           controller: _controller,
//           aspectRatio: 16 / 9,
//           showVideoProgressIndicator: true,
//           onReady: () async {
//             await Future.delayed(Duration(milliseconds: 700));
//
//           },
//
//         ),
//         builder: (context, player) {
//           return player;
//         },
//       ),
//     ));
//   }
// }


/*goutamtst
class YoutubePlayerContainer extends StatefulWidget {
  const YoutubePlayerContainer({Key key, @required this.youtubeController})
      : super(key: key);

  final YoutubePlayerController youtubeController;

  @override
  _YoutubePlayerContainerState createState() => _YoutubePlayerContainerState();
}

class _YoutubePlayerContainerState extends State<YoutubePlayerContainer> {
  int _rotation;

  @override
  void initState() {
    _rotation = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: _rotation,
      child: Stack(
        children: <Widget>[
          SizedBox.expand(
            child: YoutubePlayer(
              bottomActions: <Widget>[
                IconButton(
                  icon: Icon(
                    _rotation == 0 ? Icons.fullscreen : Icons.fullscreen_exit,
                    color: Colors.white,
                  ),
                  onPressed: () async {
                    widget.youtubeController.pause();
                    if (_rotation == 0) {
                      setState(() {
                        _rotation = 1;
                      });
                    } else {
                      setState(() {
                        _rotation = 0;
                      });
                    }
                  },
                ),
                RemainingDuration(),
                ProgressBar(isExpanded: true),
                CurrentPosition(),
              ],
              controller: widget.youtubeController,
              showVideoProgressIndicator: true,
              progressIndicatorColor: Theme.of(context).primaryColor,
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              icon: Icon(
                Icons.close,
                color: Colors.white,
              ),
              onPressed: () => Navigator.of(context).pop(),

            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    widget.youtubeController.dispose();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }
}
tehjhjgj*/



///
class YoutubeAppDemo extends StatefulWidget {
  String  videoURL;
  @override
  _YoutubeAppDemoState createState() => _YoutubeAppDemoState();
  YoutubeAppDemo(this.videoURL,);
}

class _YoutubeAppDemoState extends State<YoutubeAppDemo> {
  YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.videoURL,
      params: const YoutubePlayerParams(
        startAt: const Duration(minutes: 1, seconds: 36),
        showControls: true,
        showFullscreenButton: true,
        desktopMode: true,
        privacyEnhanced: true,
      ),
    );
    _controller.onEnterFullscreen = () {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
     // log('Entered Fullscreen');
    };
    _controller.onExitFullscreen = () {
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
      Future.delayed(const Duration(seconds: 1), () {
        _controller.play();
      });
      Future.delayed(const Duration(seconds: 5), () {
        SystemChrome.setPreferredOrientations(DeviceOrientation.values);
      });
      //log('Exited Fullscreen');
    };
  }

  @override
  Widget build(BuildContext context) {
    const player = YoutubePlayerIFrame();
    return YoutubePlayerControllerProvider(
      // Passing controller to widgets below.
      controller: _controller,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Youtube Player Demo'),
        ),
        body: LayoutBuilder(
          builder: (context, constraints) {
            if (kIsWeb && constraints.maxWidth > 800) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Expanded(child: player),
                  const SizedBox(
                    width: 500,
                    child: SingleChildScrollView(
                      child: Controls(),
                    ),
                  ),
                ],
              );
            }
            return ListView(
              children: [
                player,
                const Controls(),
              ],
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }
}

///
class Controls extends StatelessWidget {
  ///
  const Controls();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _space,
          // MetaDataSection(),
          // _space,
          // SourceInputSection(),
          // _space,
          // PlayPauseButtonBar(),
          // _space,
          // VolumeSlider(),
          // _space,
          // PlayerStateSection(),
        ],
      ),
    );
  }

  Widget get _space => const SizedBox(height: 10);
}













/*YoutubePlayerController _controller;

  @override
  void initState() {
    _controller = YoutubePlayerController(
      initialVideoId:
      YoutubePlayer.convertUrlToId(widget.videoURL),
      flags: YoutubePlayerFlags(
          mute: false,
          autoPlay: true,
          disableDragSeek: true,
          loop: false,
          enableCaption: false),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //     title: Text('About'),
      //     centerTitle: true,
      //     leading: IconButton(
      //       icon: Icon(Icons.arrow_back),
      //       onPressed: () {
      //         Navigator.of(context).pop();
      //       },
      //     )
      // ),

      body: YoutubePlayer(
        controller: _controller,
        showVideoProgressIndicator: true,
        bottomActions: <Widget>[
          const SizedBox(width: 14.0),
          CurrentPosition(),
          const SizedBox(width: 8.0),
          ProgressBar(isExpanded: true),
          RemainingDuration(),
        ],
        aspectRatio: 4 / 3,
        progressIndicatorColor: Colors.white,
        onReady: () {
          print('Player is ready.');
        },
      ),
    );
  }
}*/
