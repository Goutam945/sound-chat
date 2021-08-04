import 'package:sound_chat/api/phoneinterview.dart';
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
import 'PhoneinterviewPlayer.dart';
import 'Phoneinterviewallvideo.dart';
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
    var phonesuperherosLength = (Provider.of<PhoneinterviewResponse>(context, listen: false).data != null)?Provider.of<PhoneinterviewResponse>(context, listen: false).data['data']: null;
    return SafeArea(
      child: Stack(
        children: [
          Scaffold(
            backgroundColor: Colors.black,
            appBar: roated?PreferredSize( preferredSize: Size.fromHeight(55),child: Appbar(email,name)):null,
            bottomNavigationBar:   Offstage(offstage:!roated,
              child:  Bottumnavation(),
            ),

            body: (superherosLength != null)? Column(
              children: [
                Container(height: height*0.0044,width:width,color: Color(0xFF780001),),
                (isTrue)
                    ? Container(
                    height: height*0.356,
                    width: width * videowidth,
                    child: GestureDetector(child:
                      Stack(
                        children: [
                          SizedBox.expand(
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
                                            image: NetworkImage(superherosLength['free_content'][i]['feature_img']),
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
                                                          superherosLength['free_content'][i]['video_url'],superherosLength['free_content'][i]['post_title'])));

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
                                        Navigator.push(context,
                                            PageTransition(type:
                                            PageTransitionType.rightToLeft, child: PrimiumvideoScreen()));
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
                            child: SingleChildScrollView(scrollDirection: Axis.horizontal,
                              child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  for (int i = 0; i < superherosLength['premium_content'].length; i++)
                                    Row(
                                      children: [
                                        Column(
                                          children: [
                                            SizedBox(width: width*0.3094,height:height*0.1977,child: GestureDetector(child:
                                            Stack(
                                              children: [
                                                SizedBox.expand(
                                                  child: Container(
                                                    child: Opacity(opacity: 0.7,
                                                      child: ClipRRect(borderRadius: BorderRadius.circular(10),
                                                        child: CachedNetworkImage(
                                                          imageUrl: superherosLength['premium_content'][i]['feature_img'],fit: BoxFit.cover,
                                                          placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                                                          errorWidget: (context, url, error) => Icon(Icons.error),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                /* textnameimage sedow Positioned(bottom: 10,left: 20,right: 20,child: Container(decoration: BoxDecoration(
                                                    boxShadow: [
                                                      BoxShadow(offset: Offset(0.0,5.0),
                                                        color: Colors.black,
                                                        blurRadius: 15.0,
                                                      ),
                                                    ]),
                                                    child: SizedBox(height: 30,
                                                    child: Text(superherosLength['premium_content'][i]['post_title'],textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontWeight:FontWeight.normal,fontSize: 12),))))*/
                                              ],
                                            ),
                                              onTap: (){
                                                Navigator.of(context).push(MaterialPageRoute(builder: (context)=> (email==null)?NewLogin():Primiumvideo(superherosLength['premium_content'][i]['video_url'],superherosLength['premium_content'][i]['post_title'])));
                                               // Toast.show("PREMIUM MEMBERSHIP", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
                                              },

                                            )),
                                            Opacity(opacity: 0.7,
                                              child: Container(height: 20,width: width*0.3094,
                                                  color: Colors.black,
                                                  child: Text(superherosLength['premium_content'][i]['post_title'],textAlign: TextAlign.center,style: TextStyle(color:Colors.white,),)),
                                            )
                                          ],
                                        ),
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
                                    Navigator.push(context,
                                        PageTransition(type:
                                        PageTransitionType.rightToLeft, child: YellowvideoScreen()));
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
                                  for (int i = 0; i < superherosLength['yellow_content'].length; i++)
                                    Row(
                                      children: [

                                        //SizedBox(width: 80,height:60,child: GestureDetector(child: Image.network(jsonDecode(data)['data']['free_content']['$i']['featured_img'],fit: BoxFit.fill,),
                                        Column(
                                          children: [
                                            SizedBox(width: width*0.3094,height:height*0.1977,child: GestureDetector(child:
                                            Stack(
                                              children: [
                                                SizedBox.expand(
                                                  child: Container(
                                                    child: Opacity(opacity: 0.7,
                                                      child: ClipRRect(borderRadius: BorderRadius.circular(10) ,
                                                        child: CachedNetworkImage(
                                                          imageUrl:superherosLength['yellow_content'][i]['feature_img'],fit: BoxFit.cover,
                                                          placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                                                          errorWidget: (context, url, error) => Icon(Icons.error),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                /*Positioned(bottom: 5,left: 20,right: 20,child: Container(decoration: BoxDecoration(
                                                    boxShadow: [
                                                      BoxShadow(offset: Offset(0.0,5.0),
                                                        color: Colors.black,
                                                        blurRadius: 15.0,
                                                      ),
                                                    ]),
                                                    child: SizedBox(height: 30,child: Text(superherosLength['yellow_content'][i]['post_title'],textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontWeight:FontWeight.normal,fontSize: 12),))))*/
                                              ],
                                            ),
                                              onTap: (){
                                                setState(() {
                                                  Navigator.of(context).push(
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              InterviewPlay(
                                                                  superherosLength['yellow_content'][i]['video_url'], superherosLength['yellow_content'][i]['post_title'])));
                                                });


                                              },

                                            )),
                                            Opacity(opacity: 0.7,
                                              child: Container(height: 20,width: width*0.3094,
                                                  color: Colors.black,
                                                  child: Text(superherosLength['yellow_content'][i]['post_title'],textAlign: TextAlign.center,style: TextStyle(color:Colors.white,),)),
                                            )
                                          ],
                                        ),
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
                                    Navigator.push(context,
                                        PageTransition(type:
                                        PageTransitionType.rightToLeft, child: StudiovideoScreen()));
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
                                  for (int i = 0; i < superherosLength['free_content'].length; i++)
                                    Row(
                                      children: [
                                        Column(
                                          children: [
                                            SizedBox(width: width*0.3094,height:height*0.1977,child: GestureDetector(child:
                                            Stack(
                                              children: [
                                                SizedBox.expand(
                                                  child: Container(
                                                    child: Opacity(opacity: 0.7,
                                                      child: ClipRRect(borderRadius: BorderRadius.circular(10),
                                                        child: CachedNetworkImage(
                                                          imageUrl: superherosLength['free_content'][i]['feature_img'],fit: BoxFit.cover,

                                                          placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                                                          errorWidget: (context, url, error) => Icon(Icons.error),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                /*Positioned(bottom: 10,left: 20,right: 20,child: Container(decoration: BoxDecoration(
                                                    boxShadow: [
                                                      BoxShadow(offset: Offset(0.0,5.0),
                                                        color: Colors.black,
                                                        blurRadius: 15.0,
                                                      ),
                                                    ]),
                                                    child: SizedBox(height: 30,child: Text(superherosLength['free_content'][i]['post_title'],textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontWeight:FontWeight.normal,fontSize: 12),))))*/
                                              ],
                                            ),
                                              onTap: (){
                                                setState(() {
                                                  Navigator.of(context).push(
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              InterviewNewPlayer(
                                                                  superherosLength['free_content'][i]['video_url'],superherosLength['free_content'][i]['post_title'])));
                                                });
                                              },

                                            )),
                                            Opacity(opacity: 0.7,
                                              child: Container(height: 20,width: width*0.3094,
                                                  color: Colors.black,
                                                  child: Text(superherosLength['free_content'][i]['post_title'],textAlign: TextAlign.center,style: TextStyle(color:Colors.white,),)),
                                            )
                                          ],
                                        ),
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
                                Text("PHONE INTERVIEWS",textAlign: TextAlign.start,style: TextStyle( color: Colors.white, fontSize: 15,fontFamily: 'Montserrat')),
                                GestureDetector(
                                  onTap: (){
                                    Navigator.push(context,
                                        PageTransition(type:
                                        PageTransitionType.rightToLeft, child: PhonevideoScreen()));
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
                                  for (int i = 0; i < phonesuperherosLength.length; i++)
                                    Row(
                                      children: [
                                        Column(
                                          children: [
                                            SizedBox(width: width*0.3094,height:height*0.1977,child: GestureDetector(child:
                                            Stack(
                                              children: [
                                                SizedBox.expand(
                                                  child: Container(
                                                    child: Opacity(opacity: 0.7,
                                                      child: ClipRRect(borderRadius: BorderRadius.circular(10),
                                                        child: CachedNetworkImage(
                                                          imageUrl: phonesuperherosLength[i]['feature_img'],fit: BoxFit.cover,

                                                          placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                                                          errorWidget: (context, url, error) => Icon(Icons.error),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                /*Positioned(bottom: 10,left: 20,right: 20,child: Container(decoration: BoxDecoration(
                                                    boxShadow: [
                                                      BoxShadow(offset: Offset(0.0,5.0),
                                                        color: Colors.black,
                                                        blurRadius: 15.0,
                                                      ),
                                                    ]),
                                                    child: SizedBox(height: 30,child: Text(phonesuperherosLength[i]['post_title'],textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontWeight:FontWeight.normal,fontSize: 12),))))*/
                                              ],
                                            ),
                                              onTap: (){
                                                setState(() {
                                                  Navigator.of(context).push(
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              PhoneinteviewPlayer(
                                                                  phonesuperherosLength[i]['video_url'],phonesuperherosLength[i]['post_title'])));
                                                });
                                              },
                                            )),
                                            Opacity(opacity: 0.7,
                                              child: Container(height: 20,width: width*0.3094,
                                                  color: Colors.black,
                                                  child: Text(phonesuperherosLength[i]['post_title'],textAlign: TextAlign.center,style: TextStyle(color:Colors.white,),)),
                                            )
                                          ],
                                        ),
                                        SizedBox(width: 10,),
                                      ],
                                    ),


                                ],

                              ),
                            ),
                          ),
                        ),


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
