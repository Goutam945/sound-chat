/*
import 'package:sound_chat/Model/ProductModellist.dart';
import 'package:sound_chat/common/index.dart';
import 'package:sound_chat/common/shoappbar.dart';

import 'ShoppingCheckoutscreen.dart';

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
import 'package:sound_chat/Model/ProductModellist.dart';
import 'package:sound_chat/common/index.dart';
import 'package:sound_chat/common/shoappbar.dart';

import 'Shopping.dart';
import 'ShoppingCheckoutscreen.dart';

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
        cart.cart1.length == 0 ?
        Scaffold(
        appBar: AppBar(
        backgroundColor: Color(0xFFE18D13),
      backwardsCompatibility: true,
    ),
            body: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Cart is empty. ',
                    style: (TextStyle(fontSize: width*0.05)),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .pushReplacement(MaterialPageRoute(builder: (context) => Shopping()));
                    },
                    child: Text(
                      'Please Add Iteam',
                      style: (TextStyle(fontSize: width*0.05, color: Colors.red[900])),
                    ),
                  ),
                ],
              ),
            )):
        Scaffold(
           // backgroundColor: Colors.black,
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
                          MaterialPageRoute(builder: (context) => ShopCheckoutscreen()));
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
                  return Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        // width: width * 0.7737,
                         height: height * 0.2201,
                      decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15)
                      ),
                      boxShadow: [
                      BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                      ),
                      ],),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(height: height*0.1270,margin: EdgeInsets.only(left: 20),
                              width: width*0.2194,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.black38, width: 2)),
                              child: CachedNetworkImage(
                                imageUrl:cart.cart1[index].image,
                                fit: BoxFit.cover,
                                placeholder: (context, url) => Center(
                                    child: CircularProgressIndicator()),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                              ),
                            ),
                            SizedBox(width: 15,),
                            Column(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(width: width*0.5,
                                  child: Text(
                                      cart.cart1[index].productname,
                                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),
                                  ),
                                ),
                                Text("Size:" + cart.cart1[index].size,
                                    style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15)),
                                Text("Color:" + cart.cart1[index].color,
                                    style: TextStyle(fontWeight: FontWeight.w500)),
                                Text("Price: \$" + (cart.cart1[index].price *cart.cart1[index].quantity).toString(),
                                    style: TextStyle(fontWeight: FontWeight.w500)),
                                Row(
                                  children: [
                                    Text("Quantity:",
                                        style:
                                        TextStyle(fontWeight: FontWeight.w500)),
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
                              ],
                            )
                          ],
                        ),
                      ),
                      Positioned(bottom: 30,right: 50,
                        child: GestureDetector(
                            onTap: () {
                              cart.remove1(
                                  index, cart.cart1[index].price,  cart.cart1[index].quantity);//remove card
                            },
                            child: new Icon(
                              Icons.delete,
                              color: Colors.black,
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
  }}
