import 'package:sound_chat/common/index.dart';

class Shopping extends StatefulWidget {
  @override
  _ShoppingState createState() => _ShoppingState();
}

class _ShoppingState extends State<Shopping> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    // if (Provider.of<AllproductResponse>(context, listen: false).data != null)
    //   product =
    //       Provider.of<AllproductResponse>(context, listen: false).data['data'];
    return SafeArea(
      child: Stack(children: [
        Scaffold(
            backgroundColor: Colors.black,
            appBar: PreferredSize(
                child: ShoppAppbar(), preferredSize: Size.fromHeight(55)),
            body: FutureBuilder(
                future: createAllproductState(context),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    var product = snapshot.data.data['data'];
                    return Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Expanded(
                          child: GridView.count(
                            crossAxisCount: 2,
                            primary: false,
                            childAspectRatio: 450 / 650,
                            // padding: const EdgeInsets.all(16),
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            children: <Widget>[
                              for (int i = 0; i < product.length; i++)
//                        for (int j = 0; j <product[i]['images'].length; j++)
                                GestureDetector(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Container(
                                      color: Color(0xFF222222),
                                      padding: EdgeInsets.only(bottom: 5),
                                      child: Column(
                                        children: [
                                          Expanded(
                                            child: Container(
                                              child: Opacity(
                                                opacity: 1,
                                                child: CachedNetworkImage(
                                                  imageUrl: product[i]['image'],
                                                  fit: BoxFit.cover,
                                                  placeholder: (context, url) =>
                                                      Center(
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
                                            child: Text(
                                              product[i]['title'].toString(),
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: fontfamily,
                                                fontSize: 16,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            "\$" +
                                                product[i]['Price'].toString(),
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: fontfamily,
                                              fontSize: 18,
                                            ),
                                          ),
                                          // Container(color: Color(0xFFdd0e34),height: 30,width: 120,
                                          //   child: Center(child: Text("Select Options",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
                                          // )
                                        ],
                                      ),
                                    ),
                                  ),
                                  onTap: () {
                                    //Navigator.of(context).push(
                                    //  MaterialPageRoute(builder: (context) => ShopProductdetails(product[i])));
                                    Navigator.push(
                                        context,
                                        PageTransition(
                                            type: PageTransitionType
                                                .rightToLeftWithFade,
                                            child: ShopProductdetails(
                                                product[i])));
                                  },
                                ),
                            ],
                          ),
                        ),
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
