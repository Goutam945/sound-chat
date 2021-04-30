//import 'package:sound_chat/api/search_api.dart';
//import 'package:sound_chat/common/index.dart';
//import 'package:sound_chat/screens/ShopProductdetails.dart';
//class Searchbar extends StatefulWidget {
//  @override
//  _SearchbarState createState() => _SearchbarState();
//}
//
//class _SearchbarState extends State<Searchbar> {
//  final TextEditingController _search = TextEditingController();
////  final void Function(String) onTextChange;
////  SearchBar({ this.onTextChange });
//  var product;
//  var post;
//  var gallery;
//  int imgcount = 6;
//  @override
//  Widget build(BuildContext context) {
//    double width = MediaQuery.of(context).size.width;
//    double height = MediaQuery.of(context).size.height;
//    if (Provider.of<SearchResponse>(context, listen: false).data != null)
//     {
//       product =Provider.of<SearchResponse>(context, listen: false).data['data']['product'];
//        post =Provider.of<SearchResponse>(context, listen: false).data['data']['post'];
//       gallery =Provider.of<SearchResponse>(context, listen: false).data['data']['gallery'];
//        print(product.length);
//     }
//    return SafeArea(child:
//      Scaffold(appBar: AppBar( backgroundColor: Color(0xFFE18D13),title: TextFormField(style: TextStyle(color: Colors.white),
//              controller: _search,
//              // onChanged: onTextChange,
//              decoration: InputDecoration(
//                  //fillColor: Colors.black.withOpacity(0.1),
//                 // filled: true,
//                  suffixIcon: IconButton(icon: Icon(Icons.search),color: Colors.white,onPressed: (){
//                    createSearchState(_search.text,context);
//                  }),
//                  hintText: 'Search something ...',hintStyle: TextStyle(color: Colors.white),
//                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
//                  contentPadding: EdgeInsets.zero
//              )
//          )),
//        body:(product != null && gallery!=null )? Column(
//          children: [
//            SizedBox(height: 10,),
//            if(product.length!=0)
//            Expanded(
//              child: GridView.count(
//                crossAxisCount: 2,
//                primary: false,
//                childAspectRatio: 300 / 500,
//                // padding: const EdgeInsets.all(16),
//                crossAxisSpacing: 10,
//                mainAxisSpacing: 10,
//                children: <Widget>[
//                  for (int i = 0; i < product.length; i++)
////                        for (int j = 0; j <product[i]['images'].length; j++)
//                    GestureDetector(
//                      child: Container(color:Colors.white ,padding: EdgeInsets.only(bottom: 5),
//                        child: Column(
//                          children: [
//                            Expanded(
//                              child: Container(
//                                child: Opacity(
//                                  opacity: 1,
//                                  child: CachedNetworkImage(
//                                    imageUrl:product[i]['images'][0]['src'],
//                                    fit: BoxFit.cover,
//                                    placeholder: (context, url) => Center(
//                                        child: CircularProgressIndicator()),
//                                    errorWidget: (context, url, error) =>
//                                        Icon(Icons.error),
//                                  ),
//                                ),
//                              ),
//                            ),
//                            SizedBox(height: 20,
//                              child: Text(product[i]['name'],
//                                style: TextStyle(
//                                  color: Colors.black,
//                                  fontWeight: FontWeight.normal,
//                                  fontSize: 15,
//                                ),
//                              ),
//                            ),
//                            Text("\$"+product[i]['price'],
//                              style: TextStyle(
//                                color: Colors.red,
//                                fontWeight: FontWeight.normal,
//                                fontSize: 15,
//                              ),
//                            ),
//                            Container(color: Color(0xFFdd0e34),height: 30,width: 120,
//                              child: Center(child: Text("Select Options",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
//                            )
//                          ],
//                        ),
//                      ),
//                      onTap: () {
//                        Navigator.of(context).push(
//                            MaterialPageRoute(builder: (context) => ShopProductdetails(product[i])));
//                      },
//                    ),
//                ],
//              ),
//            ),
//           /* if(post.length!=0)
//            Expanded(
//          child:  ListView.builder(itemCount: post.length,itemBuilder: (context,index){
//              return ListTile(
//                title: Text(post[index]['post_title']),
//              );
//            })),*/
//            if(gallery.length!=0)
//            Expanded(
//              child: GridView.count(
//                crossAxisCount: 4,
//                primary: false,
//                childAspectRatio: 300 / 500,
//                // padding: const EdgeInsets.all(16),
//                crossAxisSpacing: 10,
//                mainAxisSpacing: 10,
//                children: <Widget>[
//                  for (int i = 0; i < gallery['img_gallery_pic'].length; i++)
////                        for (int j = 0; j <product[i]['images'].length; j++)
//                    GestureDetector(
//                      child: Container(color:Colors.white ,padding: EdgeInsets.only(bottom: 5),
//                        child: Column(
//                          children: [
//                            Expanded(
//                              child: Container(
//                                child: Opacity(
//                                  opacity: 1,
//                                  child: CachedNetworkImage(
//                                    imageUrl:gallery['img_gallery_pic'][i],
//                                    fit: BoxFit.cover,
//                                    placeholder: (context, url) => Center(
//                                        child: CircularProgressIndicator()),
//                                    errorWidget: (context, url, error) =>
//                                        Icon(Icons.error),
//                                  ),
//                                ),
//                              ),
//                            ),
//                          ],
//                        ),
//                      ),
//                      onTap: () {
//                        Navigator.of(context).push(
//                            MaterialPageRoute(builder: (context) => FullImage(gallery['img_gallery_pic'][i])));
//                      },
//                    ),
//                ],
//              ),
//            ),
//
//          ],
//        ):Center(child: Text("")),
//    ),);
//  }
//}
import 'package:sound_chat/api/search_api.dart';
import 'package:sound_chat/common/index.dart';
import 'package:sound_chat/common/searchinterviewplay.dart';
import 'package:sound_chat/screens/ShopProductdetails.dart';

