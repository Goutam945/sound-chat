import 'package:sound_chat/common/appbar.dart';
import 'package:sound_chat/common/index.dart';
import 'package:sound_chat/screens/InetrviewvideoplayStudio.dart';
import 'package:sound_chat/screens/InterviewvideoplayYellow.dart';
import 'package:sound_chat/screens/Primiumallvideo.dart';
import 'package:sound_chat/screens/PrimiumvideoPlay.dart';
import 'package:sound_chat/screens/Studioallvideo.dart';
import 'package:sound_chat/screens/Yellowallvideo.dart';
import "dart:math";

import 'NewLogin.dart';
class AllHomeInterview extends StatefulWidget {
  @override
  _AllHomeInterviewState createState() => _AllHomeInterviewState();
}

class _AllHomeInterviewState extends State<AllHomeInterview> {
  YoutubePlayerController youtubeController;
  double videoheight = 1.356;
  double videowidth = 1.018;
  String url;
  bool isTrue = true;
  String imageUrl;
  String titlepost;
  String email;
  String name ;
  bool roated=true;
  int randomNumber;
  List<int>number;
  @override
  void initState() {
    super.initState();
    _loadSavedData();
    setState(() {
      var rng = new Random();
      randomNumber=rng.nextInt(100);
      // for(int i=0; i<7;i++){
      //   number[i]=randomNumber;
      //   print(number);
      // }
    });
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
    var superherosLength = (Provider.of<VideoResponse>(context, listen: false).data != null)?Provider.of<VideoResponse>(context, listen: false).data['data']: null;

    return SafeArea(
      child: Stack(
        children: [
          Scaffold(
            backgroundColor: Colors.black,
            appBar: roated?PreferredSize( preferredSize: Size.fromHeight(55),child: Appbar(email,name)):null,
            bottomNavigationBar:   Offstage(offstage:!roated,
              child: Container(
        height: height * 0.085,
        color: Color(0xFF780001),
        child: Padding(
          padding: const EdgeInsets.only(top: 5,bottom: 5),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  child: Row(
                    children: [
                      Icon(
                        Icons.home,
                        size: width * 0.13,
                        color: Color(0xFFE18D13),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          "HOME",
                          style: TextStyle(
                              color: Colors.white, fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                  onTap: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => HomeScreen()));
                  },
                ),
                VerticalDivider(
                  thickness: 1,
                  color: Color(0xFFB71613),
                ),
                GestureDetector(
                  child: Row(
                    children: [
                      Icon(
                        Icons.radio,
                        size: width * 0.12,
                        color: Color(0xFFE18D13),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          "LISTEN",
                          style: TextStyle(
                              color: Colors.white, fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                  onTap: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => HomeScreen()));
                  },
                ),
                VerticalDivider(
                  thickness: 1,
                  color: Color(0xFFB71613),
                ),
                GestureDetector(
                  child: Row(
                    children: [
                      Icon(Icons.live_tv,
                          size: width * 0.12,
                          color: Color(0xFFE18D13)),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          "WATCH",
                          style: TextStyle(
                              color: Colors.white, fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                  onTap: () {
                    OverlayService().addVideosOverlay(context, VideoPlayerPage());
                  },
                ),
                IconButton(
                  icon: Icon(
                    Icons.more_vert,
                    size: width * 0.13,
                    color: Colors.white,
                  ),
                  padding: EdgeInsets.only(bottom: 30),
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => NewMenuScreen()));
                  },
                ),
              ],
          ),
        ),
      ),
            ),

            body: (superherosLength != null)? Column(
              children: [
                Container(height: height*0.0044,width:width,color: Color(0xFF780001),),
                (isTrue)
                    ? Container(
                    height: height*0.356,
                    width: width * videowidth,
                     /* child: youtubeplayer(url??superherosLength['free_content'][0]['featured_img'],(){setState(() {
                      roated=!roated;
                    });})*/
                      // child: CachedNetworkImage(
                      //   imageUrl: superherosLength['free_content'][randomNumber]['featured_img'],fit: BoxFit.cover,
                      //   placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                      //   errorWidget: (context, url, error) => Icon(Icons.error),
                      // ),
                    child: GestureDetector(child:
                      Stack(
                        children: [
                          SizedBox.expand(
                            // child: Container(
                            //   child: Opacity(opacity: 0.5,
                            //     child: CachedNetworkImage(
                            //       imageUrl: superherosLength['free_content'][randomNumber]['featured_img'],fit: BoxFit.cover,
                            //
                            //       placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                            //       errorWidget: (context, url, error) => Icon(Icons.error),
                            //     ),
                            //   ),
                            // ),
                            child: (superherosLength != null)? CarouselSlider(
                              options: CarouselOptions(height: double.infinity, autoPlay: true,
                                enlargeCenterPage: true,
                                viewportFraction: 1,
                                autoPlayInterval: Duration(seconds: 10),
                                autoPlayAnimationDuration: Duration(seconds: 1),

                              ),
                              items: <Widget>[
                                for (int i = 0; i < superherosLength['free_content'].length; i++)
                                  Stack(children: [
                                    Opacity(opacity: 0.5,
                                      child: Container(
                                        width: MediaQuery.of(context).size.width,
                                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: NetworkImage(superherosLength['free_content'][i]['featured_img']),
                                            fit: BoxFit.fill,

                                          ),
                                          // border:
                                          //     Border.all(color: Theme.of(context).accentColor),
                                        ),
                                      ),
                                    ),
                                    Positioned(bottom: 70,left: 5,right: width*0.6,child: Container(child: SizedBox(child: Text(superherosLength['free_content'][i]['post_title'],style: TextStyle(color: Colors.white,fontWeight:FontWeight.normal,fontSize: 23),)))),
                                    Positioned(bottom: 20,left: 10,
                                      child: ElevatedButton(style:ElevatedButton.styleFrom( primary:  Colors.red[900],),
                                        onPressed: () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      InterviewNewPlayer(
                                                          superherosLength['free_content'][i]['free_video_url'],superherosLength['free_content'][i]['post_title'])));

                                        },
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.play_arrow_sharp,
                                              color: Colors.white,
                                            ),
                                            Text('Play'),
                                          ],
                                        ),
                                      ),
                                    ),
                            ]
                                  ),
                              ],


                            ):Center(child: CircularProgressIndicator()),

                          ),
                        //  Positioned(bottom: 70,left: 5,right: 5,child: SizedBox(height: 30,width: 30,child: Text(superherosLength['free_content'][randomNumber]['post_title'],style: TextStyle(color: Colors.white,fontWeight:FontWeight.normal,fontSize: 23),))),
                        //   Positioned(bottom: 20,left: 10,
                        //     child: ElevatedButton(style:ElevatedButton.styleFrom( primary:  Colors.red[900],),
                        //       onPressed: () {
                        //         Navigator.of(context).push(
                        //             MaterialPageRoute(
                        //                 builder: (context) =>
                        //                     InterviewNewPlayer(
                        //                         superherosLength['free_content'][randomNumber]['free_video_url'],superherosLength['free_content'][randomNumber]['post_title'])));
                        //
                        //       },
                        //       child: Row(
                        //         children: [
                        //           Icon(
                        //             Icons.play_arrow_sharp,
                        //             color: Colors.white,
                        //           ),
                        //           Text('Play'),
                        //         ],
                        //       ),
                        //     ),
                        //   ),
                        ],
                      ),
                        onTap: (){
                          setState(() {
                            // Navigator.of(context).push(
                            //     MaterialPageRoute(
                            //         builder: (context) =>
                            //             InterviewNewPlayer(
                            //                 superherosLength['free_content'][randomNumber]['free_video_url'],superherosLength['free_content'][randomNumber]['post_title'])));
                          });
                        },

                      ),


                ) : Container(height: height * 0.346,
                  child: Stack(
                    children: [
                      SizedBox(height:height * 0.346,width: width,
                        // child: Image.network(imageUrl, fit: BoxFit.fill,
                        // ),
                        child:CachedNetworkImage(
                          imageUrl:imageUrl, fit: BoxFit.fill,
                          placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                          errorWidget: (context, url, error) => Icon(Icons.error),
                        ),
                      ),
                      Center(
                        child: IconButton(icon:Icon(Icons.play_circle_fill,color: Colors.red,size: 45,),
                          onPressed: (){
                            setState(() {
                              isTrue =!isTrue;
                            });
                          },),
                      )
                    ],
                  ),
                ),
                Container( height: height*0.0512,width: width,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.bottomRight,
                          colors: <Color>[
                            Color(0xFFA10B0F),
                            Color(0xFF074516),

                          ])
                  ),
                  child: Center(child: Text("CURRENTLY THREDING INTERVIEWS",textAlign: TextAlign.center,style: TextStyle( color: Colors.white, fontSize: 18,))),
                ),
                if(roated)
                Expanded(
                  child: Container(
                    child: ListView(
                      children: [
                        //SizedBox(child: Image.asset('assets/images.jpeg',fit: BoxFit.fill,),height:height*0.3103,width: width,),


                        // Container( height: height*0.0512,width: width,
                        //   decoration: BoxDecoration(
                        //       gradient: LinearGradient(
                        //           begin: Alignment.centerLeft,
                        //           end: Alignment.bottomRight,
                        //           colors: <Color>[
                        //             Color(0xFFA10B0F),
                        //             Color(0xFF074516),
                        //
                        //           ])
                        //   ),
                        //   child: Center(child: Text("CURRENTLY THREDING INTERVIEWS",textAlign: TextAlign.center,style: TextStyle( color: Colors.white, fontSize: 18,))),
                        // ),
                        Container( height: height*0.0512,width: width,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: <Color>[
                                    Color(0xFF074516),
                                    Color(0xFF050608),

                                  ])
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 5,left: 10),
                            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("PRIMIUM INTERVIEWS",textAlign: TextAlign.start,style: TextStyle( color: Colors.white, fontSize: 15,fontFamily: 'Montserrat')),
                                GestureDetector(
                                  onTap: (){
                                        Navigator.of(context).push(MaterialPageRoute(
                                        builder: (context) => PrimiumvideoScreen()));
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: Text("View More",style: TextStyle(color: Colors.red),),
                                  ),)
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Container(width: width*1.01998,color: Color(0xFF222222),
                            child: SingleChildScrollView(  scrollDirection: Axis.horizontal,
                              child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  for (int i = 0; i < 10; i++)
                                    Row(
                                      children: [

                                        //SizedBox(width: 80,height:60,child: GestureDetector(child: Image.network(jsonDecode(data)['data']['free_content']['$i']['featured_img'],fit: BoxFit.fill,),
                                        SizedBox(width: width*0.3094,height:height*0.1977,child: GestureDetector(child:
                                        // CachedNetworkImage(
                                        //   //imageUrl:  jsonDecode(data)['data']['free_content']['$i']['featured_img'],fit: BoxFit.fill,
                                        //   imageUrl: superherosLength['premium_content'][i]['featured_img'],fit: BoxFit.fill,
                                        //   placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                                        //   errorWidget: (context, url, error) => Icon(Icons.error),
                                        // ),
                                        Stack(
                                          children: [
                                            SizedBox.expand(
                                              child: Container(
                                                child: Opacity(opacity: 0.7,
                                                  child: ClipRRect(borderRadius: BorderRadius.circular(15),
                                                    child: CachedNetworkImage(
                                                      imageUrl: superherosLength['premium_content'][i]['featured_img'],fit: BoxFit.cover,
                                                      placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                                                      errorWidget: (context, url, error) => Icon(Icons.error),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Positioned(bottom: 10,left: 20,right: 20,child: Container(decoration: BoxDecoration(
                                              // BoxShape.circle or BoxShape.retangle
                                              //color: const Color(0xFF66BB6A),
                                                boxShadow: [
                                                  BoxShadow(offset: Offset(0.0,5.0),
                                                    color: Colors.black,
                                                    blurRadius: 15.0,
                                                  ),
                                                ]),
                                                child: SizedBox(height: 30,child: Text(superherosLength['premium_content'][i]['post_title'],textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontWeight:FontWeight.normal,fontSize: 12),))))
                                          ],
                                        ),


                                          onTap: (){
                                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=> (email==null)?NewLogin():Primiumvideo(superherosLength['premium_content'][i]['premium_video_url'],superherosLength['premium_content'][i]['post_title'])));
                                           // Toast.show("PREMIUM MEMBERSHIP", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
                                          },

                                        )),
                                        SizedBox(width: 10,),
                                      ],
                                    ),


                                ],

                              ),
                            ),
                          ),
                        ),

                        Container( height: height*0.0512,width: width,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: <Color>[
                                    Color(0xFF050406),
                                    Color(0xFF1B1C1E),

                                  ])
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 5,left: 10),
                            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("BIG YELLOW TENT INTERVIEWS",textAlign: TextAlign.start,style: TextStyle( color: Colors.white, fontSize: 15,fontFamily: 'Montserrat')),
                                GestureDetector(
                                  onTap: (){
                                    Navigator.of(context).push(MaterialPageRoute(
                                        builder: (context) => YellowvideoScreen()));
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: Text("View More",style: TextStyle(color: Colors.red),),
                                  ),)
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Container(width: width*1.01998,color: Color(0xFF222222),
                            child: SingleChildScrollView(  scrollDirection: Axis.horizontal,
                              child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  for (int i = 0; i < 10; i++)
                                    Row(
                                      children: [

                                        //SizedBox(width: 80,height:60,child: GestureDetector(child: Image.network(jsonDecode(data)['data']['free_content']['$i']['featured_img'],fit: BoxFit.fill,),
                                        SizedBox(width: width*0.3094,height:height*0.1977,child: GestureDetector(child:
                                        // CachedNetworkImage(
                                        //   imageUrl:superherosLength['category'][0]['The big yellow tent'][i]['details']['featured_img'],fit: BoxFit.fill,
                                        //   placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                                        //   errorWidget: (context, url, error) => Icon(Icons.error),
                                        // ),
                                        Stack(
                                          children: [
                                            SizedBox.expand(
                                              child: Container(
                                                child: Opacity(opacity: 0.7,
                                                  child: ClipRRect(borderRadius: BorderRadius.circular(15) ,
                                                    child: CachedNetworkImage(
                                                      imageUrl:superherosLength['category'][0]['The big yellow tent'][i]['details']['featured_img'],fit: BoxFit.cover,
                                                      placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                                                      errorWidget: (context, url, error) => Icon(Icons.error),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Positioned(bottom: 5,left: 20,right: 20,child: Container(decoration: BoxDecoration(
                                              // BoxShape.circle or BoxShape.retangle
                                              //color: const Color(0xFF66BB6A),
                                                boxShadow: [
                                                  BoxShadow(offset: Offset(0.0,5.0),
                                                    color: Colors.black,
                                                    blurRadius: 15.0,
                                                  ),
                                                ]),
                                                child: SizedBox(height: 30,child: Text(superherosLength['category'][0]['The big yellow tent'][i]['details']['post_title'],textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontWeight:FontWeight.normal,fontSize: 12),))))
                                          ],
                                        ),



                                          onTap: (){
                                            setState(() {
                                              // url = superherosLength['category'][0]['The big yellow tent'][i]['details']['free_video_url'];
                                              // imageUrl=superherosLength['category'][0]['The big yellow tent'][i]['details']['featured_img'];
                                              // //  titlepost=jsonDecode(data)['data']['free_content'][i]['post_title'];
                                              // //isTrue = true;
                                              // isTrue =false;
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          InterviewPlay(
                                                              superherosLength['category'][0]['The big yellow tent'][i]['details']['free_video_url'], superherosLength['category'][0]['The big yellow tent'][i]['details']['post_title'])));
                                            });


                                          },

                                        )),
                                        SizedBox(width: 10,),
                                      ],
                                    ),


                                ],

                              ),
                            ),
                          ),
                        ),

                        Container( height: height*0.0512,width: width,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: <Color>[
                                    Color(0xFF050406),
                                    Color(0xFF1B1C1E),

                                  ])
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 5,left: 10),
                            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("IN STUDIO INTERVIEWS",textAlign: TextAlign.start,style: TextStyle( color: Colors.white, fontSize: 15,fontFamily: 'Montserrat')),
                                GestureDetector(
                                  onTap: (){
                                    Navigator.of(context).push(MaterialPageRoute(
                                        builder: (context) => StudiovideoScreen()));
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: Text("View More",style: TextStyle(color: Colors.red),),
                                  ),)
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Container(width: width*1.01998,color: Color(0xFF222222),
                            child: SingleChildScrollView(  scrollDirection: Axis.horizontal,
                              child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  for (int i = 0; i < 10; i++)
                                    Row(
                                      children: [
                                        SizedBox(width: width*0.3094,height:height*0.1977,child: GestureDetector(child:
                                        // CachedNetworkImage(
                                        //   //imageUrl:  jsonDecode(data)['data']['free_content']['$i']['featured_img'],fit: BoxFit.fill,
                                        //   imageUrl: superherosLength['free_content'][i]['featured_img'],fit: BoxFit.fill,
                                        //   placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                                        //   errorWidget: (context, url, error) => Icon(Icons.error),
                                        // ),
                                        Stack(
                                          children: [
                                            SizedBox.expand(
                                              child: Container(
                                                child: Opacity(opacity: 0.7,
                                                  child: ClipRRect(borderRadius: BorderRadius.circular(15),
                                                    child: CachedNetworkImage(
                                                      imageUrl: superherosLength['free_content'][i]['featured_img'],fit: BoxFit.cover,

                                                      placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                                                      errorWidget: (context, url, error) => Icon(Icons.error),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Positioned(bottom: 10,left: 20,right: 20,child: Container(decoration: BoxDecoration(
                                              // BoxShape.circle or BoxShape.retangle
                                              //color: const Color(0xFF66BB6A),
                                                boxShadow: [
                                                  BoxShadow(offset: Offset(0.0,5.0),
                                                    color: Colors.black,
                                                    blurRadius: 15.0,
                                                  ),
                                                ]),
                                                child: SizedBox(height: 30,child: Text(superherosLength['free_content'][i]['post_title'],textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontWeight:FontWeight.normal,fontSize: 12),))))
                                          ],
                                        ),


                                          onTap: (){
                                            setState(() {
                                              // url = superherosLength['free_content'][i]['free_video_url'];
                                              // imageUrl=superherosLength['free_content'][i]['featured_img'];
                                              // titlepost=superherosLength['free_content'][i]['post_title'];
                                              // //isTrue = true;
                                              // isTrue =false;
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          InterviewNewPlayer(
                                                              superherosLength['free_content'][i]['free_video_url'],superherosLength['free_content'][i]['post_title'])));
                                            });
                                          },

                                        )),
                                        SizedBox(width: 10,),
                                      ],
                                    ),


                                ],

                              ),
                            ),
                          ),
                        ),

                        /* no data api
                        Container( height: height*0.0512,width: width,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: <Color>[
                                    Color(0xFF050406),
                                    Color(0xFF1B1C1E),

                                  ])
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 5,left: 10),
                            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("SOUNDCHAT TVINTERVIEWS",textAlign: TextAlign.start,style: TextStyle( color: Colors.white, fontSize: 15,fontFamily: 'Montserrat')),
                                GestureDetector(
                                  child: Icon(Icons.add,color: Colors.red,),)
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Container(width: width*1.01998,color: Color(0xFF222222),
                            child: SingleChildScrollView(  scrollDirection: Axis.horizontal,
                              child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  for (int i = 0; i <10; i++)
                                  //for (int i = 0; i < superherosLength['category'][0]['Premium Sound Chat Interviews'].length; i++)
                                    Row(
                                      children: [

                                        //SizedBox(width: 80,height:60,child: GestureDetector(child: Image.network(jsonDecode(data)['data']['free_content']['$i']['featured_img'],fit: BoxFit.fill,),
                                        SizedBox(width: width*0.1944,height:height*0.0877,child: GestureDetector(child:
                                        CachedNetworkImage(
                                          imageUrl:superherosLength['category'][0]['Premium Sound Chat Interviews'][i]['details']['featured_img'],
                                          placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                                          errorWidget: (context, url, error) => Icon(Icons.error),
                                        ),


                                          onTap: (){
                                            Toast.show("PREMIUM MEMBERSHIP", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
                                          },

                                        )),
                                        SizedBox(width: 10,),
                                      ],
                                    ),


                                ],

                              ),
                            ),
                          ),
                        ),*/

                      ],
                    ),
                  ),
                ),

              ],
            ): Center(
              child: CircularProgressIndicator(),
            ),

          ),
          if(roated)
          Positioned(
            top: AppBar().preferredSize.height*0.2,
            left: width * 0.39865,
            child: SizedBox(
              height: height * 0.12168,
              width: width * 0.21875,
              child: Image.asset(
                'assets/soundpic.png',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
class youtubeplayer extends StatefulWidget {

  String  videoURL;
  final ontap;
  @override
  _VideoState createState() => _VideoState();

  youtubeplayer(this.videoURL,this.ontap);
}


class _VideoState extends State<youtubeplayer> {

  YoutubePlayerController _controller;



  @override
  void initState() {
    _controller = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(widget.videoURL),
        flags:YoutubePlayerFlags(


        )
    );

    super.initState();


  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.black,
          body: Center(
            child: YoutubePlayerBuilder(onEnterFullScreen: widget.ontap,onExitFullScreen: widget.ontap,
              player: YoutubePlayer(
                controller: _controller,
                aspectRatio: 16 / 9,
                showVideoProgressIndicator: true,
              ),
              builder: (context, player) {
                return Column(
                  children: <Widget>[
                    player,
                  ],
                );
              },
            ),
          )),
    );
  }
}
