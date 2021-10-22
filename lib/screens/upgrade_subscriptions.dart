import 'package:sound_chat/api/upgrade_subscription.dart';
import 'package:sound_chat/common/index.dart';
import 'package:sound_chat/screens/paymentdetailsmembarship.dart';
import 'package:sound_chat/stripe_api/cancel_subscription.dart';
import 'package:sound_chat/stripe_api/create_subcription.dart';
import 'package:sound_chat/stripe_api/get_invoiceurl.dart';
import 'package:sound_chat/stripe_api/get_plans.dart';
import 'package:sound_chat/stripe_api/get_product.dart';

class UpgradeSubscription extends StatefulWidget {
  // final customerid, subid, status, userid;
  // const UpgradeSubscription(
  //     {Key key, this.customerid, this.userid, this.subid, this.status})
  //     : super(key: key);
  @override
  _UpgradeSubscriptionState createState() => _UpgradeSubscriptionState();
}

class _UpgradeSubscriptionState extends State<UpgradeSubscription> {
  String levelId;
  //String user;
  String email, name, phone;
  int userid;
  dynamic membership;
  List productname = [];
  bool isloding = false;
  @override
  void initState() {
    super.initState();
    // getData();
    _loadSavedData();
    createplansState(context);
    //getproductname();
    createproductState(context).then((data) {
      setState(() {
        productname = data.data['data'];
        print(data);
      });
    });
    _loadSavedData().then(
        (value) => createSubcriptionlevalState(userid, context).then((value) {
              setState(() {
                membership = value.data['data'];
              });
            }));
  }

  // String getproductname() {
  //   createproductState(context).then((data) => productname = data.data['name']);
  //   return productname;
  // }

