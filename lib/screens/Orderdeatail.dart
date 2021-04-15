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
    items = widget.order['line_items'];
    //   if(Provider.of<ScheduleResponse>(context, listen: false).data!=null)
    // superherosLength = Provider.of<ScheduleResponse>(context, listen: false).data['data'];
    return SafeArea(
      child: Stack(
        children: [
          Scaffold(
              extendBody: false,
              // backgroundColor: Colors.black,
              appBar: AppBar(
                backgroundColor: Color(0xFFE18D13),
                backwardsCompatibility: true,
              ),
              body: ListView.builder(itemBuilder: (context, index) {
                return Column(
                  children: [
                  SizedBox(height: 20),
                    Center(
                        child: Text(
                      '[Order#${items[index]['id']}]',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    )),
                    DataTable(
                      columns: [
                        DataColumn(
                            label: Text('Product',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold))),
                        DataColumn(
                            label: Text('Quantity',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold))),
                        DataColumn(
                            label: Text('Price',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold))),
                      ],
                      rows: [
                        DataRow(cells: [
                          DataCell(Text(items[index]['name'])),
                          DataCell(Text(items[index]['quantity'].toString())),
                          DataCell(Text(items[index]['price'].toString())),
                        ]),
                        DataRow(cells: [
                          DataCell(Text('Subtotal',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold))),
                          DataCell(Text('')),
                          DataCell(Text(items[index]['subtotal'].toString())),
                        ]),
                        DataRow(cells: [
                          DataCell(Text('Shipping',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold))),
                          DataCell(Text('')),
                          DataCell(Text(widget.order['shipping_tax'])),
                        ]),
                        DataRow(cells: [
                          DataCell(Text('Tax',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold))),
                          DataCell(Text('')),
                          DataCell(Text(items[index]['total_tax'].toString())),
                        ]),
                        DataRow(cells: [
                          DataCell(Text('Payment methode',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold))),
                          DataCell(Text('')),
                          DataCell(Text( widget.order['payment_method'])),
                        ]),
                        DataRow(cells: [
                          DataCell(Text('Total',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold))),
                          DataCell(Text('')),
                          DataCell(Text(items[index]['total'].toString())),
                        ]),
                      ],
                    ),
                  ],
                );
              })),
//          Positioned(
//            top: AppBar().preferredSize.height*0.2,
//            left: width * 0.39865,
//            child: SizedBox(
//              height: height * 0.13168,
//              width: width * 0.21875,
//              child: Image.asset(
//                'assets/soundpic.png',
//              ),
//            ),
//          ),
        ],
      ),
    );
  }
}
