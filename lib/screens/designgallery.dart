import 'package:sound_chat/common/index.dart';
class GalleryDesign extends StatefulWidget {
  @override
  _GalleryDesign createState() => _GalleryDesign();
}
class _GalleryDesign extends State<GalleryDesign> {
  String data;
  var superherosLength;
  int imgcount = 6;
  bool isButtonPressed = false;
  int count = 0;
  List<bool>butoncolor=[for(int i=0;i<7;i++)true];
String email,name;
  @override
  void initState() {
    super.initState();
    _loadSavedData();
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
    if(Provider.of<GalleryResponse>(context, listen: false).data!=null)
    superherosLength = Provider.of<GalleryResponse>(context, listen: false).data['data'];
    return SafeArea(
      child: Stack(
        children:[ Scaffold(
          backgroundColor: Colors.black,
          appBar: PreferredSize(preferredSize: Size.fromHeight(55),
              child: Backappbar()),
          body: (superherosLength != null)
              ? Column(
                  children: [
                    SizedBox(
                      height: height * 0.02634,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              for (int i = 0;
                                  i < superherosLength.length;
                                  i++)
                                SizedBox(
                                  height: height * 0.23706,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 10, left: 5),
                                        child: Container(
                                          width: width * 0.2137,
                                          height: height * 0.1153,
                                            child: CachedNetworkImage(
                                              imageUrl: superherosLength[i]
                                                  ['feature_img'],
                                              fit: BoxFit.cover,
                                              imageBuilder: (context, imageProvider) => CircleAvatar(
                                                radius: 50,
                                                backgroundImage: imageProvider,
                                              ),
                                              placeholder: (context, url) => Center(
                                                  child:
                                                      CircularProgressIndicator()),
                                              errorWidget: (context, url, error) =>
                                                  Icon(Icons.error),
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
                                                  superherosLength[i]
                                                  ['post_title'],
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12,
                                                fontFamily: fontfamily,
                                              ),
                                              textAlign: TextAlign.center,
                                            ))),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            imgcount = i;
                                            isButtonPressed = !isButtonPressed;
                                            butoncolor=butoncolor.asMap().entries.map((e) => e.key==i ? false:true).toList();
                                          });
                                        },
                                        child: Center(
                                            child: Text("VIEW ALBUM",
                                                style: TextStyle(
                                                  color: butoncolor[i]? Color(0xFFC66E3A):Colors.yellow,
                                                  fontSize: 12,
                                                  fontFamily: fontfamily,
                                                  fontWeight: FontWeight.bold
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
                    SizedBox(
                      height: 20,
                    ),
//                    for (int j = 0; j < superherosLength[imgcount]
//                    ['img_gallery_pic'].length; j = j + 4)
//                      SizedBox(
//                        height: 400,
//                        child: Row(
//                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                          children: [
//                            Column(
//                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                              children: [
//                                if(superherosLength[imgcount]
//                                ['img_gallery_pic'].length>j+0)
//                                GestureDetector(
//                                  onTap: () {
//                                    Navigator.of(context).push(MaterialPageRoute(
//                                        builder: (context) => FullImage(
//                                            superherosLength[imgcount]
//                                                ['img_gallery_pic'][j + 0])));
//                                  },
//                                  child: Container(
//                                    width: width * 0.3997,
//                                    height: height * 0.3023,
//                                    child: ClipRRect(
//                                      borderRadius: BorderRadius.circular(15),
//                                      child: CachedNetworkImage(
//                                        imageUrl: superherosLength[imgcount]
//                                            ['img_gallery_pic'][j + 0],
//                                        fit: BoxFit.fill,
//                                        placeholder: (context, url) => Center(
//                                            child: CircularProgressIndicator()),
//                                        errorWidget: (context, url, error) =>
//                                            Icon(Icons.error),
//                                      ),
//                                    ),
//                                    decoration: BoxDecoration(
//                                      borderRadius: BorderRadius.circular(15),
//                                      color: Colors.white,
//                                    ),
//                                  ),
//                                ),
//                                if(superherosLength[imgcount]
//                                ['img_gallery_pic'].length>j+1)
//                                GestureDetector(
//                                  onTap: () {
//                                    Navigator.of(context).push(MaterialPageRoute(
//                                        builder: (context) => FullImage(
//                                            superherosLength[imgcount]
//                                                ['img_gallery_pic'][j + 1])));
//                                  },
//                                  child: Container(
//                                    width: width * 0.3997,
//                                    height: height * 0.1393,
//                                    child: ClipRRect(
//                                      borderRadius: BorderRadius.circular(15),
//                                      child: CachedNetworkImage(
//                                        imageUrl: superherosLength[imgcount]
//                                            ['img_gallery_pic'][j + 1],
//                                        fit: BoxFit.fill,
//                                        placeholder: (context, url) => Center(
//                                            child: CircularProgressIndicator()),
//                                        errorWidget: (context, url, error) =>
//                                            Icon(Icons.error),
//                                      ),
//                                    ),
//                                    decoration: BoxDecoration(
//                                      borderRadius: BorderRadius.circular(15),
//                                      color: Colors.white,
//                                    ),
//                                  ),
//                                ),
//                              ],
//                            ),
//                            Column(
//                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                              children: [
//                                if(superherosLength[imgcount]
//                            ['img_gallery_pic'].length>j+2)
//                                GestureDetector(
//                                  onTap: () {
//                                    Navigator.of(context).push(MaterialPageRoute(
//                                        builder: (context) => FullImage(
//                                            superherosLength[imgcount]
//                                                ['img_gallery_pic'][j + 2])));
//                                  },
//                                  child: Container(
//                                    width: width * 0.3997,
//                                    height: height * 0.1393,
//                                    child: ClipRRect(
//                                      borderRadius: BorderRadius.circular(15),
//                                      child: CachedNetworkImage(
//                                        imageUrl: superherosLength[imgcount]
//                                            ['img_gallery_pic'][j + 2],
//                                        fit: BoxFit.fill,
//                                        placeholder: (context, url) => Center(
//                                            child: CircularProgressIndicator()),
//                                        errorWidget: (context, url, error) =>
//                                            Icon(Icons.error),
//                                      ),
//                                    ),
//                                    decoration: BoxDecoration(
//                                      borderRadius: BorderRadius.circular(15),
//                                      color: Colors.white,
//                                    ),
//                                  ),
//                                ),
//                                if(superherosLength[imgcount]
//                                ['img_gallery_pic'].length>j+3)
//                                GestureDetector(
//                                  onTap: () {
//                                    Navigator.of(context).push(MaterialPageRoute(
//                                        builder: (context) => FullImage(
//                                            superherosLength[imgcount]
//                                                ['img_gallery_pic'][j + 3])));
//                                  },
//                                  child: Container(
//                                    width: width * 0.3997,
//                                    height: height * 0.3023,
//                                    child: ClipRRect(
//                                      borderRadius: BorderRadius.circular(15),
//                                      child: CachedNetworkImage(
//                                        imageUrl: superherosLength[imgcount]
//                                            ['img_gallery_pic'][j + 3],
//                                        fit: BoxFit.fill,
//                                        placeholder: (context, url) => Center(
//                                            child: CircularProgressIndicator()),
//                                        errorWidget: (context, url, error) =>
//                                            Icon(Icons.error),
//                                      ),
//                                    ),
//                                    decoration: BoxDecoration(
//                                      borderRadius: BorderRadius.circular(15),
//                                      color: Colors.white,
//                                    ),
//                                  ),
//                                ),
//                              ],
//                            ),
//                          ],
//                        ),
//                      ),

                      Container(height: height*0.5,
                    child:SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children: [
                          for (int j = 0; j < superherosLength[imgcount]
                          ['img_gallery_pic'].length; j = j + 4)
                      SizedBox(
                      height:480,
                         child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  if(superherosLength[imgcount]
                                  ['img_gallery_pic'].length>j+0)
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).push(MaterialPageRoute(
                                            builder: (context) => FullImage(
                                                superherosLength[imgcount]
                                                ['img_gallery_pic'][j + 0])));
                                      },
                                      child: Container(
                                        width: width * 0.3997,
                                        height: height * 0.3023,
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(15),
                                          child: CachedNetworkImage(
                                            imageUrl: superherosLength[imgcount]
                                            ['img_gallery_pic'][j + 0],
                                            fit: BoxFit.fill,
                                            placeholder: (context, url) => Center(
                                                child: CircularProgressIndicator()),
                                            errorWidget: (context, url, error) =>
                                                Icon(Icons.error),
                                          ),
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(15),
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  if(superherosLength[imgcount]
                                  ['img_gallery_pic'].length>j+1)
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).push(MaterialPageRoute(
                                            builder: (context) => FullImage(
                                                superherosLength[imgcount]
                                                ['img_gallery_pic'][j + 1])));
                                      },
                                      child: Container(
                                        width: width * 0.3997,
                                        height: height * 0.1393,
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(15),
                                          child: CachedNetworkImage(
                                            imageUrl: superherosLength[imgcount]
                                            ['img_gallery_pic'][j + 1],
                                            fit: BoxFit.fill,
                                            placeholder: (context, url) => Center(
                                                child: CircularProgressIndicator()),
                                            errorWidget: (context, url, error) =>
                                                Icon(Icons.error),
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
                              Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  if(superherosLength[imgcount]
                                  ['img_gallery_pic'].length>j+2)
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).push(MaterialPageRoute(
                                            builder: (context) => FullImage(
                                                superherosLength[imgcount]
                                                ['img_gallery_pic'][j + 2])));
                                      },
                                      child: Container(
                                        width: width * 0.3997,
                                        height: height * 0.1393,
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(15),
                                          child: CachedNetworkImage(
                                            imageUrl: superherosLength[imgcount]
                                            ['img_gallery_pic'][j + 2],
                                            fit: BoxFit.fill,
                                            placeholder: (context, url) => Center(
                                                child: CircularProgressIndicator()),
                                            errorWidget: (context, url, error) =>
                                                Icon(Icons.error),
                                          ),
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(15),
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  if(superherosLength[imgcount]
                                  ['img_gallery_pic'].length>j+3)
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).push(MaterialPageRoute(
                                            builder: (context) => FullImage(
                                                superherosLength[imgcount]
                                                ['img_gallery_pic'][j + 3])));
                                      },
                                      child: Container(
                                        width: width * 0.3997,
                                        height: height * 0.3023,
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(15),
                                          child: CachedNetworkImage(
                                            imageUrl: superherosLength[imgcount]
                                            ['img_gallery_pic'][j + 3],
                                            fit: BoxFit.fill,
                                            placeholder: (context, url) => Center(
                                                child: CircularProgressIndicator()),
                                            errorWidget: (context, url, error) =>
                                                Icon(Icons.error),
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
                            ],
                          )),
                        ],
                      ),
                    ),)

                  ],
                )
              : Center(child: CircularProgressIndicator()),
        ),
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
      ]
      ),
    );
  }
}

class FullImage extends StatefulWidget {
  final image;
  FullImage(this.image);
  @override
  _FullImageState createState() => _FullImageState();
}

class _FullImageState extends State<FullImage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                Navigator.of(context).pop();
              },
            );
          }),
        ),
        body: Center(
          child: Container(
            child: PhotoView(
              imageProvider: CachedNetworkImageProvider(widget.image),
            ),
          ),
        ),
      ),
    );
  }
}
