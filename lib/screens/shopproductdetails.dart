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
  }

  var cart;
  int _itemCount = 1;
  String dropdownValue = 'Black';
  String dropdownSize = 'S';
  //String size='S';
  List<bool> butoncolor = [for (int i = 0; i < 4; i++) true];
  bool itemFound = false;
  var countprice;
  //int id=2; live id add and remove on final id
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
            bottomNavigationBar: Container(
              height: 46,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xFFE18D13), Colors.orange],
                          begin: FractionalOffset.centerLeft,
                          end: FractionalOffset.centerRight,
                        ),
                      ),
                      child: TextButton(
                        onPressed: () {
                          Vibration.vibrate();
                          //comdition check on iteam dulicate
                          for (int i = 0; i < cart.cart1.length; i++)
                            // if(widget.id==cart.cart1[i].id)
                            if (cart.cart1.length >= 1 &&
                                widget.product == cart.cart1[i].id &&
                                dropdownSize == cart.cart1[i].size &&
                                dropdownValue == cart.cart1[i].color)
                              setState(() {
                                itemFound = true;
                                cart.cart1[i].quantity++;
                                countprice = cart.cart1[i].price;
                                countprice = cart.cart1[i].price +
                                    cart.cart1[i].price; //price coutnt in plus
                                cart.sum1 = cart.sum1 + cart.cart1[i].price;
                              });
                            else {
                              setState(() {
                                itemFound = false;
                              });
                            }
                          if (!itemFound) //endd*/
                            Provider.of<ProductModellist>(context,
                                    listen: false)
                                .add1(
                                    widget.product['title'],
                                    double.parse(widget.product['Price']),
                                    dropdownSize,
                                    dropdownValue,
                                    _itemCount,
                                    widget.product['id'],
                                    widget.product['image'],
                                    context);
                          print(cart.cart1.length.toString());
                          Toast.show("Added to cart", context,
                              duration: Toast.LENGTH_SHORT,
                              gravity: Toast.BOTTOM);
                        },
                        child: Text(
                          'Add to Cart',
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xFF780001), Color(0xFF780001)],
                          begin: FractionalOffset.centerLeft,
                          end: FractionalOffset.centerRight,
                        ),
                      ),
                      child: TextButton(
                        onPressed: () {
                          Vibration.vibrate();
                          Provider.of<ProductModellist>(context, listen: false)
                              .addbuynow(
                                  widget.product['title'],
                                  double.parse(widget.product['Price']),
                                  dropdownSize,
                                  dropdownValue,
                                  _itemCount,
                                  widget.product['id'],
                                  widget.product['image'],
                                  context);
                        },
                        child: Text(
                          'Buy Now',
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            body: ListView(
              children: [
                SizedBox(
                  height: 300,
                  child: PageView(
                    children: [
                      //for (int j = 0; j < widget.product['images'].length; j++)
                      GestureDetector(
                        child: CachedNetworkImage(
                          //imageUrl:widget.product[j]['images'],
                          imageUrl: widget.product['image'],
                          fit: BoxFit.fill,
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
                                  child: FullImage(
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
                Text(widget.product['title'],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color(0xFF535353),
                        fontSize: 20,
                        fontFamily: 'Montserrat1',
                        fontWeight: FontWeight.bold)),
                Text("\$" + widget.product['Price'],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 15,
                        fontFamily: 'Montserrat1',
                        fontWeight: FontWeight.bold)),
                Text(widget.product['description'],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color(0xFF535353),
                        fontSize: 15,
                        fontFamily: 'Montserrat1',
                        fontWeight: FontWeight.bold)),
                /*Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Size:",style: TextStyle(
                        color: Color(0xFF535353),
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
                    ElevatedButton(style:ElevatedButton.styleFrom( primary: butoncolor[0] ? Color(0xFFE18D13) : Colors.grey,),
                      onPressed: () {
                      setState(() {
                        size='S';
                        butoncolor=butoncolor.asMap().entries.map((e) => e.key==0 ? false:true).toList();
                      });
                      },
                      child: Text('S'),
                    ),
                    ElevatedButton(style:ElevatedButton.styleFrom( primary: butoncolor[1] ? Color(0xFFE18D13) : Colors.grey,),
                      onPressed: () {
                      setState(() {
                        size='M';
                        butoncolor=butoncolor.asMap().entries.map((e) => e.key==1 ? false:true).toList();
                      });
                      },
                      child: Text('M'),
                    ),
                    // ElevatedButton(style:ElevatedButton.styleFrom( primary: butoncolor[1] ? Color(0xFFE18D13) : Colors.grey,),
                    //   onPressed: () {
                    //     setState(() {
                    //       size='L';
                    //       butoncolor=butoncolor.asMap().entries.map((e) => e.key==1 ? false:true).toList();
                    //     });
                    //   },
                    //   child: Text('L'),
                    // ),
                    ElevatedButton(style:ElevatedButton.styleFrom( primary: butoncolor[2] ? Color(0xFFE18D13) : Colors.grey,),
                      onPressed: () {
                       setState(() {
                         size='2XL';
                         butoncolor=butoncolor.asMap().entries.map((e) => e.key==2 ? false:true).toList();
                       });
                      },
                      child: Text('2XL'),
                    ),
                    ElevatedButton(style:ElevatedButton.styleFrom( primary: butoncolor[3] ? Color(0xFFE18D13) : Colors.grey,),
                      onPressed: () {
                      setState(() {
                        size='3XL';
                        butoncolor=butoncolor.asMap().entries.map((e) => e.key==3 ? false:true).toList();
                      });
                      },
                      child: Text('3XL'),
                    ),

                  ],
                ),*/
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
                                color: Color(0xFF535353),
                                fontSize: 20,
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
                          icon: Icon(Icons.arrow_drop_down_sharp),
                          iconSize: 44,
                          elevation: 16,
                          style: TextStyle(color: Color(0xFFA79A9A)),
                          underline: Container(
                            height: 2,
                          ),
                          onChanged: (String newValue) {
                            setState(() {
                              dropdownSize = newValue;
                            });
                          },
                          items: <String>['S', 'M', 'L', 'XL', '2XL', '3XL']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: TextStyle(fontSize: width * 0.0438),
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
                                color: Color(0xFF535353),
                                fontSize: 20,
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
                          value: dropdownValue,
                          icon: Icon(Icons.arrow_drop_down_sharp),
                          iconSize: 44,
                          elevation: 16,
                          style: TextStyle(color: Color(0xFFA79A9A)),
                          underline: Container(
                            height: 2,
                          ),
                          onChanged: (String newValue) {
                            setState(() {
                              dropdownValue = newValue;
                            });
                          },
                          items: <String>['Black', 'Blue', 'Red', 'Yellow']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: TextStyle(fontSize: width * 0.0438),
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
                //         if(cart.cart1.length >=1 && widget.product==cart.cart1[i].id && dropdownSize==cart.cart1[i].size && dropdownValue==cart.cart1[i].color )
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
                //           Provider.of<ProductModellist>(context, listen: false).add1(widget.product['title'], double.parse(widget.product['Price']), dropdownSize, dropdownValue, _itemCount,widget.product['id'],widget.product['image'],context);
                //         print(cart.cart1.length.toString());
                //         Toast.show("Added to cart", context,
                //             duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
                //       },
                //       child: Text('Add to Cart',style: TextStyle(fontSize: 13),),
                //     ),
                //     ElevatedButton(style:ElevatedButton.styleFrom( primary: Color(0xFFdd0e34)),
                //       onPressed: () {
                //         Provider.of<ProductModellist>(context, listen: false).addbuynow(widget.product['title'],double.parse(widget.product['Price']), dropdownSize, dropdownValue, _itemCount,
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
