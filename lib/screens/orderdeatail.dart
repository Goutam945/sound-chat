/*import 'package:sound_chat/common/index.dart';

class Orderdeatail extends StatefulWidget {
  final order;
  Orderdeatail(this.order);
  @override
  _OrderdeatailState createState() => _OrderdeatailState();
}

class _OrderdeatailState extends State<Orderdeatail> {
  bool play = true;
  String data;
  var superherosLength;
  String email;
  String name;
  List items;
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
        email = sharedPreferences.getString('email');
        name = sharedPreferences.getString('name');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    items = widget.order['items'];
    //   if(Provider.of<ScheduleResponse>(context, listen: false).data!=null)
    // superherosLength = Provider.of<ScheduleResponse>(context, listen: false).data['data'];
    return SafeArea(
      child: Stack(
        children: [
          Scaffold(
              extendBody: false,
               backgroundColor: Colors.black,
              appBar: AppBar(
                backgroundColor: Color(0xFFE18D13),
                backwardsCompatibility: true,
              ),
              body: ListView.builder(itemCount: items.length,itemBuilder: (context, index) {
                return Column(mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                  SizedBox(height: 20),
                    Center(
                        child: Text(
                      '[Order#${widget.order['order_id']}]',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold,color: Colors.green),
                    )),
                    Align( alignment: Alignment.centerLeft,
                      child: Text(
                     "Shipping Details",
                        style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.bold,color: Colors.white),
                      ),
                    ),
                    Align( alignment: Alignment.centerLeft,
                      child: Text(
                        widget.order['first_name'] +widget.order['last_name']+",",
                        style:
                        TextStyle(fontSize: 22, fontWeight: FontWeight.bold,color: Colors.white),
                      ),
                    ),
                    Align( alignment: Alignment.centerLeft,
                      child: Text(
                        widget.order['address_1']+",",
                        style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.white),
                      ),
                    ),
                    Align( alignment: Alignment.centerLeft,
                      child: Text(
                        widget.order['city']+",",
                        style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.white),
                      ),
                    ),
                    Align( alignment: Alignment.centerLeft,
                      child: Text(
                        widget.order['state']+",",
                        style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.white),
                      ),
                    ),
                    Align( alignment: Alignment.centerLeft,
                      child: Text(
                        widget.order['postcode']+",",
                        style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.white),
                      ),
                    ),
                    Align( alignment: Alignment.centerLeft,
                      child: Text(
                        widget.order['phone'],
                        style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.white),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Container(height: 2,color: Colors.orange,),
                    SizedBox(height: 10,),
                    Align( alignment: Alignment.centerLeft,
                      child: Text(
                        "Product Details",
                        style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.bold,color: Colors.white),
                      ),
                    ),
                // Theme(
                // data: Theme.of(context).copyWith(
                // dividerColor: Colors.white
                // ),
                //    child: DataTable(
                //       columns: [
                //         DataColumn(
                //             label: Text('Product',
                //                 style: TextStyle(
                //                     fontSize: 18,
                //                     color: Colors.orange,
                //                     fontWeight: FontWeight.bold))),
                //         DataColumn(
                //             label: Text('Quantity',
                //                 style: TextStyle(
                //                     fontSize: 18,
                //                     color: Colors.orange,
                //                     fontWeight: FontWeight.bold))),
                //         DataColumn(
                //             label: Text('Price',
                //                 style: TextStyle(
                //                     fontSize: 18,
                //                      color: Colors.orange,
                //                     fontWeight: FontWeight.bold))),
                //       ],
                //       rows: [
                //         DataRow(cells: [
                //           DataCell(Text(items[index]['name'],style: TextStyle(color: Colors.white)),),
                //           DataCell(Text(items[index]['quantity'].toString(),style: TextStyle(color: Colors.white))),
                //           DataCell(Text(items[index]['price'].toString(),style: TextStyle(color: Colors.white))),
                //         ]),
                //         DataRow(cells: [
                //           DataCell(Text('Subtotal',
                //               style: TextStyle(
                //                   color: Colors.white,
                //                   fontSize: 15, fontWeight: FontWeight.bold))),
                //           DataCell(Text('')),
                //           DataCell(Text(items[index]['subtotal'].toString(),style: TextStyle(color: Colors.white))),
                //         ]),
                //         DataRow(cells: [
                //           DataCell(Text('Shipping',
                //               style: TextStyle(
                //                   color: Colors.white,
                //                   fontSize: 15, fontWeight: FontWeight.bold))),
                //           DataCell(Text('')),
                //           DataCell(Text(widget.order['shipping_tax'],style: TextStyle(color: Colors.white)),),
                //         ]),
                //         DataRow(cells: [
                //           DataCell(Text('Tax',
                //               style: TextStyle(
                //                   color: Colors.white,
                //                   fontSize: 15, fontWeight: FontWeight.bold))),
                //           DataCell(Text('')),
                //           DataCell(Text(items[index]['total_tax'].toString(),style: TextStyle(color: Colors.white))),
                //         ]),
                //         DataRow(cells: [
                //           DataCell(Text('Payment method',
                //               style: TextStyle(
                //                   color: Colors.white,
                //                   fontSize: 15, fontWeight: FontWeight.bold))),
                //           DataCell(Text('')),
                //           DataCell(Text( widget.order['payment_method_title'],style: TextStyle(color: Colors.white))),
                //         ]),
                //         DataRow(cells: [
                //           DataCell(Text('Total',
                //               style: TextStyle(
                //                   color: Colors.white,
                //                   fontSize: 15, fontWeight: FontWeight.bold))),
                //           DataCell(Text('')),
                //           DataCell(Text(items[index]['total'].toString(),style: TextStyle(color: Colors.white))),
                //         ]),
                //       ],
                //     )),
                    Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text("Quantity",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                  )),
                              Text("Color",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                  )),
                              Text("Size",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                  )),
                              Text("Price",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                  )),
                              Text("Total price",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  )),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(items[index]['quantity'].toString(),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                  )),
                              Text(items[index]['color'].toString(),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                  )),
                              Text(items[index]['size'].toString(),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                  )),
                              Text(items[index]['total_price'].toString(),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                  )),
                              Text(widget.order['total_amount'].toString(),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  )),
                            ],
                          )
                        ],

                      ),
                    ),
                    SizedBox(height: 10,),
                    Container(height: 1,color: Colors.orange,),
                    SizedBox(height: 20,),
                    Align( alignment: Alignment.centerLeft,
                      child: Text(
                        "Payment type:"+" "+widget.order['payment_method'].toString(),
                        style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.bold,color: Colors.white),
                      ),
                    ),
                  ],
                );
              })),
         Positioned(
           top: AppBar().preferredSize.height*0.1,
           left: width * 0.39865,
           child: SizedBox(
             height: height * 0.11168,
             width: width * 0.20875,
             child: Image.asset(
               'assets/soundpic.png',
             ),
           ),
         ),
        ],
      ),
    );
  }
}*/
import 'package:sound_chat/common/index.dart';
import 'package:sound_chat/screens/ordertracking.dart';

