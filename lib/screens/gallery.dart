import 'package:flutter/material.dart';
import 'package:sound_chat/common/index.dart';

class GalleryDesign extends StatefulWidget {
  @override
  _GalleryDesign createState() => _GalleryDesign();
}

class _GalleryDesign extends State<GalleryDesign> {
  //String data;

  int imgcount = 0;
  bool isButtonPressed = false;
  //int count = 0;
  List<bool> butoncolor = [for (int i = 0; i < 100; i++) true];
  String email, name;
  @override
  void initState() {
    super.initState();
    createGalleryState(context).then((value) {
      imgcount = value.data.data['data'].length - 1;
      butoncolor = [for (int i = 0; i <= imgcount; i++) true];
      butoncolor = butoncolor
          .asMap()
          .entries
          .map((e) => e.key == 0 ? false : true)
          .toList();
    });

    _loadSavedData();
  }

  _loadSavedData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      if (sharedPreferences.getString('email') != null &&
          sharedPreferences.getString('email').isNotEmpty) {
        email = sharedPreferences.getString('email');
        name = sharedPreferences.getString('name');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    // if (Provider.of<GalleryResponse>(context, listen: false).data != null)
    //   superherosLength =
    //       Provider.of<GalleryResponse>(context, listen: false).data['data'];
    return SafeArea(
      child: Stack(children: [
        Scaffold(
            backgroundColor: Colors.black,
            appBar: PreferredSize(
                preferredSize: Size.fromHeight(55), child: Backappbar()),
            body: FutureBuilder(
                future: createGalleryState(context),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    var superherosLength = snapshot.data.data['data'];
                    return Column(
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 10, left: 5),
                                            child: Container(
                                              width: width * 0.2137,
                                              height: height * 0.1153,
                                              child: CachedNetworkImage(
                                                imageUrl: superherosLength[i]
                                                    ['feature_img'],
                                                fit: BoxFit.cover,
                                                imageBuilder:
                                                    (context, imageProvider) =>
                                                        CircleAvatar(
                                                  radius: 50,
                                                  backgroundImage:
                                                      imageProvider,
                                                ),
                                                placeholder: (context, url) =>
                                                    Center(
                                                        child:
                                                            CircularProgressIndicator()),
                                                errorWidget:
                                                    (context, url, error) =>
                                                        Icon(Icons.error),
                                              ),
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.white),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 5),
                                            child: SizedBox(
                                                width: width * 0.30656,
                                                height: height * 0.049170,
                                                child: Center(
                                                    child: Text(
                                                  superherosLength[i]
                                                      ['post_title'],
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 10,
                                                    fontFamily: fontfamily,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ))),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                imgcount = i;
                                                isButtonPressed =
                                                    !isButtonPressed;
                                                butoncolor = butoncolor
                                                    .asMap()
                                                    .entries
                                                    .map((e) => e.key == i
                                                        ? false
                                                        : true)
                                                    .toList();
                                                print(imgcount);
                                              });
                                            },
                                            child: Center(
                                                child: Text("VIEW ALBUM",
                                                    style: TextStyle(
                                                        color: butoncolor[i]
                                                            ? Color(0xFFC66E3A)
                                                            : Colors.yellow,
                                                        fontSize: 12,
                                                        fontFamily: fontfamily,
                                                        fontWeight:
                                                            FontWeight.bold))),
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
                        Expanded(
                          child: Container(
                            //height: height * 0.5,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Column(
                                children: [
                                  for (int j = 0;
                                      j <
                                          superherosLength[imgcount]
                                                  ['img_gallery_pic']
                                              .length;
                                      j = j + 4)
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Column(
                                            // mainAxisAlignment:
                                            // MainAxisAlignment.spaceEvenly,
                                            children: [
                                              if (superherosLength[imgcount]
                                                          ['img_gallery_pic']
                                                      .length >
                                                  j + 0)
                                                GestureDetector(
                                                  onTap: () {
                                                    Navigator.of(context).push(
                                                        MaterialPageRoute(
                                                            builder:
                                                                (context) =>
                                                                    FullImage(
                                                                      images: superherosLength[
                                                                              imgcount]
                                                                          [
                                                                          'img_gallery_pic'],
                                                                      currentIndex:
                                                                          j + 0,
                                                                    )));
                                                  },
                                                  child: Container(
                                                    width: width * 0.3997,
                                                    height: height * 0.3023,
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                      child: CachedNetworkImage(
                                                        imageUrl: superherosLength[
                                                                    imgcount][
                                                                'img_gallery_pic']
                                                            [j + 0],
                                                        fit: BoxFit.cover,
                                                        placeholder: (context,
                                                                url) =>
                                                            Center(
                                                                child:
                                                                    CircularProgressIndicator()),
                                                        errorWidget: (context,
                                                                url, error) =>
                                                            Icon(Icons.error),
                                                      ),
                                                    ),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              if (superherosLength[imgcount]
                                                          ['img_gallery_pic']
                                                      .length >
                                                  j + 1)
                                                GestureDetector(
                                                  onTap: () {
                                                    Navigator.of(context).push(
                                                        MaterialPageRoute(
                                                            builder:
                                                                (context) =>
                                                                    FullImage(
                                                                      images: superherosLength[
                                                                              imgcount]
                                                                          [
                                                                          'img_gallery_pic'],
                                                                      currentIndex:
                                                                          j + 1,
                                                                    )));
                                                  },
                                                  child: Container(
                                                    width: width * 0.3997,
                                                    height: height * 0.1393,
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                      child: CachedNetworkImage(
                                                        imageUrl: superherosLength[
                                                                    imgcount][
                                                                'img_gallery_pic']
                                                            [j + 1],
                                                        fit: BoxFit.cover,
                                                        placeholder: (context,
                                                                url) =>
                                                            Center(
                                                                child:
                                                                    CircularProgressIndicator()),
                                                        errorWidget: (context,
                                                                url, error) =>
                                                            Icon(Icons.error),
                                                      ),
                                                    ),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                            ],
                                          ),
                                          Column(
                                            // mainAxisAlignment:
                                            // MainAxisAlignment.spaceEvenly,
                                            children: [
                                              if (superherosLength[imgcount]
                                                          ['img_gallery_pic']
                                                      .length >
                                                  j + 2)
                                                GestureDetector(
                                                  onTap: () {
                                                    Navigator.of(context).push(
                                                        MaterialPageRoute(
                                                            builder:
                                                                (context) =>
                                                                    FullImage(
                                                                      images: superherosLength[
                                                                              imgcount]
                                                                          [
                                                                          'img_gallery_pic'],
                                                                      currentIndex:
                                                                          j + 2,
                                                                    )));
                                                  },
                                                  child: Container(
                                                    width: width * 0.3997,
                                                    height: height * 0.1393,
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                      child: CachedNetworkImage(
                                                        imageUrl: superherosLength[
                                                                    imgcount][
                                                                'img_gallery_pic']
                                                            [j + 2],
                                                        fit: BoxFit.cover,
                                                        placeholder: (context,
                                                                url) =>
                                                            Center(
                                                                child:
                                                                    CircularProgressIndicator()),
                                                        errorWidget: (context,
                                                                url, error) =>
                                                            Icon(Icons.error),
                                                      ),
                                                    ),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              if (superherosLength[imgcount]
                                                          ['img_gallery_pic']
                                                      .length >
                                                  j + 3)
                                                GestureDetector(
                                                  onTap: () {
                                                    Navigator.of(context)
                                                        .push(MaterialPageRoute(
                                                      builder: (context) =>
                                                          FullImage(
                                                        images: superherosLength[
                                                                imgcount]
                                                            ['img_gallery_pic'],
                                                        currentIndex: j + 3,
                                                      ),
                                                    ));
                                                  },
                                                  child: Container(
                                                    width: width * 0.3997,
                                                    height: height * 0.3023,
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                      child: CachedNetworkImage(
                                                        imageUrl: superherosLength[
                                                                    imgcount][
                                                                'img_gallery_pic']
                                                            [j + 3],
                                                        fit: BoxFit.cover,
                                                        placeholder: (context,
                                                                url) =>
                                                            Center(
                                                                child:
                                                                    CircularProgressIndicator()),
                                                        errorWidget: (context,
                                                                url, error) =>
                                                            Icon(Icons.error),
                                                      ),
                                                    ),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    );
                  }
                  return Center(child: CircularProgressIndicator());
                })),
        Positioned(
          top: AppBar().preferredSize.height * 0.2,
          left: width * 0.39865,
          child: SizedBox(
            height: height * 0.12168,
            width: width * 0.21875,
            child: Image.asset(
              'assets/soundpic.png',
            ),
          ),
        ),
      ]),
    );
  }
}

class FullImage extends StatelessWidget {
  final List images;
  final int currentIndex;
  const FullImage({Key key, this.images, this.currentIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                height: height,
                initialPage: currentIndex,
                autoPlay: false,
                enlargeCenterPage: true,
                viewportFraction: 1,
                autoPlayInterval: Duration(seconds: 10),
                autoPlayAnimationDuration: Duration(seconds: 5),
              ),
              items: <Widget>[
                for (int i = 0; i < images.length; i++)
                  Container(
                    width: width,
                    height: height,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    child: PhotoView(
                      imageProvider: CachedNetworkImageProvider(images[i]),
                    ),
                  ),
              ],
            ),
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ))
          ],
        ),
      ),
    );
  }
}
