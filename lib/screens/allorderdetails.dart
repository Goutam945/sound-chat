import 'package:flutter/material.dart';
import 'package:sound_chat/common/index.dart';

class AllOrderlist extends StatefulWidget {
  @override
  _AllOrderlistState createState() => _AllOrderlistState();
}

class _AllOrderlistState extends State<AllOrderlist> {
  bool play = true;
  // dynamic data;
  var superherosLength;
  String email;
  String name;
  int id;
  var a;
  @override
  void initState() {
    super.initState();
    _loadSavedData().then((value) => a = createAllOrderState(id, context));
    //a = createAllOrderState(1079, context);
  }

  Future _loadSavedData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      if (sharedPreferences.getString('email') != null &&
          sharedPreferences.getString('email').isNotEmpty) {
        email = sharedPreferences.getString('email');
        name = sharedPreferences.getString('name');
        id = sharedPreferences.getInt('id');
      }
    });
  }

  String getStatus(String status) {
    switch (status) {
      case "0":
        return "Prepared";

        break;

      case "1":
        return "Shipped";

        break;
      case "2":
        return "Dellivred";

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
    // if (Provider.of<AllorderResponse>(context, listen: false).data != null)
    //   data = Provider.of<AllorderResponse>(context, listen: false).data['data'];
    return SafeArea(
      child: Stack(
        children: [
          Scaffold(
              extendBody: false,
              backgroundColor: Colors.black,
              appBar: PreferredSize(
                  preferredSize: Size.fromHeight(55), child: Backappbar()),
              body: FutureBuilder(
                  future: a,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List data = snapshot.data.data['data'];

                      if (data.isNotEmpty)
                        return
                            // ListView.builder(
                            //     itemCount: data.length,
                            //     itemBuilder: (context, index) {
                            //       return Card(
                            //         color: Color(0xFF252525),
                            //         child: ListTile(
                            //           onTap: () {
                            //             Navigator.of(context).push(
                            //                 MaterialPageRoute(
                            //                     builder: (context) =>
                            //                         Orderdeatail(data[index])));
                            //           },
                            //           title: Text(
                            //             "Order Id  " +
                            //                 data[index]['order_id'].toString(),
                            //             style: TextStyle(
                            //                 color: Colors.white,
                            //                 fontFamily: fontfamily),
                            //           ),
                            //           subtitle: Text(
                            //               data[index]['createdAt']
                            //                   .toString()
                            //                   .split("T")[0],
                            //               style: TextStyle(
                            //                   color: Colors.white,
                            //                   fontFamily: fontfamily)),
                            //           leading: Image.asset(
                            //             'assets/soundpic.png',
                            //             fit: BoxFit.fill,
                            //           ),
                            //           trailing: Icon(
                            //             Icons.arrow_forward_ios_outlined,
                            //             color: Colors.white,
                            //           ),
                            //         ),
                            //       );
                            //     });

                            ListView.builder(
                                itemCount: data.length,
                                itemBuilder: (context, j) {
                                  String status =
                                      getStatus(data[j]['order_status']);
                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  Orderdeatail(data[j])));
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.only(top: 5),
                                      color: Colors.white10,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: 80,
                                            child: Image.asset(
                                              'assets/soundpic.png',
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          Expanded(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Order Id  " +
                                                      data[j]['order_id']
                                                          .toString(),
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 17,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontFamily: fontfamily),
                                                ),
                                                Text(
                                                  data[j]['createdAt']
                                                      .toString()
                                                      .split("T")[0],
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 14,
                                                      fontFamily: fontfamily),
                                                ),
                                                Text(
                                                  "status: $status",
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontFamily: fontfamily,
                                                      color: Colors.white),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                });

                      if (data.isEmpty)
                        return Center(
                          child: Text(
                            "No Orders",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        );
                    }
                    if (snapshot.hasError)
                      return Errorwidget(
                        onTap: createAllOrderState(id, context),
                      );
                    return Center(child: CircularProgressIndicator());
                  })),
          Positioned(
            top: AppBar().preferredSize.height * 0.02,
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