class Orderdeatail extends StatefulWidget {
  final order;
  Orderdeatail(this.order);
  @override
  _OrderdeatailState createState() => _OrderdeatailState();
}

class _OrderdeatailState extends State<Orderdeatail> {
  bool play = true;
  String data;
  var superherosLength;
  String email;
  String name;
  List items = [];
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
        email = sharedPreferences.getString('email');
        name = sharedPreferences.getString('name');
      }
    });
  }

  String getStatus(String status) {
    switch (status) {
      case "0":
        return "Order Placed";

        break;
      case "1":
        return "Order Prepared";

        break;

      case "2":
        return "Order Shipped";

        break;
      case "3":
        return "Order Delivered";

        break;

      default:
        return "";

        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    items = widget.order['items'];
    String status = getStatus(widget.order['order_status']);
    return SafeArea(
      child: Stack(
        children: [
          Scaffold(
              extendBody: false,
              backgroundColor: Colors.black,
              appBar: PreferredSize(
                  preferredSize: Size.fromHeight(55), child: Backappbar()),
              body: ListView(
                children: [
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Shipping Details",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      ),
                      // Row(
                      //   children: [
                      //     Text(
                      //       "Status:  ",
                      //       style: TextStyle(
                      //           fontSize: 15,
                      //           fontWeight: FontWeight.w700,
                      //           color: Colors.white),
                      //     ),
                      //     Text(
                      //       status,
                      //       style: TextStyle(
                      //           fontSize: 15,
                      //           fontWeight: FontWeight.w700,
                      //           color: Colors.white),
                      //     ),
                      //     SizedBox(
                      //       width: 10,
                      //     )
                      //   ],
                      // ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.order['first_name'] +
                              " " +
                              widget.order['last_name'] +
                              ",",
                          style: TextStyle(
                              fontSize: 13,
                              color: Colors.white,
                              fontFamily: fontfamily),
                        ),
                        Text(
                          widget.order['address_1'] + ",",
                          style: TextStyle(
                              fontSize: 13,
                              color: Colors.white,
                              fontFamily: fontfamily),
                        ),
                        Text(
                          widget.order['city'] + ",",
                          style: TextStyle(
                              fontSize: 13,
                              color: Colors.white,
                              fontFamily: fontfamily),
                        ),
                        Text(
                          widget.order['state'] + ",",
                          style: TextStyle(
                              fontSize: 13,
                              color: Colors.white,
                              fontFamily: fontfamily),
                        ),
                        Text(
                          widget.order['postcode'] + ",",
                          style: TextStyle(
                              fontSize: 13,
                              color: Colors.white,
                              fontFamily: fontfamily),
                        ),
                        Text(
                          widget.order['phone'],
                          style: TextStyle(
                              fontSize: 13,
                              color: Colors.white,
                              fontFamily: fontfamily),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Payment type:" +
                                " " +
                                widget.order['payment_method'].toString(),
                            style: TextStyle(
                                fontSize: 13,
                                color: Colors.white,
                                fontFamily: fontfamily),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Total amount:" +
                          " \$" +
                          widget.order['total_amount'].toString(),
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                          fontFamily: fontfamily),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 1,
                    color: Colors.orange,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Product Details",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    ),
                  ),
                  for (int index = 0; index < items.length; index++)
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      margin:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      // height: 160,
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
                            offset: Offset(0, 2), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              items[index]['productname'],
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.deepOrange),
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 80,
                                width: 80,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: CachedNetworkImage(
                                    imageUrl: baseurlimageproduct +
                                        items[index]['image'],
                                    fit: BoxFit.cover,
                                    placeholder: (context, url) => SizedBox(
                                      height: 80,
                                      child: Center(
                                          child: CircularProgressIndicator()),
                                    ),
                                    errorWidget: (context, url, error) =>
                                        SizedBox(
                                      height: 80,
                                      child: Icon(
                                        Icons.error,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text("Quantity",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                            fontFamily: fontfamily)),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text("Color",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                            fontFamily: fontfamily)),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text("Size",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                            fontFamily: fontfamily)),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text("Total price",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                            fontFamily: fontfamily)),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(items[index]['quantity'].toString(),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                            fontFamily: fontfamily)),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(items[index]['color'].toString(),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                            fontFamily: fontfamily)),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(items[index]['size'].toString(),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                            fontFamily: fontfamily)),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(items[index]['total_price'].toString(),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                            fontFamily: fontfamily)),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 1,
                    color: Colors.orange,
                  ),
                  SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Order Status",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 400,
                    child: Ordertraking(
                      currentStep: int.parse(widget.order['order_status']),
                    ),
                  ),
                ],
              )),
          Positioned(
            top: AppBar().preferredSize.height * 0.05,
            left: width * 0.39865,
            child: SizedBox(
              height: height * 0.10168,
              width: width * 0.20275,
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
