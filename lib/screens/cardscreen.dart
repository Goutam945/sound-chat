/*
import 'package:sound_chat/Model/ProductModellist.dart';
import 'package:sound_chat/common/index.dart';
import 'package:sound_chat/common/shoappbar.dart';

import 'shoppingcheckoutscreen.dart';

class CardScreen extends StatefulWidget {
  @override
  _CardScreenState createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  int _itemCount = 0;
  var countprice;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var cart = context.watch<ProductModellist>();
    return SafeArea(
      child: Stack(children: [
        Scaffold(
            backgroundColor: Colors.black,
            appBar: AppBar(
              backgroundColor: Color(0xFFE18D13),
              backwardsCompatibility: true,
            ),
            bottomNavigationBar: Container(
              height: height*0.0731,
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Text(
                        "Total: \$",
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic),
                      ),
                      Text(
                        (cart.sum1).toString(),
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.red),
                    onPressed: () {
                      Navigator.of(context)
                          .pushReplacement(
                          MaterialPageRoute(builder: (context) => ShopPayscreen()));
                    },
                    child: Text(
                      "Pay",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic),
                    ),
                  ),
                ],
              ),
            ),
            body: ListView.builder(
                itemCount: cart.cart1.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                    width: width * 0.7737,
                    height: height * 0.2201,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: height*0.1170,
                          width: width*0.1944,
                          child: Image.network(
                            'https://i0.wp.com/soundchatradio.com/wp-content/uploads/2021/02/cover-slick.jpg?fit=600%2C800&ssl=1',
                            fit: BoxFit.fill,
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Product: -" + cart.cart1[index].productname,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(" Size:-" + cart.cart1[index].size,
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Text("Color:-" + cart.cart1[index].color,
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Text("Price:- \$" + (cart.cart1[index].price *cart.cart1[index].quantity).toString(),
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Row(
                              children: [
                                Text("Quantity:",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                GestureDetector(
                                  child: new Icon(Icons.remove,
                                      color: Colors.black),
                                  onTap: () {
                                    if(cart.cart1[index].quantity> 1)
                                    setState(() {
                                          cart.cart1[index].quantity--;
                                      countprice=cart.cart1[index].price;
                                      countprice= cart.cart1[index].price+cart.cart1[index].price;
                                      cart.sum1=cart.sum1-cart.cart1[index].price;
                                    });
                                  }
                                ),
                                Text(
                                  cart.cart1[index].quantity.toString(),
                                  style: TextStyle(color: Colors.black),
                                ),
                                GestureDetector(
                                    child: new Icon(
                                      Icons.add,
                                      color: Colors.black,
                                    ),
                                  onTap: (){
                                      setState(() {
                                        cart.cart1[index].quantity++;
                                        countprice=cart.cart1[index].price;
                                        countprice= cart.cart1[index].price+cart.cart1[index].price;//price coutnt in plus
                                        cart.sum1=cart.sum1+cart.cart1[index].price;//all value saum
                                      });
                                  },
                                ),
                              ],
                            ),
                            // Text((cart.sum1*cart.cart1[index].quantity).toString(),
                            //     style: TextStyle(fontWeight: FontWeight.bold)),
                            SizedBox(
                              width: width * 0.5,
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: GestureDetector(
                                    onTap: () {
                                      cart.remove1(
                                          index, cart.cart1[index].price,  cart.cart1[index].quantity);//remove card
                                    },
                                    child: new Icon(
                                      Icons.delete,
                                      color: Colors.black,
                                    )),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  );
                })),
        Positioned(
          top: AppBar().preferredSize.height * 0.2,
          left: width * 0.39865,
          child: SizedBox(
            height: height * 0.10368,
            width: width * 0.20375,
            child: Image.asset(
              'assets/soundpic.png',
            ),
          ),
        ),
      ]),
    );
  }
}*/

import 'package:sound_chat/common/index.dart';

class CardScreen extends StatefulWidget {
  @override
  _CardScreenState createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  int id;
  var countprice;
  @override
  void initState() {
    super.initState();
    _loadSavedData();
  }

