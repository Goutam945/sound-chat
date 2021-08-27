import 'package:flutter_stripe_payment/flutter_stripe_payment.dart';
import 'package:sound_chat/api/subscription_approve_user.dart';
import 'package:sound_chat/common/index.dart';
import 'package:http/http.dart' as http;

import 'NewLogin.dart';

class PaymentDetailsMember extends StatefulWidget {
  final subscription, uid, lid;

  PaymentDetailsMember(this.subscription,this.uid, this.lid);

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
  String _status;
  String paymentMethodId;
  final TextEditingController _coupon = TextEditingController();

  Future<void> addCard() async {
    var paymentResponse = await _stripePayment.addPaymentMethod();
    _status=paymentResponse.status.toString();
    setState(() {
      if (paymentResponse.status == PaymentResponseStatus.succeeded) {
        _paymentMethodId = paymentResponse.paymentMethodId;
        _paymentMethod = paymentResponse;
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
        print(clientSecret);
      });
    } else {
      throw Exception(response.body);
    }
  }

  Future<void> authPayment(amount) async {
    PaymentResponse paymentResponse = await _stripePayment.confirmPaymentIntent(
        clientSecret, _paymentMethodId, amount*100);
    setState(() {
      if (paymentResponse.status == PaymentResponseStatus.succeeded) {
        _paymentMethodId = paymentResponse.paymentMethodId;
        paymentMethodId = paymentResponse.paymentIntentId;
        print(widget.uid.toString()+widget.lid.toString()+_status+paymentMethodId.toString());
        createSubscriptionState(widget.uid,widget.lid,_status,paymentMethodId,context);
        paymentResponse1 = paymentResponse;
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
              content: Column(
                children: [
                  Text("Status: "+paymentResponse.status.toString()),
                  Text("paymentIntentId: "+paymentResponse.paymentIntentId.toString()),
                  Text("paymentMethodId: "+paymentResponse.toString()),
                ],
              ),
              actions: <Widget>[
                ElevatedButton(
                  child: Text('Login page'),
                  onPressed: () {
                    // Navigator.pushAndRemoveUntil(
                    //     context,
                    //     MaterialPageRoute(builder: (BuildContext context) => NewLogin()),
                    //     ModalRoute.withName('/')
                    // );
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => NewLogin()));
                  },
                ),
              ],
            ));
      } else {
        _errorMessage = paymentResponse.errorMessage;
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
              content: Text(_errorMessage.toString()),
            ));
      }
    });
  }

  Future<void> confirmAuth(amount) async {
    var paymentResponse = await _stripePayment.confirmPaymentIntent(
        clientSecret, _paymentMethodId, amount*100);
    setState(() {
      if (paymentResponse.status == PaymentResponseStatus.succeeded) {
        _paymentMethodId = paymentResponse.paymentMethodId;
        paymentMethodId = paymentResponse.paymentMethodId;
        createSubscriptionState(widget.uid,widget.lid,_status,paymentMethodId,context);
        setState(() {
          paymentResponse1 = paymentResponse;
        });
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
              content: Column(
                children: [
                  Text("Status: "+paymentResponse.status.toString()),
                  Text("paymentIntentId: "+paymentResponse.paymentIntentId.toString()),
                  Text("paymentMethodId: "+paymentResponse.paymentMethodId.toString()),
                ],
              ),
              actions: <Widget>[
                ElevatedButton(
                  child: Text('Login page'),
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => NewLogin()));
                  },
                ),
              ],
            ));
      } else {
        _errorMessage = paymentResponse.errorMessage;
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
              content: Text(_errorMessage.toString()),
            ));
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
    print(widget.lid.toString()+"       "+widget.uid.toString());
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
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
                child: SizedBox(height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Color(0xFF8E0E14),
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0),
                        )),
                    onPressed: () {
                      addCard().whenComplete(() => createIntent(double.parse(widget.subscription['plan_fee'])).whenComplete(() =>
                          authPayment(double.parse(widget.subscription['plan_fee'])) /*.whenComplete(() => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>(paymentResponse1.status == PaymentResponseStatus.succeeded)?SuccessScreen():FailedScreen())))*/));
                      // Navigator.of(context).push(
                      //     MaterialPageRoute(
                      //         builder: (context) =>
                      //             PaymentDetailsMembernext()));
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
  }
}