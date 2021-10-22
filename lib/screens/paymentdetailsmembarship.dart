/*import 'package:sound_chat/common/index.dart';
import 'package:http/http.dart' as http;

class PaymentDetailsMember extends StatefulWidget {
  final subscription, uid, lid;

  PaymentDetailsMember(this.subscription, this.uid, this.lid);

  @override
  _PaymentDetailsMemberPageState createState() =>
      _PaymentDetailsMemberPageState();
}

class _PaymentDetailsMemberPageState extends State<PaymentDetailsMember> {
  final _stripePayment = FlutterStripePayment();
  final String publicationKey =
      'pk_test_51IcrCaSGgp78HSWo97V4Z9xHkZ8aYfbJJwA588p5XxmMGQLbESkrNASsxZ5jZlpqUd7xluY1DDkwaJrsarf5XSJt00jZ0YKVIm';
  final String secretKey =
      'sk_test_51IcrCaSGgp78HSWonqKdKI1a4DBeu3sSN44Yb6kR2yg4XzAsll1AflVCP8fEbhf7dleQj2pjf89QKwZ9EtN9jvWn00h0a5NKH3';
  PaymentResponse _paymentMethod;
  String _paymentMethodId;
  String _errorMessage = "";
  String clientSecret;
  PaymentResponse paymentResponse1;
  //String _status;
  String paymentMethodId;
  String paymentIntent;
  final TextEditingController _coupon = TextEditingController();

  Future<void> addCard() async {
    var paymentResponse = await _stripePayment.addPaymentMethod();
    // _status = paymentResponse.status.toString();
    setState(() {
      if (paymentResponse.status == PaymentResponseStatus.succeeded) {
        _paymentMethodId = paymentResponse.paymentMethodId;
        _paymentMethod = paymentResponse;
        createIntent(double.parse(widget.subscription['plan_fee']));
      } else {
        _errorMessage = paymentResponse.errorMessage;
      }
    });
  }

  Future<void> createIntent(amount) async {
    var url = Uri.parse('https://api.stripe.com/v1/payment_intents');
    var response = await http.post(url,
        headers: {'Authorization': 'Bearer $secretKey'},
        encoding: Encoding.getByName('x-www-form-urlencoded'),
        body: {'amount': '${(amount * 100).round()}', 'currency': 'INR'});
    print('Response status: ${response.statusCode}');
    if (response.statusCode == 200) {
      print('Response body: ${response.body}');
      dynamic data = json.decode(response.body);
      setState(() {
        clientSecret = data['client_secret'];
        paymentIntent = data['id'];
        print(clientSecret);
        print("GOUTAM" + paymentIntent);
      });
      authPayment(double.parse(widget.subscription['plan_fee']));
    } else {
      throw Exception(response.body);
    }
  }

  Future<void> authPayment(amount) async {
    await http.post(
        Uri.parse(
            "https://api.stripe.com/v1/payment_intents/$paymentIntent/confirm"),
        headers: {'Authorization': 'Bearer $secretKey'},
        body: {'payment_method': _paymentMethodId}).then((response) {
      print(response.body);

      if (response.statusCode == 200) {
        Map data = json.decode(response.body);
        String status = data['status'];
        if (status == 'requires_action') {
          String url = data['next_action']['use_stripe_sdk']['stripe_js'];
          launch(url, forceWebView: true, enableJavaScript: true).then((value) {
            print(value);
            if (status == 'succeeded') {
              String txnId = data['charges']['data'][0]["balance_transaction"];
              createSubscriptionState(
                  widget.uid, widget.lid, status, txnId, context);
              showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                        content: Column(
                          children: [
                            Text("Status: " + status),
                            Text("Balance transactionid: " + txnId),
                          ],
                        ),
                        actions: <Widget>[
                          ElevatedButton(
                            child: Text('Login page'),
                            onPressed: () {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) => NewLogin()));
                            },
                          ),
                        ],
                      ));
            } else {
              showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                        content: Text(_errorMessage.toString()),
                      ));
            }
          });
        }
      } else {
        Toast.show("server error", context,
            duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
        throw Exception(response.body);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _stripePayment.setStripeSettings(publicationKey);
    _stripePayment.onCancel = () {
      print("the payment form was cancelled");
    };
  }

  @override
  Widget build(BuildContext context) {
    print(widget.lid.toString() + "       " + widget.uid.toString());
    return SafeArea(
      child: Stack(children: [
        Scaffold(
          backgroundColor: Colors.black,
          body: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [Color(0xFF3F535E), Color(0xFF3A432E)])),
            child: ListView(
              children: [
                SizedBox(
                  height: 40,
                ),
                Center(
                    child: Text(
                  "Member Registration",
                  style: TextStyle(
                      fontSize: 19,
                      color: Color(0xFFE18D13),
                      fontWeight: FontWeight.bold),
                )),
                SizedBox(
                  height: 10,
                ),
                Center(
                    child: Text(
                  "Subscription Summary",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14, color: Colors.white),
                )),
                SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextFormField(
                    controller: _coupon,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.white, width: 2.0),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.white, width: 2.0),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.white, width: 2.0),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.white, width: 2.0),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      labelText: "Coupon Code",
                      labelStyle: TextStyle(
                        color: Colors.white,
                      ),
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.white, width: 2.0),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      hintText: 'Coupon Code:',
                      hintStyle: TextStyle(color: Colors.white),
                      prefixIcon: Icon(
                        Icons.card_giftcard,
                        color: Color(0xFFA6B3BC),
                      ),
                    ),
                    // controller: _coupon,
                  ),
                ),
                SizedBox(
                  height: 60,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    "Payment Details",
                    style: TextStyle(
                        fontSize: 19,
                        color: Colors.white,
                        fontFamily: fontfamily),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                    height: 2,
                    color: Color(0xFF8E0E14),
                    margin: EdgeInsets.only(left: 15, right: 15)),
                SizedBox(
                  height: 10,
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
                          Text("${widget.subscription['plan_type']}:",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontFamily: fontfamily,
                              )),
                          Text("me:",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontFamily: fontfamily,
                              )),
                          Text("Discount:",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontFamily: fontfamily,
                              )),
                          Text("Final Price:",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontFamily: fontfamily,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("\$${widget.subscription['plan_fee']} USD",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontFamily: fontfamily,
                              )),
                          Text("\$0.00 USD",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontFamily: fontfamily,
                              )),
                          Text("",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontFamily: fontfamily,
                              )),
                          Text("\$${widget.subscription['plan_fee']} USD",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontFamily: fontfamily,
                                  fontWeight: FontWeight.bold)),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 80,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        // addCard().whenComplete(() => createIntent(
                        //         double.parse(widget.subscription['plan_fee']))
                        //     .whenComplete(() => authPayment(double.parse(
                        //         widget.subscription['plan_fee']))));
                        addCard();
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color: Colors.white)),
                        child: Center(
                          child: Text(
                            'Pay \$${widget.subscription['plan_fee']}',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}*/