class Searchbar extends StatefulWidget {
  @override
  _SearchbarState createState() => _SearchbarState();
}

class _SearchbarState extends State<Searchbar> {
  final TextEditingController _search = TextEditingController();
  List product = [];
  List post = [];
  List video = [];
  dynamic gallery;
  bool loader=false;

  @override
  Widget build(BuildContext context) {
    Map data = Provider.of<SearchResponse>(context, listen: false).data;
    if (data != null) {
      product = data['data']['product'];
      post = data['data']['post'];
      video = data['data']['video'];
      gallery = data['data']['gallery'];
    }
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Color(0xFFE18D13),
          title: TextFormField(
              style: TextStyle(color: Colors.white),
              controller: _search,
              decoration: InputDecoration(
                  suffixIcon: IconButton(
                      icon: Icon(Icons.search),
                      color: Colors.white,
                      onPressed: () {
                        //createSearchState(_search.text, context);
                        setState(() {
                          loader=true;
                        });
                        createSearchState(_search.text, context).whenComplete(() {
                        setState(() {
                        loader=false;
                        });
                        });
                      }),
                  hintText: 'Search something ...',
                  hintStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none),
                  contentPadding: EdgeInsets.zero)),
        ),
        body: (data != null)
            ? ListView(
          children: [if(loader)Center(child: CircularProgressIndicator(),),
            if (product != null)
              if (product.length != 0)
//                Container(
//                  margin: const EdgeInsets.symmetric(vertical: 20),
//                  padding: EdgeInsets.all(10),
//                  color: Colors.red,
//                  child: Text(
//                    'Products',
//                    style: TextStyle(
//                        fontWeight: FontWeight.bold, color: Colors.white),
//                  ),
//                ),
                SizedBox(height: 10,),
            if (product != null)
              if (product.length != 0)
                GridView.count(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  primary: false,
                  childAspectRatio: 300 / 500,
                  // padding: const EdgeInsets.all(16),
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  children: <Widget>[
                    for (int i = 0; i < product.length; i++)
//                        for (int j = 0; j <product[i]['images'].length; j++)
                      GestureDetector(
                        child: Container(
                          color: Colors.white,
                          padding: EdgeInsets.only(bottom: 5),
                          child: Column(
                            children: [
                              Expanded(
                                child: Container(
                                  child: Opacity(
                                    opacity: 1,
                                    child: CachedNetworkImage(
                                      imageUrl: product[i]['images'][0]
                                      ['src'],
                                      fit: BoxFit.cover,
                                      placeholder: (context, url) => Center(
                                          child:
                                          CircularProgressIndicator()),
                                      errorWidget:
                                          (context, url, error) =>
                                          Icon(Icons.error),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                                child: Text(
                                  product[i]['name'],
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                              Text(
                                "\$" + product[i]['price'],
                                style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 15,
                                ),
                              ),
                              Container(
                                color: Color(0xFFdd0e34),
                                height: 30,
                                width: 120,
                                child: Center(
                                    child: Text(
                                      "Select Options",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    )),
                              )
                            ],
                          ),
                        ),
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  ShopProductdetails(product[i])));
                        },
                      ),
                  ],
                ),
            if (post != null)
              if (post.length != 0)
                SizedBox(height: 10,),
//                Container(
//                  margin: const EdgeInsets.symmetric(vertical: 20),
//                  padding: EdgeInsets.all(10),
//                  color: Colors.red,
//                  child: Text(
//                    'Posts',
//                    style: TextStyle(
//                        fontWeight: FontWeight.bold, color: Colors.white),
//                  ),
//                ),
            /*if (post != null)
              if (post.length != 0)
                GridView.count(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  crossAxisCount: 3,
                  primary: false,
                  childAspectRatio: 1,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  children: <Widget>[
                    for (int i = 0; i < post.length; i++)
                      GestureDetector(
                        child: (post[i]['post_type'] == 'qtvideo')
                            ? Stack(
                          children: [
                            Positioned(
                              top: 0,
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Opacity(
                                opacity: 0.8,
                                child: CachedNetworkImage(
                                  imageUrl: post[i]['featured_img'],
                                  fit: BoxFit.fill,
                                  placeholder: (context, url) => Center(
                                      child:
                                      CircularProgressIndicator()),
                                  errorWidget:
                                      (context, url, error) =>
                                      Icon(Icons.error),
                                ),
                              ),
                            ),
                            Center(
                              child: Icon(
                                Icons.play_arrow_sharp,
                                size: 40,
                                color: Colors.white,
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
                                child: SizedBox(height:30,child: Text( post[i]['post_name'],
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.white,fontWeight:FontWeight.normal,fontSize: 12),))))
                          ],
                        )
                            : Container(
                            color: Colors.white,
                            padding: EdgeInsets.only(bottom: 5),
                            child: Center(
                              child: Text(post[i]['post_title']),
                            )),
                        onTap: () {
                          if (post[i]['post_type'] == 'qtvideo')
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => YoutubePlayer1(
                                    post[i]['free_video_url'], null)));
                        },
                      ),
                  ],
                ),*/
            if (gallery != null)
              if (gallery.length != 0)
//                Container(
//                  margin: const EdgeInsets.symmetric(vertical: 20),
//                  padding: EdgeInsets.all(10),
//                  color: Colors.red,
//                  child: Text(
//                    'Gallery',
//                    style: TextStyle(
//                        fontWeight: FontWeight.bold, color: Colors.white),
//                  ),
//                ),
            if (gallery != null)
              if (gallery.length != 0)
                GridView.count(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  crossAxisCount: 3,
                  primary: false,
                  childAspectRatio: 1,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  children: <Widget>[
                    for (int i = 0;
                    i < gallery['img_gallery_pic'].length;
                    i++)
                      GestureDetector(
                        child: CachedNetworkImage(
                          imageUrl: gallery['img_gallery_pic'][i],
                          fit: BoxFit.fill,
                          placeholder: (context, url) =>
                              Center(child: CircularProgressIndicator()),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        ),
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => GallerySlider(
                                  gallery['img_gallery_pic'], i)));
                        },
                      ),
                  ],
                ),
            if (video != null)
              if (video.length != 0)