  _loadSavedData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      if (sharedPreferences.getString('email') != null &&
          sharedPreferences.getString('email').isNotEmpty) {
        id = sharedPreferences.getInt('id');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var cart = context.watch<ProductModellist>();
    return SafeArea(
      child: Stack(children: [
        cart.cart1.length == 0
            ? Scaffold(
                backgroundColor: Colors.black,
                appBar: AppBar(
                  backgroundColor: Color(0xFF3F535E),
                ),
                body: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Cart is empty. ',
                        style: (TextStyle(
                            fontSize: width * 0.05, color: Colors.white)),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => Shopping()));
                        },
                        child: Text(
                          'Please Add Iteam',
                          style: (TextStyle(
                              fontSize: width * 0.05, color: Colors.red[900])),
                        ),
                      ),
                    ],
                  ),
                ))
            : Scaffold(
                backgroundColor: Colors.black,
                appBar: AppBar(
                  backgroundColor: Color(0xFF3F535E),
                ),
                bottomNavigationBar:
                    // Container(
                    //   height: height*0.0731,
                    //   color: Colors.white,
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.spaceAround,
                    //     children: [
                    //       Row(
                    //         children: [
                    //           Text(
                    //             "Total: \$",
                    //             style: TextStyle(
                    //                 color: Colors.red,
                    //                 fontSize: 22,
                    //                 fontWeight: FontWeight.bold,
                    //                 fontStyle: FontStyle.italic),
                    //           ),
                    //           Text(
                    //             (cart.sum1).toString(),
                    //             style: TextStyle(
                    //                 color: Colors.red,
                    //                 fontSize: 22,
                    //                 fontWeight: FontWeight.bold,
                    //                 fontStyle: FontStyle.italic),
                    //           ),
                    //         ],
                    //       ),
                    //       ElevatedButton(
                    //         style: ElevatedButton.styleFrom(primary: Colors.red),
                    //         onPressed: () {
                    //           if(id!=null){
                    //             Navigator.of(context)
                    //                 .pushReplacement(
                    //                 MaterialPageRoute(builder: (context) => ShopCheckoutscreen()));
                    //           } else {
                    //             Toast.show("Please Login before Shopping", context,
                    //                 duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
                    //           }
                    //         },
                    //         child: Text(
                    //           "Pay",
                    //           style: TextStyle(
                    //               color: Colors.white,
                    //               fontSize: 25,
                    //               fontWeight: FontWeight.bold,
                    //               fontStyle: FontStyle.italic),
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    Container(
                  height: 46,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          alignment: Alignment.center,
                          color: Color(0xFFE18D13),
                          child: Text("Total: \$" + (cart.sum1).toString(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic)),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Color(0xFF481621), Color(0xFF481621)],
                              begin: FractionalOffset.centerLeft,
                              end: FractionalOffset.centerRight,
                            ),
                          ),
                          child: TextButton(
                            onPressed: () {
                              if (id != null) {
                                // Navigator.of(context)
                                //     .pushReplacement(
                                //     MaterialPageRoute(builder: (context) => ShopCheckoutscreen()));
                                Navigator.push(
                                    context,
                                    PageTransition(
                                        type: PageTransitionType.rightToLeft,
                                        child: ShopCheckoutscreen()));
                              } else {
                                // Toast.show("Please Login before Shopping", context,
                                //     duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
                                AwesomeDialog(
                                  context: context,
                                  dialogType: DialogType.NO_HEADER,
                                  animType: AnimType.BOTTOMSLIDE,
                                  btnOkColor: Colors.orange,
                                  title: 'Please Login',
                                  desc: 'Please Login before Shopping',
                                  btnCancelOnPress: () {
                                    //Navigator.of(context).pop();
                                  },
                                  btnOkText: "Yes",
                                  btnOkOnPress: () {
                                    Navigator.push(
                                        context,
                                        PageTransition(
                                            type:
                                                PageTransitionType.rightToLeft,
                                            child: NewLogin()));
                                  },
                                )..show();
                              }
                            },
                            child: Text(
                              "Pay",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                body: ListView.builder(
                    itemCount: cart.cart1.length,
                    itemBuilder: (context, index) {
                      return Stack(
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            // width: width * 0.7737,
                            height: height * 0.2201,
                            decoration: BoxDecoration(
                              color: Color(0xFF222222),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15),
                                  topRight: Radius.circular(15),
                                  bottomLeft: Radius.circular(15),
                                  bottomRight: Radius.circular(15)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 1,
                                  blurRadius: 2,
                                  offset: Offset(
                                      0, 2), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  height: height * 0.1270,
                                  margin: EdgeInsets.only(left: 20),
                                  width: width * 0.2194,
                                  // decoration: BoxDecoration(
                                  //     border: Border.all(
                                  //         color: Colors.black, width: 2),
                                  // ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: CachedNetworkImage(
                                      imageUrl: cart.cart1[index].image,
                                      fit: BoxFit.cover,
                                      placeholder: (context, url) => Center(
                                          child: CircularProgressIndicator()),
                                      errorWidget: (context, url, error) =>
                                          Icon(Icons.error),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: width * 0.5,
                                      child: Text(
                                        cart.cart1[index].productname,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    Text("Size: " + cart.cart1[index].size,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15,
                                          color: Colors.white,
                                        )),
                                    Text("Color: " + cart.cart1[index].color,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white,
                                        )),
                                    Text(
                                        "Price: \$ " +
                                            (cart.cart1[index].price *
                                                    cart.cart1[index].quantity)
                                                .toString(),
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white,
                                        )),
                                    Row(
                                      children: [
                                        Text("Quantity: ",
                                            style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white,
                                            )),
                                        GestureDetector(
                                            child: new Icon(
                                              Icons.arrow_left,
                                              size: 30,
                                              color: Colors.white,
                                            ),
                                            onTap: () {
                                              if (cart.cart1[index].quantity >
                                                  1)
                                                setState(() {
                                                  cart.cart1[index].quantity--;
                                                  countprice =
                                                      cart.cart1[index].price;
                                                  countprice = cart
                                                          .cart1[index].price +
                                                      cart.cart1[index].price;
                                                  cart.sum1 = cart.sum1 -
                                                      cart.cart1[index].price;
                                                });
                                            }),
                                        Text(
                                          cart.cart1[index].quantity.toString(),
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                        GestureDetector(
                                          child: new Icon(
                                            Icons.arrow_right,
                                            color: Colors.white,
                                            size: 30,
                                          ),
                                          onTap: () {
                                            setState(() {
                                              cart.cart1[index].quantity++;
                                              countprice =
                                                  cart.cart1[index].price;
                                              countprice = cart
                                                      .cart1[index].price +
                                                  cart.cart1[index]
                                                      .price; //price coutnt in plus
                                              cart.sum1 = cart.sum1 +
                                                  cart.cart1[index]
                                                      .price; //all value saum
                                            });
                                          },
                                        ),
                                      ],
                                    ),
                                    // Text((cart.sum1*cart.cart1[index].quantity).toString(),
                                    //     style: TextStyle(fontWeight: FontWeight.bold)),
                                  ],
                                )
                              ],
                            ),
                          ),
                          Positioned(
                            bottom: 30,
                            right: 50,
                            child: GestureDetector(
                                onTap: () {
                                  AwesomeDialog(
                                    context: context,
                                    dialogType: DialogType.NO_HEADER,
                                    animType: AnimType.BOTTOMSLIDE,
                                    btnOkColor: Colors.orange,
                                    title: 'Remove Item',
                                    desc:
                                        'Do you want to remove the item from selection?',
                                    btnCancelOnPress: () {
                                      //Navigator.of(context).pop();
                                    },
                                    btnOkText: "Confirm",
                                    btnOkOnPress: () {
                                      cart.remove1(
                                          index,
                                          cart.cart1[index].price,
                                          cart.cart1[index]
                                              .quantity); //remove card
                                    },
                                  )..show();
                                },
                                child: new Icon(
                                  Icons.delete,
                                  color: Colors.white,
                                )),
                          )
                        ],
                      );
                    })),
        Positioned(
          top: AppBar().preferredSize.height * 0.2,
          left: width * 0.39865,
          child: SizedBox(
            height: height * 0.10368,
            width: width * 0.20375,
            child: Image.asset(
              'assets/soundpic.png',
            ),
          ),
        ),
      ]),
    );
  }
}