// import 'package:flutter_stripe_payment/flutter_stripe_payment.dart';

import 'package:sound_chat/api/subscription_approve_user.dart';
import 'package:sound_chat/common/faileddialog.dart';
import 'package:sound_chat/common/index.dart';
import 'package:sound_chat/stripe_api/create_customer.dart';
import 'package:sound_chat/stripe_api/create_subcription.dart';
import 'package:sound_chat/stripe_api/get_coupon.dart';
import 'package:sound_chat/stripe_api/get_invoiceurl.dart';
import 'package:sound_chat/stripe_api/get_subcription_status.dart';
import 'package:stripe_payment/stripe_payment.dart';

class PaymentDetailsMember extends StatefulWidget {
  final plan, uid, lid, productname, firstname, lastname, email, phone;

  PaymentDetailsMember(this.plan, this.uid, this.lid, this.productname,
      this.firstname, this.lastname, this.email, this.phone);

  @override
  _PaymentDetailsMemberPageState createState() =>
      _PaymentDetailsMemberPageState();
}

class _PaymentDetailsMemberPageState extends State<PaymentDetailsMember>
    with WidgetsBindingObserver {
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // Fluttertoast.showToast(msg: state.toString());
    print('AppLifeCycle State: ' + state.toString());
    switch (state) {
      case AppLifecycleState.resumed:
        setState(() {
          isloding = true;
        });
        createSubscriptionStatusState(context: context, subscriptionid: subid)
            .then((value) {
          String status = value.data['status'];
          String customerid = value.data['customer'];
          String planid = value.data['items']['data'][0]['plan']['id'];
          String invoiceid = value.data['latest_invoice'];
          String amount =
              "${value.data['items']['data'][0]['plan']['amount'] / 100}";
          String currency = value.data['items']['data'][0]['plan']['currency'];
          String plantype = value.data['items']['data'][0]['plan']['interval'];
          String subscriptionmethod = value.data['collection_method'];
          String subscriptionid = value.data['id'];
          String startdate = DateTime.fromMillisecondsSinceEpoch(
                  value.data['current_period_start'] * 1000)
              .toString();
          String enddate = DateTime.fromMillisecondsSinceEpoch(
                  value.data['current_period_end'] * 1000)
              .toString();

          if (status == "active") {
            showDailog();
            createSubscriptionState(
                uid: widget.uid,
                lid: planid,
                subscriptionid: subscriptionid,
                subscriptionmethod: subscriptionmethod,
                customerid: customerid,
                plantype: plantype,
                amount: amount,
                currencytype: currency,
                invoiceid: invoiceid,
                currentdate: startdate,
                expireddate: enddate,
                status: status,
                level: widget.productname['name'],
                context: context);
          } else if (status == 'incomplete') {
            showpendingpaymentdialog();
          }
        }).whenComplete(() {
          setState(() {
            isloding = false;
          });
        });
        break;
      default:
        break;
    }
  }

  String _paymentMethodId;
  String clientSecret;
  var paymentResponse1;
  String paymentMethodId;
  String subid;
  bool isloding = false;
  String urlauthantication;
  final TextEditingController _coupon = TextEditingController();
  double discount = 0;
  String couponcode = "";
  bool islogin = false;

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
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => islogin ? MyAccount() : NewLogin()));
      },
    )..show();
  }

  showpendingpaymentdialog() {
    AwesomeDialog(
      dismissOnTouchOutside: false,
      context: context,
      dialogType: DialogType.WARNING,
      animType: AnimType.BOTTOMSLIDE,
      btnOkColor: Colors.orange,
      btnOkText: "Authanticate",
      title: 'Panding Payment',
      desc: 'Click to authanticate payment',
      btnOkOnPress: () {
        launch(urlauthantication);
      },
    )..show();
  }

  Future<void> addCard() async {
    PaymentMethod paymentResponse =
        await StripePayment.paymentRequestWithCardForm(CardFormPaymentRequest())
            .onError((error, stackTrace) {
      print(error);
      return faileddialog(error, context);
    });
    _paymentMethodId = paymentResponse.id;
    print("PAYMENTTTT" + paymentResponse.id.toString());
    setState(() {
      isloding = true;
    });
    createcustomerState(
      context: context,
      firstname: widget.firstname,
      lastname: widget.lastname,
      email: widget.email,
      phone: widget.phone,
      paymentMethod: _paymentMethodId,
    ).then((value) {
      String customerid = value.data['id'];
      createSubscriptionstripeState(
        context: context,
        customer: customerid,
        priceid: widget.lid,
        coupon: couponcode,
      ).then((value) {
        String status = value.data['status'];
        subid = value.data['id'];

        if (status == 'incomplete') {
          String invoiceid = value.data['latest_invoice'];
          createInvoiceState(context: context, invoiceid: invoiceid)
              .then((value) {
            urlauthantication = value.data['hosted_invoice_url'];
            setState(() {
              isloding = false;
            });
            launch(urlauthantication);
          });
        } else if (status == 'active') {
          String status = value.data['status'];
          String customerid = value.data['customer'];
          String planid = value.data['items']['data'][0]['plan']['id'];
          String invoiceid = value.data['latest_invoice'];
          String amount =
              "${value.data['items']['data'][0]['plan']['amount'] / 100}";
          String currency = value.data['items']['data'][0]['plan']['currency'];
          String plantype = value.data['items']['data'][0]['plan']['interval'];
          String subscriptionmethod = value.data['collection_method'];
          String subscriptionid = value.data['id'];
          String startdate = DateTime.fromMillisecondsSinceEpoch(
                  value.data['current_period_start'] * 1000)
              .toString();
          String enddate = DateTime.fromMillisecondsSinceEpoch(
                  value.data['current_period_end'] * 1000)
              .toString();
          createSubscriptionState(
              uid: widget.uid,
              lid: planid,
              subscriptionid: subscriptionid,
              subscriptionmethod: subscriptionmethod,
              customerid: customerid,
              plantype: plantype,
              amount: amount,
              currencytype: currency,
              invoiceid: invoiceid,
              currentdate: startdate,
              expireddate: enddate,
              status: status,
              level: widget.productname['name'],
              context: context);
          showDailog();
        }
      });
    }).whenComplete(() {
      setState(() {
        isloding = false;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    StripePayment.setOptions(StripeOptions(
        publishableKey: publicationKey,
        merchantId: "YOUR_MERCHANT_ID",
        androidPayMode: 'test'));
    checklogin();
  }

  checklogin() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    if (sharedPreferences.getBool('islogin') != null) {
      islogin = sharedPreferences.getBool("islogin");
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.lid.toString() + "       " + widget.uid.toString());
    return SafeArea(
      child: Stack(children: [
        Scaffold(
          backgroundColor: Colors.black,
          body: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [Color(0xFF3F535E), Color(0xFF3A432E)])),
            child: ListView(
              children: [
                SizedBox(
                  height: 40,
                ),
                Center(
                    child: Text(
                  "Member Registration",
                  style: TextStyle(
                      fontSize: 19,
                      color: Color(0xFFE18D13),
                      fontWeight: FontWeight.bold),
                )),
                SizedBox(
                  height: 10,
                ),
                Center(
                    child: Text(
                  "Subscription Summary",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14, color: Colors.white),
                )),
                SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextFormField(
                    controller: _coupon,
                    onChanged: (value) {
                      createCouponState(context: context, couponid: value)
                          .then((data) {
                        setState(() {
                          couponcode = value;
                          discount = data.data['percent_off'];
                        });
                      }).onError((error, stackTrace) {
                        setState(() {
                          discount = 0;
                        });
                      });
                    },
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.white, width: 2.0),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.white, width: 2.0),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.white, width: 2.0),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.white, width: 2.0),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      labelText: "Coupon Code",
                      labelStyle: TextStyle(
                        color: Colors.white,
                      ),
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.white, width: 2.0),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      hintText: 'Coupon Code:',
                      hintStyle: TextStyle(color: Colors.white),
                      prefixIcon: Icon(
                        Icons.card_giftcard,
                        color: Color(0xFFA6B3BC),
                      ),
                    ),
                    // controller: _coupon,
                  ),
                ),
                SizedBox(
                  height: 60,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    "Payment Details",
                    style: TextStyle(
                        fontSize: 19,
                        color: Colors.white,
                        fontFamily: fontfamily),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                    height: 2,
                    color: Color(0xFF8E0E14),
                    margin: EdgeInsets.only(left: 15, right: 15)),
                SizedBox(
                  height: 10,
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
                          Text("${widget.productname['name']}:",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontFamily: fontfamily,
                              )),
                          Text("me:",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontFamily: fontfamily,
                              )),
                          Text("Discount:",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontFamily: fontfamily,
                              )),
                          Text("Final Price:",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontFamily: fontfamily,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("\$${widget.plan['amount'] / 100} USD",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontFamily: fontfamily,
                              )),
                          Text("\$0.00 USD",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontFamily: fontfamily,
                              )),
                          Text(
                              "${(widget.plan['amount'] / 100) * discount / 100}",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontFamily: fontfamily,
                              )),
                          Text(
                              "\$${widget.plan['amount'] / 100 - (widget.plan['amount'] / 100) * discount / 100} USD",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontFamily: fontfamily,
                                  fontWeight: FontWeight.bold)),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 80,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        /* addCard().whenComplete(() => createIntent(
                                double.parse(widget.subscription['plan_fee']))
                            .whenComplete(() => authPayment(double.parse(
                                widget.subscription['plan_fee']))));*/

                        addCard();
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color: Colors.white)),
                        child: Center(
                          child: Text(
                            'Pay \$${widget.plan['amount'] / 100 - (widget.plan['amount'] / 100) * discount / 100}',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        if (isloding)
          Center(
            child: CircularProgressIndicator(),
          )
      ]),
    );
  }
}
