import 'package:sound_chat/common/index.dart';
import 'package:http/http.dart' as http;

class GalleryDesign extends StatefulWidget {
  @override
  _GalleryDesign createState() => _GalleryDesign();
}

class _GalleryDesign extends State<GalleryDesign> {
  String data;
  var superherosLength;
  int day = 6;
  bool isButtonPressed = false;
  int count = 0;
  List<bool> buttoncolor = [false, false, false, false, false, false, false];

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    http.Response response = await http.get(
        "https://mintok.com/soundchat/wp-json/gallery/v2/?post_type=aigpl_gallery");
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
      body: (superherosLength != null)
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
                          for (int i = 0;
                              i < jsonDecode(data)['data'].length;
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
                                      width: width * 0.2037,
                                      height: height * 0.1053,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(50),
                                        child: CachedNetworkImage(
                                          imageUrl: jsonDecode(data)['data'][i]
                                              ['featured_img'],
                                          fit: BoxFit.fill,
                                          placeholder: (context, url) => Center(
                                              child:
                                                  CircularProgressIndicator()),
                                          errorWidget: (context, url, error) =>
                                              Icon(Icons.error),
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
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        day = i;
                                        isButtonPressed = !isButtonPressed;
                                        buttoncolor[i] = !buttoncolor[i];
                                      });
                                    },
                                    child: Center(
                                        child: Text("VIEW ALBUM",
                                            style: TextStyle(
                                              color: buttoncolor[i]
                                                  ? Colors.yellow
                                                  : Color(0xFFC66E3A),
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
                SizedBox(
                  height: 20,
                ),
                for (int j = 0; j < 16; j = j + 4)
                  SizedBox(
                    height: 400,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => FullImage(
                                        jsonDecode(data)['data'][day]
                                            ['img_gallery_pic'][j + 0])));
                              },
                              child: Container(
                                width: width * 0.3997,
                                height: height * 0.3023,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: CachedNetworkImage(
                                    imageUrl: jsonDecode(data)['data'][day]
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
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => FullImage(
                                        jsonDecode(data)['data'][day]
                                            ['img_gallery_pic'][j + 1])));
                              },
                              child: Container(
                                width: width * 0.3997,
                                height: height * 0.1393,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: CachedNetworkImage(
                                    imageUrl: jsonDecode(data)['data'][day]
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
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => FullImage(
                                        jsonDecode(data)['data'][day]
                                            ['img_gallery_pic'][j + 2])));
                              },
                              child: Container(
                                width: width * 0.3997,
                                height: height * 0.1393,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: CachedNetworkImage(
                                    imageUrl: jsonDecode(data)['data'][day]
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
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => FullImage(
                                        jsonDecode(data)['data'][day]
                                            ['img_gallery_pic'][j + 3])));
                              },
                              child: Container(
                                width: width * 0.3997,
                                height: height * 0.3023,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: CachedNetworkImage(
                                    imageUrl: jsonDecode(data)['data'][day]
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
                    ),
                  )
              ],
            )
          : Center(child: CircularProgressIndicator()),
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
    );
  }
}
