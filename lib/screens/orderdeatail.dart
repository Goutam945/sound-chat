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
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.white),
                      ),
                    ),
                    Align( alignment: Alignment.centerLeft,
                      child: Text(
                        widget.order['first_name'] +widget.order['last_name']+",",
                        style:
                        TextStyle(fontSize: 22, fontWeight: FontWeight.bold,color: Color(0xFFA39597)),
                      ),
                    ),
                    Align( alignment: Alignment.centerLeft,
                      child: Text(
                        widget.order['address_1']+",",
                        style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Color(0xFFA39597)),
                      ),
                    ),
                    Align( alignment: Alignment.centerLeft,
                      child: Text(
                        widget.order['city']+",",
                        style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Color(0xFFA39597)),
                      ),
                    ),
                    Align( alignment: Alignment.centerLeft,
                      child: Text(
                        widget.order['state']+",",
                        style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Color(0xFFA39597)),
                      ),
                    ),
                    Align( alignment: Alignment.centerLeft,
                      child: Text(
                        widget.order['postcode']+",",
                        style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Color(0xFFA39597)),
                      ),
                    ),
                    Align( alignment: Alignment.centerLeft,
                      child: Text(
                        widget.order['phone'],
                        style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Color(0xFFA39597)),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Container(height: 2,color: Colors.orange,),
                    SizedBox(height: 10,),
                    Align( alignment: Alignment.centerLeft,
                      child: Text(
                        "Product Details",
                        style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.white),
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
                //           DataCell(Text(items[index]['name'],style: TextStyle(color: Color(0xFFA39597))),),
                //           DataCell(Text(items[index]['quantity'].toString(),style: TextStyle(color: Color(0xFFA39597)))),
                //           DataCell(Text(items[index]['price'].toString(),style: TextStyle(color: Color(0xFFA39597)))),
                //         ]),
                //         DataRow(cells: [
                //           DataCell(Text('Subtotal',
                //               style: TextStyle(
                //                   color: Color(0xFFA39597),
                //                   fontSize: 15, fontWeight: FontWeight.bold))),
                //           DataCell(Text('')),
                //           DataCell(Text(items[index]['subtotal'].toString(),style: TextStyle(color: Color(0xFFA39597)))),
                //         ]),
                //         DataRow(cells: [
                //           DataCell(Text('Shipping',
                //               style: TextStyle(
                //                   color: Color(0xFFA39597),
                //                   fontSize: 15, fontWeight: FontWeight.bold))),
                //           DataCell(Text('')),
                //           DataCell(Text(widget.order['shipping_tax'],style: TextStyle(color: Color(0xFFA39597))),),
                //         ]),
                //         DataRow(cells: [
                //           DataCell(Text('Tax',
                //               style: TextStyle(
                //                   color: Color(0xFFA39597),
                //                   fontSize: 15, fontWeight: FontWeight.bold))),
                //           DataCell(Text('')),
                //           DataCell(Text(items[index]['total_tax'].toString(),style: TextStyle(color: Color(0xFFA39597)))),
                //         ]),
                //         DataRow(cells: [
                //           DataCell(Text('Payment method',
                //               style: TextStyle(
                //                   color: Color(0xFFA39597),
                //                   fontSize: 15, fontWeight: FontWeight.bold))),
                //           DataCell(Text('')),
                //           DataCell(Text( widget.order['payment_method_title'],style: TextStyle(color: Color(0xFFA39597)))),
                //         ]),
                //         DataRow(cells: [
                //           DataCell(Text('Total',
                //               style: TextStyle(
                //                   color: Color(0xFFA39597),
                //                   fontSize: 15, fontWeight: FontWeight.bold))),
                //           DataCell(Text('')),
                //           DataCell(Text(items[index]['total'].toString(),style: TextStyle(color: Color(0xFFA39597)))),
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
                                    color: Color(0xFFA39597),
                                    fontSize: 16,
                                  )),
                              Text("Color",
                                  style: TextStyle(
                                    color: Color(0xFFA39597),
                                    fontSize: 16,
                                  )),
                              Text("Size",
                                  style: TextStyle(
                                    color: Color(0xFFA39597),
                                    fontSize: 16,
                                  )),
                              Text("Price",
                                  style: TextStyle(
                                    color: Color(0xFFA39597),
                                    fontSize: 16,
                                  )),
                              Text("Total price",
                                  style: TextStyle(
                                    color: Color(0xFFA39597),
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
                                    color: Color(0xFFA39597),
                                    fontSize: 16,
                                  )),
                              Text(items[index]['color'].toString(),
                                  style: TextStyle(
                                    color: Color(0xFFA39597),
                                    fontSize: 16,
                                  )),
                              Text(items[index]['size'].toString(),
                                  style: TextStyle(
                                    color: Color(0xFFA39597),
                                    fontSize: 16,
                                  )),
                              Text(items[index]['total_price'].toString(),
                                  style: TextStyle(
                                    color: Color(0xFFA39597),
                                    fontSize: 16,
                                  )),
                              Text(widget.order['total_amount'].toString(),
                                  style: TextStyle(
                                    color: Color(0xFFA39597),
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
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.white),
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
              body: Column(
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
                      TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.white),
                    ),
                  ),
                  Align( alignment: Alignment.centerLeft,
                    child: Text(
                      widget.order['first_name'] +widget.order['last_name']+",",
                      style:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Color(0xFFA39597)),
                    ),
                  ),
                  Align( alignment: Alignment.centerLeft,
                    child: Text(
                      widget.order['address_1']+",",
                      style:
                      TextStyle(fontSize: 17,color: Color(0xFFA39597)),
                    ),
                  ),
                  Align( alignment: Alignment.centerLeft,
                    child: Text(
                      widget.order['city']+",",
                      style:
                      TextStyle(fontSize: 17, color: Color(0xFFA39597)),
                    ),
                  ),
                  Align( alignment: Alignment.centerLeft,
                    child: Text(
                      widget.order['state']+",",
                      style:
                      TextStyle(fontSize: 17, color: Color(0xFFA39597)),
                    ),
                  ),
                  Align( alignment: Alignment.centerLeft,
                    child: Text(
                      widget.order['postcode']+",",
                      style:
                      TextStyle(fontSize: 17, fontWeight: FontWeight.bold,color: Color(0xFFA39597)),
                    ),
                  ),
                  Align( alignment: Alignment.centerLeft,
                    child: Text(
                      widget.order['phone'],
                      style:
                      TextStyle(fontSize: 17,color: Color(0xFFA39597)),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Align( alignment: Alignment.centerLeft,
                    child: Text(
                      "Payment type:"+" "+widget.order['payment_method'].toString(),
                      style:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Align( alignment: Alignment.centerLeft,
                    child: Text(
                      "Total amount:"+" \$"+widget.order['total_amount'].toString(),
                      style:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.green),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(height: 2,color: Colors.orange,),
                  Expanded(
                    child: ListView.builder(itemCount: items.length,itemBuilder: (context, index) {
                      return Column(
                        children: [
                          SizedBox(height: 10,),
                          Align( alignment: Alignment.centerLeft,
                            child: Text(
                              "Product Details",
                              style:
                              TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.white),
                            ),
                          ),
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
                                          color: Color(0xFFA39597),
                                          fontSize: 16,
                                        )),
                                    Text("Color",
                                        style: TextStyle(
                                          color: Color(0xFFA39597),
                                          fontSize: 16,
                                        )),
                                    Text("Size",
                                        style: TextStyle(
                                          color: Color(0xFFA39597),
                                          fontSize: 16,
                                        )),
                                    Text("Total price",
                                        style: TextStyle(
                                          color: Color(0xFFA39597),
                                          fontSize: 16,
                                        )),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(items[index]['quantity'].toString(),
                                        style: TextStyle(
                                          color: Color(0xFFA39597),
                                          fontSize: 16,
                                        )),
                                    Text(items[index]['color'].toString(),
                                        style: TextStyle(
                                          color: Color(0xFFA39597),
                                          fontSize: 16,
                                        )),
                                    Text(items[index]['size'].toString(),
                                        style: TextStyle(
                                          color: Color(0xFFA39597),
                                          fontSize: 16,
                                        )),
                                    Text(items[index]['total_price'].toString(),
                                        style: TextStyle(
                                          color: Color(0xFFA39597),
                                          fontSize: 16,
                                        )),
                                  ],
                                )
                              ],

                            ),
                          ),
                          SizedBox(height: 10,),
                          Container(height: 1,color: Colors.orange,),
                        ],
                      );
                    }
                    ),
                  ),
                ],
              )
          ),
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
}
