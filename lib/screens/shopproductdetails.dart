import 'package:sound_chat/common/checkproduct_stock.dart';
import 'package:sound_chat/common/index.dart';

class ShopProductdetails extends StatefulWidget {
  final product;
  ShopProductdetails(this.product);
  @override
  _ShopProductdetailsState createState() => _ShopProductdetailsState();
}

class _ShopProductdetailsState extends State<ShopProductdetails> {
  @override
  void initState() {
    super.initState();
    list = widget.product['productavailabilities'];
    getSize();
  }

  getSize() {
    for (int i = 0; i < widget.product['productavailabilities'].length; i++) {
      String size = widget.product['productavailabilities'][i]['size'];
      if (!sizes.contains(size)) sizes.add(size);
    }
    for (int i = 0; i < widget.product['productavailabilities'].length; i++) {
      String color = widget.product['productavailabilities'][i]['color'];
      if (!colors.contains(color)) colors.add(color);
    }
    setState(() {
      dropdownColor = colors.first;
      dropdownSize = sizes.first;
      stock = list.first['avaibility'];
    });
  }

  ProductModellist cart;
  int _itemCount = 1;
  String dropdownColor = 'Select Color';
  String dropdownSize = 'Select Size';

  List<bool> butoncolor = [for (int i = 0; i < 4; i++) true];
  bool itemFound = false;
  var countprice;
  List<String> sizes = [];
  List<String> colors = [];

