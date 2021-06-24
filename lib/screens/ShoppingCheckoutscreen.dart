import 'package:sound_chat/Model/ProductModellist.dart';
import 'package:sound_chat/common/index.dart';

import 'ShopAddress&billing.dart';
import 'ShopPayscreen.dart';
import 'ShoppingSccessful.dart';
class ShopCheckoutscreen extends StatefulWidget {
  @override
  _ShopCheckoutscreenState createState() => _ShopCheckoutscreenState();
}

class _ShopCheckoutscreenState extends State<ShopCheckoutscreen> {
  var cardvalue;
  var countprice;
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    cardvalue= context.watch<ProductModellist>();
    return SafeArea(
      child: Stack(
        children: [
          Scaffold(
            backgroundColor: Colors.black,
            appBar: AppBar(
              backgroundColor: Color(0xFFE18D13),
              backwardsCompatibility: true,
            ),
            bottomNavigationBar:
            // Container(
            //   height: height*0.0731,
            //   color: Colors.white,
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceAround,
            //     children: [
            //       Container(width: width,padding: EdgeInsets.symmetric(horizontal: 15),
            //         child: ElevatedButton(
            //           style: ElevatedButton.styleFrom(primary: Colors.red),
            //           onPressed: () {
            //             Navigator.of(context)
            //                 .pushReplacement(
            //                 MaterialPageRoute(builder: (context) => Shopaddress()));
            //           },
            //           child: Text(
            //             " Total Amount Pay:   \$"+cardvalue.sum1.toString(),
            //             style: TextStyle(
            //                 color: Colors.white,
            //                 fontSize: 20,
            //                 fontWeight: FontWeight.bold,
            //                 fontStyle: FontStyle.italic),
            //           ),
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
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xFF780001), Color(0xFF780001)],
                          begin: FractionalOffset.centerLeft,
                          end: FractionalOffset.centerRight,
                        ),
                      ),
                      child: TextButton(
                                  onPressed: () {
                                    Navigator.of(context)
                                        .pushReplacement(
                                        MaterialPageRoute(builder: (context) => Shopaddress()));
                                  },
                                  child: Text(
                                    " Total Amount Pay:   \$"+cardvalue.sum1.toString(),
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FontStyle.italic),
                                  ),
                                ),
                    ),
                  ),
                ],
              ),
            ),
            body: Column(
              children: [
                SizedBox(height: 10,),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Your order",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontFamily: 'Montserrat1',
                                fontWeight: FontWeight.bold)),
                      ],
                    )),
        SizedBox(height: 250,
          child: ListView.builder(
              itemCount: cardvalue.cart1.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  //width: width * 0.7737,
                  //height: height * 0.2201,
                  height: height * 0.1621,
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
                      Container(height: height*0.1070,margin: EdgeInsets.only(left: 20),
                        width: width*0.2194,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.black38, width: 2)),
                        child: CachedNetworkImage(
                          imageUrl:cardvalue.cart1[index].image,
                          fit: BoxFit.cover,
                          placeholder: (context, url) => Center(
                              child: CircularProgressIndicator()),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        ),
                      ),
                      SizedBox(width: 15,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(width: width*0.5,
                            child: Text(
                              cardvalue.cart1[index].productname,
                              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),
                            ),
                          ),
                          // Text(" Size:-" + cardvalue.cart1[index].size,
                          //     style: TextStyle(fontWeight: FontWeight.bold)),
                          // Text("Color:-" + cardvalue.cart1[index].color,
                          //     style: TextStyle(fontWeight: FontWeight.bold)),
                          Text(
                            "Quantity: " + cardvalue.cart1[index].quantity.toString(),
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                          Text("Price: \$" + (cardvalue.cart1[index].price *cardvalue.cart1[index].quantity).toString(),
                              style: TextStyle(fontWeight: FontWeight.w500)),
                          // Row(
                          //   children: [
                          //     Text("Quantity:",
                          //         style:
                          //         TextStyle(fontWeight: FontWeight.bold)),
                          //     GestureDetector(
                          //         child: new Icon(Icons.remove,
                          //             color: Colors.black),
                          //         onTap: () {
                          //           setState(() {
                          //             cardvalue.cart1[index].quantity == 1
                          //                 ? 1
                          //                 : cardvalue.cart1[index].quantity--;
                          //             countprice=cardvalue.cart1[index].price;
                          //             countprice= cardvalue.cart1[index].price+cardvalue.cart1[index].price;
                          //             cardvalue.sum1=cardvalue.sum1-cardvalue.cart1[index].price;
                          //           });
                          //         }
                          //     ),
                          //     Text(
                          //       cardvalue.cart1[index].quantity.toString(),
                          //       style: TextStyle(color: Colors.black),
                          //     ),
                          //     GestureDetector(
                          //       child: new Icon(
                          //         Icons.add,
                          //         color: Colors.black,
                          //       ),
                          //       onTap: (){
                          //         setState(() {
                          //           cardvalue.cart1[index].quantity++;
                          //           countprice=cardvalue.cart1[index].price;
                          //           countprice= cardvalue.cart1[index].price+cardvalue.cart1[index].price;//price coutnt in plus
                          //           cardvalue.sum1=cardvalue.sum1+cardvalue.cart1[index].price;//all value saum
                          //         });
                          //       },
                          //     ),
                          //   ],
                          // ),
                          // Text((cart.sum1*cart.cart1[index].quantity).toString(),
                          //     style: TextStyle(fontWeight: FontWeight.bold)),
                          // SizedBox(
                          //   width: width * 0.5,
                          //   child: Align(
                          //     alignment: Alignment.centerRight,
                          //     child: GestureDetector(
                          //         onTap: () {
                          //           cardvalue.remove1(
                          //               index, cardvalue.cart1[index].price,  cardvalue.cart1[index].quantity);//remove card
                          //         },
                          //         child: new Icon(
                          //           Icons.delete,
                          //           color: Colors.black,
                          //         )),
                          //   ),
                          // )
                        ],
                      ),
                    ],
                  ),
                );
              }),
        ),

                SizedBox(height: 10,),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Product Details",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color(0xFFA39597),
                                fontSize: 20,
                                fontFamily: 'Montserrat1',
                                fontWeight: FontWeight.bold)),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Text("Total Quantity:",style: TextStyle(
                                      color: Color(0xFFA39597),
                                      fontSize: 15,
                                      fontFamily: 'Montserrat1',
                                      fontWeight: FontWeight.bold)),
                                  Text("Subtotal:",style: TextStyle(
                                      color: Color(0xFFA39597),
                                      fontSize: 15,
                                      fontFamily: 'Montserrat1',
                                      fontWeight: FontWeight.bold)),
                                  Text("Tax:",style: TextStyle(
                                      color: Color(0xFFA39597),
                                      fontSize: 15,
                                      fontFamily: 'Montserrat1',
                                      fontWeight: FontWeight.bold)),
                                  Text("Shipping Charge:",style: TextStyle(
                                      color: Color(0xFFA39597),
                                      fontSize: 15,
                                      fontFamily: 'Montserrat1',
                                      fontWeight: FontWeight.bold)),
                                  Text("Grand Total:",style: TextStyle(
                                      color: Color(0xFFA39597),
                                      fontSize: 15,
                                      fontFamily: 'Montserrat1',
                                      fontWeight: FontWeight.bold)),
                                ],
                              ),
                              Column(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(cardvalue.cart1.length.toString(),style: TextStyle(
                                      color: Color(0xFFA39597),
                                      fontSize: 15,
                                      fontFamily: 'Montserrat1',
                                      fontWeight: FontWeight.bold)),
                                  Text("\$" + cardvalue.sum1.toString(),style: TextStyle(
                                      color: Color(0xFFA39597),
                                      fontSize: 15,
                                      fontFamily: 'Montserrat1',
                                      fontWeight: FontWeight.bold)),

                                  Text("\$0.00",style: TextStyle(
                                      color: Color(0xFFA39597),
                                      fontSize: 15,
                                      fontFamily: 'Montserrat1',
                                      fontWeight: FontWeight.bold)),
                                  Text("\$0.00",style: TextStyle(
                                      color: Color(0xFFA39597),
                                      fontSize: 15,
                                      fontFamily: 'Montserrat1',
                                      fontWeight: FontWeight.bold)),
                                  Text("\$" + cardvalue.sum1.toString(),style: TextStyle(
                                      color: Color(0xFFA39597),
                                      fontSize: 15,
                                      fontFamily: 'Montserrat1',
                                      fontWeight: FontWeight.bold)),


                                ],
                              )
                            ],
                          ),
                        ),

                      ],
                    )),


              ],
            ),
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
        ],
      ),
    );
  }
}