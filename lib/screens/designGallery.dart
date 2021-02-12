import 'package:sound_chat/common/index.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      home: gallerydesign(),
    );
  }
}

class gallerydesign extends StatefulWidget {
  @override
  _gallerydesigndesign createState() => _gallerydesigndesign();
}

class _gallerydesigndesign extends State<gallerydesign> {
  String data;
  var superheros_length;
  int day = 6;
  bool isButtonPressed = false;
int count=0;

List<bool>butoncolor=[false,false,false,false,false,false,false];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  void getData() async {
    http.Response response = await http.get(
        "https://mintok.com/soundchat/wp-json/gallery/v2/?post_type=aigpl_gallery");
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
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Gallery"),
        backgroundColor: Color(0xFFE18D13),
        leading: Builder(
            builder: (BuildContext context){
              return IconButton(
                icon: Icon(Icons.arrow_back_rounded,color: Colors.white,size: 25,),
                onPressed: () {
                  //Navigator.of(context).push(MaterialPageRoute(builder: (context)=>NewMenuscreen()));
                  Navigator.of(context).pop();
                },
              );
            }),
        // title: Text("Flutter App"),
        // actions: <Widget>[
        //   IconButton(
        //     icon: Image.asset(
        //       'assets/search.png',
        //       color: Color(0xFFE18D13),
        //       scale: 2,
        //     ),
        //     onPressed: () {},
        //   ),
        // ],
      ),
      body: (superheros_length != null)
          ? ListView(
              children: [
                Column(
                  children: [
                    SizedBox(
                      child: Image.asset(
                        'assets/soundbk.png',
                        fit: BoxFit.fitWidth,
                      ),
                      height: height * 0.2002,
                      width: width * 1.018,
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.02634,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Column(
                    children: [
                      Row(
                              children: [
                                for (int i = 0; i < jsonDecode(data)['data'].length; i++)
                                  //  for (int j = 0; j < jsonDecode(data)['data'][i]['shows'].length; j++)
                                  SizedBox(
                                    height: height * 0.23706,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 10, left: 5),
                                          child: Container(
                                            width: width * 0.2037,
                                            height: height * 0.1053,
                                            child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                                // child: Image.network(
                                                //   jsonDecode(data)['data'][i]
                                                //       ['featured_img'],
                                                //   fit: BoxFit.fill,
                                                // )
                                              child:   CachedNetworkImage(
                                                imageUrl:  jsonDecode(data)['data'][i]['featured_img'],fit: BoxFit.fill,
                                                placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                                                errorWidget: (context, url, error) => Icon(Icons.error),
                                              ),


                                            ),



                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.white),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(top: 10),
                                          child: SizedBox(
                                              width: width * 0.30656,
                                              height: height * 0.049170,
                                              child: Center(
                                                  child: Text(
                                                jsonDecode(data)['data'][i]
                                                    ['post_title'],
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14,
                                                  fontStyle: FontStyle.italic,
                                                ),
                                                textAlign: TextAlign.center,
                                              ))),
                                        ),
                                        // GestureDetector(
                                        //   child: Text(
                                        //     "VIEW ALBUM",
                                        //     style: TextStyle(
                                        //       color: Color(0xFFE18D13),
                                        //       fontSize: 12,
                                        //       fontStyle: FontStyle.italic,
                                        //     ),
                                        //   ),
                                        //   onTap: () => Navigator.pushReplacement(
                                        //     context,
                                        //     MaterialPageRoute(
                                        //         builder: (context) => Allimages(
                                        //             images: jsonDecode(data)['data']
                                        //                 [i]['img_gallery_pic'])),
                                        //   ),
                                        // ),

                                        GestureDetector(
                                          onTap: (){
                                            setState(() {
                                              day=i;
                                              isButtonPressed=!isButtonPressed;
                                              butoncolor[i]=!butoncolor[i];
                                              // day=count;
                                              // count=count+4;
                                            });
                                          },
                                          child: Center(
                                              child: Text("VIEW ALBUM",
                                                  style: TextStyle(
                                                    color: butoncolor[i]? Colors.yellow:Color(0xFFC66E3A),

                                                    fontSize: 12,
                                                  ))),
                                        ),

                                      ],
                                    ),
                                  ),
                              ],
                            ),

                    ],
                  ),


                ),
                SizedBox(height: 20,),
                for (int j = 0; j<16; j=j+4)
                  /*Column(
                    children: [
                      Container(height: 250,width: 385,child: Image.network(jsonDecode(data)['data'][day]['img_gallery_pic'][j],fit: BoxFit.fill,),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 2)),
                      ),
                    ],
                  ),*/
                SizedBox(height: 400,
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                       GestureDetector(onTap: (){
                         Navigator.of(context).push(MaterialPageRoute(builder: (context)=>fullimage(jsonDecode(data)['data'][day]['img_gallery_pic'][j+0])));
                       },

                         child: Container(width: width * 0.3997,
                             height: height * 0.3023,child: ClipRRect(borderRadius: BorderRadius.circular(15),
                               //child: Image.network(jsonDecode(data)['data'][day]['img_gallery_pic'][j+0],fit: BoxFit.fill,)
                             child:CachedNetworkImage(
                               imageUrl: jsonDecode(data)['data'][day]['img_gallery_pic'][j+0],fit: BoxFit.fill,
                               placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                               errorWidget: (context, url, error) => Icon(Icons.error),
                             ),

                           ),
                           decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(15),
                             color: Colors.white,
                           ),

                         ),
                       ),

                          GestureDetector(
                            onTap: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>fullimage(jsonDecode(data)['data'][day]['img_gallery_pic'][j+1])));
                            },
                            child: Container(width: width * 0.3997,
                                height: height * 0.1393,child: ClipRRect(borderRadius: BorderRadius.circular(15),
                                 // child: Image.network(jsonDecode(data)['data'][day]['img_gallery_pic'][j+1],fit: BoxFit.fill,)
                                child:CachedNetworkImage(
                                  imageUrl:  jsonDecode(data)['data'][day]['img_gallery_pic'][j+1],fit: BoxFit.fill,
                                  placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                                  errorWidget: (context, url, error) => Icon(Icons.error),
                                ),
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>fullimage(jsonDecode(data)['data'][day]['img_gallery_pic'][j+2])));
                            },
                            child: Container(width: width * 0.3997,
                                height: height * 0.1393,child: ClipRRect(borderRadius: BorderRadius.circular(15),
                                  //child: Image.network(jsonDecode(data)['data'][day]['img_gallery_pic'][j+2],fit: BoxFit.fill,)
                                child:CachedNetworkImage(
                                  imageUrl:  jsonDecode(data)['data'][day]['img_gallery_pic'][j+2],fit: BoxFit.fill,
                                  placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                                  errorWidget: (context, url, error) => Icon(Icons.error),
                                ),
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.white,
                              ),),
                          ),

                          GestureDetector(onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>fullimage(jsonDecode(data)['data'][day]['img_gallery_pic'][j+3])));
                          },
                            child: Container(width: width * 0.3997,
                                height: height * 0.3023,child: ClipRRect(borderRadius: BorderRadius.circular(15),
                                 // child: Image.network(jsonDecode(data)['data'][day]['img_gallery_pic'][j+3],fit: BoxFit.fill,)
                                child:CachedNetworkImage(
                                  imageUrl:  jsonDecode(data)['data'][day]['img_gallery_pic'][j+3],fit: BoxFit.fill,
                                  placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                                  errorWidget: (context, url, error) => Icon(Icons.error),
                                ),
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.white,
                              ),),
                          ),
                        ],
                      ),
                    ],
                  ),
                )



               // Allimages(images: jsonDecode(data)['data'][0]['img_gallery_pic']),
              ],
            )
          : Center(child: CircularProgressIndicator()),
    );
  }
}

class fullimage extends StatefulWidget {
  fullimage(this.image);
  final image;
  @override
  _FullState createState() => _FullState();

}


class _FullState extends State<fullimage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text("Gallery"),
          backgroundColor: Color(0xFFE18D13),
          leading: Builder(builder: (BuildContext context) {
            return IconButton(
              icon: Icon(
                Icons.arrow_back_rounded,
                color: Colors.white,
                size: 25,
              ),
              onPressed: () {
                // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>NewMenuscreen()));
                Navigator.of(context).pop();
              },
            );
          }),
        ),
        body: Center(
          child: Container(
            child: PhotoView(
              imageProvider:
              CachedNetworkImageProvider(widget.image),
            )

          ),
        ));
  }
}