  _loadSavedData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      if (sharedPreferences.getString('email') != null &&
          sharedPreferences.getString('email').isNotEmpty) {
        email = sharedPreferences.getString('email');
        name = sharedPreferences.getString('name');
        phone = sharedPreferences.getString('phone');
        userid = sharedPreferences.getInt('id');
      }
    });
  }

  showDailog() {
    AwesomeDialog(
      dismissOnTouchOutside: false,
      context: context,
      dialogType: DialogType.SUCCES,
      animType: AnimType.BOTTOMSLIDE,
      btnOkColor: Colors.orange,
      title: 'Succeeded Payment',
      desc: 'Thank you',
      btnOkOnPress: () {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => HomeBottomBar()));
      },
    )..show();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var data1 = context.watch<Plans>().data;
    var data = (data1 != null) ? data1['data'] : [];
    return SafeArea(
      child: Stack(children: [
        Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            backgroundColor: Color(0xFF3F535E),
          ),
          body: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [Color(0xFF3F535E), Color(0xFF3A432E)])),
            child: Column(
              children: [
                SizedBox(
                  height: 40,
                ),
                Center(
                    child: Text(
                  "Upgrade Membership",
                  style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Montserrat1',
                      color: Color(0xFFE18D13),
                      fontWeight: FontWeight.bold),
                )),
                SizedBox(
                  height: 20,
                ),
                Center(
                    child: Text(
                  "Please choose a subscription plan to begin setting up your account.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 12,
                      fontFamily: 'Montserrat1',
                      color: Colors.white),
                )),
                SizedBox(
                  height: 20,
                ),
                productname.length > 0
                    ? Expanded(
                        child: ListView.builder(
                            itemCount: data.length,
                            itemBuilder: (context, i) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                child: Stack(
                                  children: [
                                    Positioned(
                                      bottom: 10,
                                      top: 10,
                                      left: 20,
                                      right: 20,
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            // user = data[i]['amount'].toString();
                                            levelId = data[i]['id'];
                                            isloding = true;
                                          });

                                          (membership != null)
                                              ? createSubscriptionstripeState(
                                                  context: context,
                                                  coupon: "",
                                                  customer:
                                                      membership['customer_id'],
                                                  priceid: levelId,
                                                ).then((value) {
                                                  String status =
                                                      value.data['status'];
                                                  //String subid = value.data['id'];

                                                  if (status == 'incomplete') {
                                                    String invoiceid = value
                                                        .data['latest_invoice'];
                                                    createInvoiceState(
                                                            context: context,
                                                            invoiceid:
                                                                invoiceid)
                                                        .then((value) {
                                                      String urlauthantication =
                                                          value.data[
                                                              'hosted_invoice_url'];
                                                      setState(() {
                                                        isloding = false;
                                                      });
                                                      launch(urlauthantication);
                                                    });
                                                  } else if (status ==
                                                      'active') {
                                                    String status =
                                                        value.data['status'];
                                                    String customerid =
                                                        value.data['customer'];
                                                    String planid =
                                                        value.data['items']
                                                                ['data'][0]
                                                            ['plan']['id'];
                                                    String invoiceid = value
                                                        .data['latest_invoice'];
                                                    String amount =
                                                        "${value.data['items']['data'][0]['plan']['amount'] / 100}";
                                                    String currency = value
                                                                .data['items']
                                                            ['data'][0]['plan']
                                                        ['currency'];
                                                    String plantype = value
                                                                .data['items']
                                                            ['data'][0]['plan']
                                                        ['interval'];
                                                    String subscriptionmethod =
                                                        value.data[
                                                            'collection_method'];
                                                    String subscriptionid =
                                                        value.data['id'];
                                                    String startdate = DateTime
                                                            .fromMillisecondsSinceEpoch(
                                                                value.data[
                                                                        'current_period_start'] *
                                                                    1000)
                                                        .toString();
                                                    String enddate = DateTime
                                                            .fromMillisecondsSinceEpoch(
                                                                value.data[
                                                                        'current_period_end'] *
                                                                    1000)
                                                        .toString();
                                                    createUpgradeSubscriptionState(
                                                            uid: userid,
                                                            lid: planid,
                                                            subscriptionid:
                                                                subscriptionid,
                                                            subscriptionmethod:
                                                                subscriptionmethod,
                                                            customerid:
                                                                customerid,
                                                            plantype: plantype,
                                                            amount: amount,
                                                            currencytype:
                                                                currency,
                                                            invoiceid:
                                                                invoiceid,
                                                            currentdate:
                                                                startdate,
                                                            expireddate:
                                                                enddate,
                                                            status: status,
                                                            level:
                                                                productname[i]
                                                                    ['name'],
                                                            context: context)
                                                        .then((value) {
                                                      int status =
                                                          value.data['status'];
                                                      if (status == 200 &&
                                                          membership[
                                                                  'stripe_status'] ==
                                                              'ACTIVE') {
                                                        cancelSubscriptionState(
                                                            context: context,
                                                            subscriptionid:
                                                                membership[
                                                                    'subscription_id']);
                                                      }
                                                    });
                                                    showDailog();
                                                  }
                                                }).whenComplete(() {
                                                  setState(() {
                                                    isloding = false;
                                                  });
                                                })
                                              : Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          PaymentDetailsMember(
                                                              data[i],
                                                              userid,
                                                              levelId,
                                                              productname[i],
                                                              name,
                                                              "",
                                                              email,
                                                              phone)));
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: Color(0xFF3F535E),
                                              borderRadius:
                                                  BorderRadius.circular(50)),
                                          child: Center(
                                            child: Text(
                                              // getproductname(
                                              //     data[i]['product'].toString()),
                                              // data[i]['amount'].toString(),
                                              productname[i]['name'],
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontFamily: 'Montserrat1',
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 70,
                                      height: 70,
                                      padding: EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                          color: Color(0xFFA6B3BC),
                                          borderRadius:
                                              BorderRadius.circular(50)),
                                      child: Container(
                                        padding: EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(50)),
                                        child: Container(
                                          padding: EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                              color: Color(0xFFA6B3BC),
                                              borderRadius:
                                                  BorderRadius.circular(50)),
                                          child: Container(
                                            padding: EdgeInsets.all(0),
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(50)),
                                            child: Center(
                                                child: Text(
                                              "${i + 1}",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            )),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }),
                      )
                    : Expanded(
                        child: Center(child: CircularProgressIndicator())),
              ],
            ),
          ),
        ),
        if (isloding)
          Center(
            child: CircularProgressIndicator(),
          ),
        Positioned(
          top: AppBar().preferredSize.height * 0.1,
          left: width * 0.39865,
          child: SizedBox(
            height: height * 0.13168,
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
