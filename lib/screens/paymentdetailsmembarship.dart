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
import 'dart:ffi';

import 'package:sound_chat/api/subscription_approve_user.dart';
import 'package:sound_chat/common/index.dart';
import 'package:http/http.dart' as http;
import 'package:stripe_payment/stripe_payment.dart';

class PaymentDetailsMember extends StatefulWidget {
  final subscription, uid, lid;

  PaymentDetailsMember(this.subscription, this.uid, this.lid);

  @override
  _PaymentDetailsMemberPageState createState() =>
      _PaymentDetailsMemberPageState();
}

class _PaymentDetailsMemberPageState extends State<PaymentDetailsMember> {
  final String publicationKey =
      'pk_test_51IcrCaSGgp78HSWo97V4Z9xHkZ8aYfbJJwA588p5XxmMGQLbESkrNASsxZ5jZlpqUd7xluY1DDkwaJrsarf5XSJt00jZ0YKVIm';
  final String secretKey =
      'sk_test_51IcrCaSGgp78HSWonqKdKI1a4DBeu3sSN44Yb6kR2yg4XzAsll1AflVCP8fEbhf7dleQj2pjf89QKwZ9EtN9jvWn00h0a5NKH3';

  String _paymentMethodId;
  String clientSecret;
  var paymentResponse1;
  String paymentMethodId;
  final TextEditingController _coupon = TextEditingController();

  Void showDailog() {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.SUCCES,
      animType: AnimType.BOTTOMSLIDE,
      btnOkColor: Colors.orange,
      title: 'Succeeded Payment',
      desc: 'Thank you',
      btnOkOnPress: () {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => NewLogin()));
      },
    )..show();
  }

  Future<void> addCard() async {
    PaymentMethod paymentResponse =
        await StripePayment.paymentRequestWithCardForm(
            CardFormPaymentRequest());
    _paymentMethodId = paymentResponse.id;
    print("PAYMENTTTT" + paymentResponse.id.toString());
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
        print(clientSecret);
      });
    } else {
      throw Exception(response.body);
    }
  }

  Future<void> authPayment(amount) async {
    StripePayment.confirmPaymentIntent(
      PaymentIntent(
        clientSecret: clientSecret,
        paymentMethodId: _paymentMethodId,
      ),
    ).then((paymentIntent) {
      print("GOUTAM1" + paymentIntent.status);
      print("GOUTAM2" + paymentIntent.paymentIntentId.toString());
      print("GOUTAM3" + _paymentMethodId.toString());

      if (paymentIntent.status == "succeeded") {
        print("PRINT" +
            widget.uid.toString() +
            widget.lid.toString() +
            paymentIntent.status +
            _paymentMethodId.toString());
        createSubscriptionState(widget.uid, widget.lid, paymentIntent.status,
            _paymentMethodId.toString(), context);
        paymentResponse1 = paymentIntent;
        showDailog();
        /*showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  content: Column(
                    children: [
                      Text("Status: " + paymentIntent.status.toString()),
                      Text("paymentIntentId: " +
                          paymentIntent.paymentIntentId.toString()),
                      // Text("paymentMethodId: " +
                      //     paymentIntent.paymentMethodId.toString()),
                    ],
                  ),
                  actions: <Widget>[
                    ElevatedButton(
                      child: Text('Login page'),
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => NewLogin()));
                      },
                    ),
                  ],
                ));*/
        print("SUCESSSFUL");
      }
    }).onError((error, stackTrace) {
      print("ERRORRR" + error.toString());
      AwesomeDialog(
        context: context,
        dialogType: DialogType.ERROR,
        animType: AnimType.BOTTOMSLIDE,
        btnOkColor: Colors.orange,
        title: 'Payment Faild',
        desc: error.toString(),
        btnOkOnPress: () {
          Navigator.of(context).pop();
        },
      )..show();
    }).catchError((e) {
      print('Got error: $e');
      return true;
    });
  }

  @override
  void initState() {
    super.initState();
    StripePayment.setOptions(StripeOptions(
        publishableKey: publicationKey,
        merchantId: "YOUR_MERCHANT_ID",
        androidPayMode: 'test'));
  }

  /* @override
  Widget build(BuildContext context) {
    print(widget.lid.toString() + "       " + widget.uid.toString());
    return SafeArea(
      child: Stack(children: [
        Scaffold(
          backgroundColor: Colors.black,
          body: ListView(
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
                style: TextStyle(fontSize: 16, color: Color(0xFFA79A9A)),
              )),
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TextFormField(
                  controller: _coupon,
                  style: TextStyle(color: Color(0xFFA79A9A)),
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
                      color: Color(0xFFA79A9A),
                    ),
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.white, width: 2.0),
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    hintText: 'Coupon Code:',
                    hintStyle: TextStyle(color: Color(0xFFA79A9A)),
                    suffixIcon: Icon(
                      Icons.card_giftcard,
                      color: Color(0xFFA79A9A),
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
                  style: TextStyle(fontSize: 19, color: Colors.white),
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
                              color: Color(0xFF535353),
                              fontSize: 15,
                              fontFamily: 'Montserrat1',
                            )),
                        Text("me:",
                            style: TextStyle(
                              color: Color(0xFF535353),
                              fontSize: 15,
                              fontFamily: 'Montserrat1',
                            )),
                        Text("Discount:",
                            style: TextStyle(
                              color: Color(0xFF535353),
                              fontSize: 15,
                              fontFamily: 'Montserrat1',
                            )),
                        Text("Final Price:",
                            style: TextStyle(
                                color: Color(0xFF535353),
                                fontSize: 18,
                                fontFamily: 'Montserrat1',
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("\$${widget.subscription['plan_fee']} USD",
                            style: TextStyle(
                              color: Color(0xFF535353),
                              fontSize: 15,
                              fontFamily: 'Montserrat1',
                            )),
                        Text("\$0.00 USD",
                            style: TextStyle(
                              color: Color(0xFF535353),
                              fontSize: 15,
                              fontFamily: 'Montserrat1',
                            )),
                        Text("",
                            style: TextStyle(
                              color: Color(0xFF535353),
                              fontSize: 15,
                              fontFamily: 'Montserrat1',
                            )),
                        Text("\$${widget.subscription['plan_fee']} USD",
                            style: TextStyle(
                                color: Color(0xFF535353),
                                fontSize: 18,
                                fontFamily: 'Montserrat1',
                                fontWeight: FontWeight.bold)),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 80,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 80),
                child: SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Color(0xFF8E0E14),
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0),
                        )),
                    onPressed: () {
                      addCard().whenComplete(() => createIntent(
                              double.parse(widget.subscription['plan_fee']))
                          .whenComplete(() => authPayment(double.parse(widget
                                  .subscription[
                              'plan_fee']))
                              ));
              
                    },
                    child: Text(
                      'Pay \$${widget.subscription['plan_fee']}',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }*/
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
                        addCard().whenComplete(() => createIntent(
                                double.parse(widget.subscription['plan_fee']))
                            .whenComplete(() => authPayment(double.parse(
                                widget.subscription['plan_fee']))));

                        //addCard();

                        // StripePayment.createSourceWithParams(SourceParams(
                        //   type: 'ideal',
                        //   amount: 1099,
                        //   currency: 'inr',
                        //   returnURL: 'example://stripe-redirect',
                        // )).then((source) {
                        //   print('Received ${source.sourceId}');
                        //   setState(() {
                        //     var _source = source;
                        //   });
                        // }).catchError((e) {
                        //   print('Got error: $e');
                        //   return true;
                        // });
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
}