//                Container(
//                  margin: const EdgeInsets.symmetric(vertical: 20),
//                  padding: EdgeInsets.all(10),
//                  color: Colors.red,
//                  child: Text(
//                    'Videos',
//                    style: TextStyle(
//                        fontWeight: FontWeight.bold, color: Colors.white),
//                  ),
//                ),
            if (video != null)
              if (video.length != 0)
                GridView.count(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  crossAxisCount: 3,
                  primary: false,
                  childAspectRatio: 1,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  children: <Widget>[
                    for (int i = 0; i < video.length; i++)
                      GestureDetector(
                        child: (post[i]['post_type'] == 'qtvideo')
                            ? Stack(
                          children: [
                            Positioned(
                              top: 0,
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Opacity(
                                opacity: 0.8,
                                child: CachedNetworkImage(
                                  imageUrl: video[i]['featured_img'],
                                  fit: BoxFit.fill,
                                  placeholder: (context, url) => Center(
                                      child:
                                      CircularProgressIndicator()),
                                  errorWidget:
                                      (context, url, error) =>
                                      Icon(Icons.error),
                                ),
                              ),
                            ),
                            Center(
                              child: Icon(
                                Icons.play_arrow_sharp,
                                size: 40,
                                color: Colors.white,
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
                                child: SizedBox(height:30,child: Text( video[i]['post_name'],
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.white,fontWeight:FontWeight.normal,fontSize: 12),))))
                          ],
                        )
                            : Container(
                            color: Colors.white,
                            padding: EdgeInsets.only(bottom: 5),
                            child: Center(
                              child: Text(video[i]['post_title']),
                            )),
                        onTap: () {
                          if (video[i]['post_type'] == 'qtvideo')
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => SearchinterviewNewPlayer(
                                    video[i]['free_video_url'],video[i]['post_title'])));
                        },
                      ),
                  ],
                ),
          ],
        )
            : Center(child: Text("")),
      ),

    );
  }
}