  int productId;
  int stock = 0;
  List list = [];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    cart = context.watch<ProductModellist>();
    return SafeArea(
      child: Stack(children: [
        Scaffold(
            backgroundColor: Colors.black,
            appBar: PreferredSize(
                child: ShoppAppbar(), preferredSize: Size.fromHeight(55)),
            floatingActionButton: FloatingActionButton(
                backgroundColor: themeColor,
                onPressed: () {
                  int indexOfMatchedItem = cart.cart1
                      .indexWhere((product) => product.productId == productId);
                  print(indexOfMatchedItem);
                  if (indexOfMatchedItem != -1 && stock != 0) {
                    //increase quantity of product
                    checkProductStock(
                            context: context,
                            quantity: cart.cart1[indexOfMatchedItem].quantity,
                            stock: stock)
                        .then((value) {
                      if (value) {
                        setState(() {
                          cart.cart1[indexOfMatchedItem].quantity++;
                          countprice = cart.cart1[indexOfMatchedItem].price;
                          countprice = cart.cart1[indexOfMatchedItem].price +
                              cart.cart1[indexOfMatchedItem]
                                  .price; //price coutnt in plus
                          cart.sum1 =
                              cart.sum1 + cart.cart1[indexOfMatchedItem].price;
                          Toast.show("Added to cart", context,
                              duration: Toast.LENGTH_SHORT,
                              gravity: Toast.BOTTOM);
                        });
                      }
                    });
                  } else {
                    //add item to cart because item is not in the cart
                    if (dropdownSize != "Select Size" &&
                        dropdownColor != "Select Color" &&
                        stock != 0) //endd*/
                    {
                      Vibration.vibrate();
                      cart.add1(
                          widget.product['title'],
                          double.parse(widget.product['Price']),
                          dropdownSize,
                          dropdownColor,
                          _itemCount,
                          widget.product['id'],
                          widget.product['image'],
                          productId,
                          stock,
                          context);
                      Toast.show("Added to cart", context,
                          duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
                    } else {
                      outOfStockDialog(context: context, stock: stock);
                    }
                  }

                  // for (int i = 0; i < cart.cart1.length; i++)

                  //   // if (cart.cart1.length >= 1 &&
                  //   //     widget.product == cart.cart1[i].id &&
                  //   //     dropdownSize == cart.cart1[i].size &&
                  //   //     dropdownColor == cart.cart1[i].color)
                  //   if (cart.cart1.length >= 1 &&
                  //       cart.cart1[i].productId == productId)
                  //     // checkProductStock(
                  //     //         context: context,
                  //     //         quantity: cart.cart1[i].quantity,
                  //     //         stock: cart.cart1[i].stock)
                  //     //     .then((value) {
                  //     //   if (value) {

                  //     //   }
                  //     // });
                  //     setState(() {
                  //       itemFound = true;
                  //       cart.cart1[i].quantity++;
                  //       countprice = cart.cart1[i].price;
                  //       countprice = cart.cart1[i].price +
                  //           cart.cart1[i].price; //price coutnt in plus
                  //       cart.sum1 = cart.sum1 + cart.cart1[i].price;
                  //     });
                  //   else {
                  //     setState(() {
                  //       itemFound = false;
                  //     });
                  //   }
                  // if (!itemFound &&
                  //     dropdownSize != "Select Size" &&
                  //     dropdownColor != "Select Color" &&
                  //     stock != 0) //endd*/
                  // {
                  //   Vibration.vibrate();
                  //   cart.add1(
                  //       widget.product['title'],
                  //       double.parse(widget.product['Price']),
                  //       dropdownSize,
                  //       dropdownColor,
                  //       _itemCount,
                  //       widget.product['id'],
                  //       widget.product['image'],
                  //       productId,
                  //       stock,
                  //       context);
                  //   Toast.show("Added to cart", context,
                  //       duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
                  // }
                  // print(cart.cart1.length.toString());
                },
                child: Icon(Icons.shopping_cart)),
            // bottomNavigationBar: Container(
            //   height: 46,
            //   child: Row(
            //     children: <Widget>[
            //       Expanded(
            //         child: Container(
            //           alignment: Alignment.center,
            //           decoration: BoxDecoration(
            //             gradient: LinearGradient(
            //               colors: [Color(0xFFE18D13), Colors.orange],
            //               begin: FractionalOffset.centerLeft,
            //               end: FractionalOffset.centerRight,
            //             ),
            //           ),
            //           child: TextButton(
            //             onPressed: () {
            //               Vibration.vibrate();
            //               ProductModellist product = ProductModellist(
            //                   widget.product['title'],
            //                   dropdownColor,
            //                   double.parse(widget.product['Price']),
            //                   dropdownSize,
            //                   _itemCount,
            //                   widget.product['id'],
            //                   widget.product['image']);
            //               // cart.cart1.forEach((element) {
            //               //   //element.productId==productId
            //               //   print("PPP" + element.productId.toString());
            //               // });

            //               for (int i = 0; i < cart.cart1.length; i++)

            //                 // if (cart.cart1.length >= 1 &&
            //                 //     widget.product == cart.cart1[i].id &&
            //                 //     dropdownSize == cart.cart1[i].size &&
            //                 //     dropdownColor == cart.cart1[i].color)
            //                 if (cart.cart1.length >= 1 &&
            //                     cart.cart1[i].productId == productId)
            //                   setState(() {
            //                     itemFound = true;
            //                     cart.cart1[i].quantity++;
            //                     countprice = cart.cart1[i].price;
            //                     countprice = cart.cart1[i].price +
            //                         cart.cart1[i].price; //price coutnt in plus
            //                     cart.sum1 = cart.sum1 + cart.cart1[i].price;
            //                   });
            //                 else {
            //                   setState(() {
            //                     itemFound = false;
            //                   });
            //                 }
            //               if (!itemFound &&
            //                   dropdownSize != "Select Size" &&
            //                   dropdownColor != "Select Color" &&
            //                   stock != 0) //endd*/
            //               {
            //                 cart.add1(
            //                     widget.product['title'],
            //                     double.parse(widget.product['Price']),
            //                     dropdownSize,
            //                     dropdownColor,
            //                     _itemCount,
            //                     widget.product['id'],
            //                     widget.product['image'],
            //                     productId,
            //                     stock,
            //                     context);
            //                 Toast.show("Added to cart", context,
            //                     duration: Toast.LENGTH_SHORT,
            //                     gravity: Toast.BOTTOM);
            //               }
            //               // print(cart.cart1.length.toString());
            //             },
            //             child: Text(
            //               'Add to Cart',
            //               style: TextStyle(fontSize: 15, color: Colors.white),
            //             ),
            //           ),
            //         ),
            //       ),
            //       Expanded(
            //         child: Container(
            //           alignment: Alignment.center,
            //           decoration: BoxDecoration(
            //             gradient: LinearGradient(
            //               colors: [Color(0xFF780001), Color(0xFF780001)],
            //               begin: FractionalOffset.centerLeft,
            //               end: FractionalOffset.centerRight,
            //             ),
            //           ),
            //           child: TextButton(
            //             onPressed: () {
            //               Vibration.vibrate();
            //               /* Provider.of<ProductModellist>(context, listen: false)
            //                   .addbuynow(
            //                       widget.product['title'],
            //                       double.parse(widget.product['Price']),
            //                       dropdownSize,
            //                       dropdownColor,
            //                       _itemCount,
            //                       widget.product['id'],
            //                       widget.product['image'],
            //                       productId,
            //                       context);*/
            //               ProductModellist product = ProductModellist(
            //                   widget.product['title'],
            //                   dropdownColor,
            //                   double.parse(widget.product['Price']),
            //                   dropdownSize,
            //                   _itemCount,
            //                   widget.product['id'],
            //                   widget.product['image']);

            //               for (int i = 0; i < cart.cart1.length; i++)
            //                 if (cart.cart1.length >= 1 &&
            //                     cart.cart1[i].productId == productId)
            //                   setState(() {
            //                     itemFound = true;
            //                     cart.cart1[i].quantity++;
            //                     countprice = cart.cart1[i].price;
            //                     countprice = cart.cart1[i].price +
            //                         cart.cart1[i].price; //price coutnt in plus
            //                     cart.sum1 = cart.sum1 + cart.cart1[i].price;
            //                   });
            //                 else {
            //                   setState(() {
            //                     itemFound = false;
            //                   });
            //                 }
            //               if (!itemFound &&
            //                   dropdownSize != "Select Size" &&
            //                   dropdownColor != "Select Color" &&
            //                   stock != 0) //endd*/
            //               {
            //                 cart.add1(
            //                     widget.product['title'],
            //                     double.parse(widget.product['Price']),
            //                     dropdownSize,
            //                     dropdownColor,
            //                     _itemCount,
            //                     widget.product['id'],
            //                     widget.product['image'],
            //                     productId,
            //                     stock,
            //                     context);
            //               }
            //             },
            //             child: Text(
            //               'Buy Now',
            //               style: TextStyle(fontSize: 15, color: Colors.white),
            //             ),
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            body: ListView(
              children: [
                SizedBox(
                  height: height * 0.5,
                  child: PageView(
                    children: [
                      //for (int j = 0; j < widget.product['images'].length; j++)
                      GestureDetector(
                        child: CachedNetworkImage(
                          //imageUrl:widget.product[j]['images'],
                          imageUrl:
                              baseurlimageproduct + widget.product['image'],
                          fit: BoxFit.cover,
                          placeholder: (context, url) =>
                              Center(child: CircularProgressIndicator()),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              PageTransition(
                                  type: PageTransitionType.scale,
                                  child: FullImageproduct(
                                    images: [widget.product['image']],
                                    currentIndex: 0,
                                  )));
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(widget.product['title'],
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                // fontFamily: fontfamily,
                                fontWeight: FontWeight.w900)),
                      ),
                      Text("\$" + widget.product['Price'],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 20,
                              fontFamily: fontfamily,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(widget.product['description'],
                      // textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontFamily: fontfamily,
                          fontWeight: FontWeight.bold)),
                ),

                SizedBox(
                  height: height * 0.0146,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                        left: width * 0.0186,
                      ),
                      height: height * 0.0702,
                      child: Center(
                        child: Text("Size:   ",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                    Container(
                      color: Color(0xFF464646),
                      width: width * 0.352,
                      height: height * 0.0502,
                      child: Center(
                        child: DropdownButton<String>(
                          dropdownColor: Color(0xFF464646),
                          value: dropdownSize,
                          icon: Icon(
                            Icons.arrow_drop_down_sharp,
                            color: Colors.white,
                          ),
                          iconSize: 35,
                          elevation: 16,
                          style: TextStyle(color: Color(0xFFA79A9A)),
                          underline: Container(
                            height: 2,
                          ),
                          onChanged: (String newValue) {
                            setState(() {
                              dropdownSize = newValue;
                              int index = list.indexWhere((element) =>
                                  element['size'] == dropdownSize &&
                                  element['color'] == dropdownColor);
                              productId = list[index]['id'];
                              stock = list[index]['avaibility'];
                            });
                            print("productId " + productId.toString());
                            print("stock " + stock.toString());
                          },
                          items: sizes
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        (stock != 0) ? "$stock  In Stock" : "Out of Stock",
                        style: TextStyle(
                            color: (stock != 0) ? Colors.green : Colors.red,
                            fontSize: 14,
                            fontFamily: fontfamily),
                      ),
                    ),
                  ],
                ),

                SizedBox(
                  height: height * 0.0146,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                        left: width * 0.0186,
                      ),
                      height: height * 0.0702,
                      child: Center(
                        child: Text("Color: ",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                    Container(
                      color: Color(0xFF464646),
                      width: width * 0.352,
                      height: height * 0.0502,
                      child: Center(
                        child: DropdownButton<String>(
                          dropdownColor: Color(0xFF464646),
                          value: dropdownColor,
                          icon: Icon(
                            Icons.arrow_drop_down_sharp,
                            color: Colors.white,
                          ),
                          iconSize: 35,
                          elevation: 16,
                          style: TextStyle(color: Color(0xFFA79A9A)),
                          underline: Container(
                            height: 2,
                          ),
                          onChanged: (String newValue) {
                            setState(() {
                              dropdownColor = newValue;
                              int index = list.indexWhere((element) =>
                                  element['size'] == dropdownSize &&
                                  element['color'] == dropdownColor);
                              productId = list[index]['id'];
                              stock = list[index]['avaibility'];
                              print("productId " + productId.toString());
                              print("stock " + stock.toString());
                            });
                          },
                          items: colors
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(
                  height: height * 0.0146,
                ),
                // Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //   children: <Widget>[
                //     ElevatedButton(style:ElevatedButton.styleFrom( primary: Color(0xFFdd0e34)),
                //       onPressed: () {
                //       //comdition check on iteam dulicate
                //       for(int i=0;i<cart.cart1.length;i++)
                //        // if(widget.id==cart.cart1[i].id)
                //         if(cart.cart1.length >=1 && widget.product==cart.cart1[i].id && dropdownSize==cart.cart1[i].size && dropdownColor==cart.cart1[i].color )
                //           setState(() {
                //             itemFound=true;
                //             cart.cart1[i].quantity++;
                //             countprice=cart.cart1[i].price;
                //             countprice= cart.cart1[i].price+cart.cart1[i].price;//price coutnt in plus
                //             cart.sum1=cart.sum1+cart.cart1[i].price;
                //           });
                //         else{setState(() {
                //             itemFound=false;
                //           });}
                //         if(!itemFound)//endd*/
                //           Provider.of<ProductModellist>(context, listen: false).add1(widget.product['title'], double.parse(widget.product['Price']), dropdownSize, dropdownColor, _itemCount,widget.product['id'],widget.product['image'],context);
                //         print(cart.cart1.length.toString());
                //         Toast.show("Added to cart", context,
                //             duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
                //       },
                //       child: Text('Add to Cart',style: TextStyle(fontSize: 13),),
                //     ),
                //     ElevatedButton(style:ElevatedButton.styleFrom( primary: Color(0xFFdd0e34)),
                //       onPressed: () {
                //         Provider.of<ProductModellist>(context, listen: false).addbuynow(widget.product['title'],double.parse(widget.product['Price']), dropdownSize, dropdownColor, _itemCount,
                //             widget.product['id'],
                //             widget.product['image'],context);
                //       },
                //       child: Text('Buy Now',style: TextStyle(fontSize: 13),),
                //     ),
                //   ],
                // )
              ],
            )),
        Positioned(
          top: AppBar().preferredSize.height * 0.2,
          left: width * 0.39865,
          child: SizedBox(
            height: height * 0.10168,
            width: width * 0.20275,
            child: Image.asset(
              'assets/soundpic.png',
            ),
          ),
        ),
      ]),
    );
  }
}

class FullImageproduct extends StatelessWidget {
  final List images;
  final int currentIndex;
  const FullImageproduct({Key key, this.images, this.currentIndex})
      : super(key: key);

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
                enableInfiniteScroll: false,
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
                      imageProvider: CachedNetworkImageProvider(
                          baseurlimageproduct + images[i]),
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