class GallerySlider extends StatelessWidget {
  final images;
  final initialPage;

  GallerySlider(this.images, this.initialPage);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
          child: CarouselSlider(
            options: CarouselOptions(
                initialPage: initialPage,
                aspectRatio: 1,
                enlargeCenterPage: true,
                viewportFraction: 1),
            items: [
              for (String i in images)
                PhotoView(
                  imageProvider: NetworkImage(i),
                )
              // CachedNetworkImage(
              //   imageUrl: i,
              //   placeholder: (context, url) => Center(
              //       child: CircularProgressIndicator()),
              //   errorWidget: (context, url, error) =>
              //       Icon(Icons.error),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

class YoutubePlayer1 extends StatefulWidget {
  final videoURL;
  final ontap;

  @override
  _YoutubePlayer1State createState() => _YoutubePlayer1State();

  YoutubePlayer1(this.videoURL, this.ontap);
}

class _YoutubePlayer1State extends State<YoutubePlayer1> {
  YoutubePlayerController _controller;

  @override
  void initState() {
    _controller = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(widget.videoURL),
        flags: YoutubePlayerFlags());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: YoutubePlayerBuilder(
            onEnterFullScreen: widget.ontap,
            onExitFullScreen: widget.ontap,
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
        ),
      ),
    );
  }
}
