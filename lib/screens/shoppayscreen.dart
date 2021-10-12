/*import 'package:flutter_braintree/flutter_braintree.dart';
import 'package:sound_chat/Model/ProductModellist.dart';
import 'package:sound_chat/api/create_order.dart';
import 'package:sound_chat/common/index.dart';
import 'shopping.dart';
import 'package:flutter_stripe_payment/flutter_stripe_payment.dart';
import 'package:http/http.dart' as http;

class ShopPay extends StatefulWidget {
  final firstname,
      lastname,
      address1,
      address2,
      city,
      state,
      postcode,
      country,
      email,
      phone,
      shipname,
      shiplastname,
      shipaddress1,
      shipaddress2,
      shipcity,
      shipsate,
      shippostcode,
      shipcountry;

  ShopPay(
      this.firstname,
      this.lastname,
      this.address1,
      this.address2,
      this.city,
      this.state,
      this.postcode,
      this.country,
      this.email,
      this.phone,
      this.shipname,
      this.shiplastname,
      this.shipaddress1,
      this.shipaddress2,
      this.shipcity,
      this.shipsate,
      this.shippostcode,
      this.shipcountry,
      );

  @override
  _ShopPayState createState() => _ShopPayState();
}

class _ShopPayState extends State<ShopPay> {
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
  String radioItem = '';
  var cart;
  bool loader = false;
  List lineItems;
  int id;
  String paymentMethodTitle = '';
  bool setPaid;

  Future<void> addCard() async {
    var paymentResponse = await _stripePayment.addPaymentMethod();
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
        print("clientSecret: " + clientSecret);
      });
    } else {
      throw Exception(response.body);
    }
  }

  Future<void> authPayment(amount) async {
    var paymentResponse = await _stripePayment.confirmPaymentIntent(
        clientSecret, _paymentMethodId, amount * 100);
    setState(() {
      if (paymentResponse.status == PaymentResponseStatus.succeeded) {
        _paymentMethodId = paymentResponse.paymentMethodId;
        paymentResponse1 = paymentResponse;
        createOrder();
        // showDialog(
        //     context: context,
        //     builder: (context) => AlertDialog(
        //           content: Column(
        //             children: [
        //               Text("Status: " + paymentResponse.status.toString()),
        //               Text("paymentIntentId: " +
        //                   paymentResponse.paymentIntentId.toString()),
        //               Text("paymentMethodId: " + paymentResponse.toString()),
        //             ],
        //           ),
        //         ));
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
    _loadSavedData();
  }

  _loadSavedData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      if (sharedPreferences.getString('email') != null &&
          sharedPreferences.getString('email').isNotEmpty) {
        id = sharedPreferences.getInt('id');
      }
    });
  }

  stripePay(amount) async {
    addCard().whenComplete(
            () => createIntent(amount).whenComplete(() => authPayment(amount)));
  }

  createOrder() {
    createOrderState(
        widget.firstname,
        widget.lastname,
        widget.address1,
        widget.address2,
        widget.city,
        widget.state,
        widget.postcode,
        widget.country,
        widget.email.trim(),
        widget.phone,
        widget.shipname,
        widget.shiplastname,
        widget.shipaddress1,
        widget.shipaddress2,
        widget.shipcity,
        widget.shipsate,
        widget.shippostcode,
        widget.shipcountry,
        lineItems,
        id,
        paymentMethodTitle,
        setPaid,
        context)
        .whenComplete(() => showNonce())
        .whenComplete(() =>
        Provider.of<ProductModellist>(context, listen: false).removeAll());
  }

  static final String tokenizationKey = 'sandbox_8hxpnkht_kzdtzv2btm4p7s5j';

  void showNonce() {
    showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Success'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Column(
                  children: [
                    SizedBox(
                      height: 90,
                      width: 90,
                      child: Image.network(
                        'https://www.cntraveller.in/wp-content/themes/cntraveller/images/check-circle.gif',
                        fit: BoxFit.fill,
                      ),
                    ),
                    Text(
                      "Thank you for Shopping",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic),
                    )
                  ],
                ),
              ],
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              child: Text('Continue Shopping'),
              onPressed: () {
                Provider.of<ProductModellist>(context, listen: false)
                    .removeAll();
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => Shopping()));
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    cart = context.watch<ProductModellist>();
    //send data list produt id and quatity
    lineItems = [
      for (int i = 0; i < cart.cart1.length; i++)
        {"product_id": cart.cart1[i].id, "quantity": cart.cart1[i].quantity}
    ];
    print(lineItems);
    //end
    return SafeArea(
        child: Stack(children: [
          Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Color(0xFFE18D13),
              backwardsCompatibility: true,
            ),
            bottomNavigationBar: Container(
              height: height * 0.0731,
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.red),
                    onPressed: () {
                      // setState(() {
                      //   loader = false;
                      // });
                      if (id == null) {
                        Toast.show("Please Login before Shopping", context,
                            duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
                      } else if (radioItem == 'paypal') {
                        pay();
                      } else if (radioItem == 'stripe') {
                        stripePay(cart.sum1);
                      } else if (radioItem == 'cod') {
                        createOrder();
                      } else {
                        Toast.show("please select payment method", context,
                            duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
                      }
                    },
                    child: Text(
                      " Total Amount Pay:   \$" + cart.sum1.toString(),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic),
                    ),
                  ),
                ],
              ),
            ),
            body: Column(
              children: [
                SizedBox(
                  height: 50,
                  width: width,
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/visa.png",
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Image.asset(
                        "assets/mastercard.png",
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Image.asset(
                        "assets/discover.png",
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Image.asset(
                        "assets/paypal.png",
                      ),
                    ],
                  ),
                ),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Text("Payment Method",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Color(0xFF535353),
                                    fontSize: 20,
                                    fontFamily: 'Montserrat1',
                                    fontWeight: FontWeight.bold)),
                          ),
                          RadioListTile(
                            groupValue: radioItem,
                            title: Text('PayPal'),
                            value: 'paypal',
                            onChanged: (val) {
                              setState(() {
                                radioItem = val;
                                setPaid = true;
                                paymentMethodTitle =
                                'Direct Bank Transfer (PayPal)';
                                // pay();
                              });
                            },
                          ),
                          RadioListTile(
                            groupValue: radioItem,
                            title: Text('Credit Card (Stripe)'),
                            value: 'stripe',
                            onChanged: (val) {
                              setState(() {
                                radioItem = val;
                                setPaid = true;
                                paymentMethodTitle =
                                'Direct Bank Transfer (Stripe)';
                                // Strippay();
                              });
                            },
                          ),
                          RadioListTile(
                            groupValue: radioItem,
                            title: Text('Cash On Delivery'),
                            value: 'cod',
                            onChanged: (val) {
                              setState(() {
                                radioItem = val;
                                setPaid = false;
                                paymentMethodTitle = 'COD';
                              });
                            },
                          ),
                        ]))
              ],
            ),
          ),
        ]));
  }

  pay() async {
    var request = BraintreeDropInRequest(
      tokenizationKey: tokenizationKey,
      collectDeviceData: true,
      // googlePaymentRequest: BraintreeGooglePaymentRequest(
      //   totalPrice: '4.20',
      //   currencyCode: 'USD',
      //   billingAddressRequired: false,
      // ),
      paypalRequest: BraintreePayPalRequest(
        amount: cart.sum1.toString(),
        displayName: 'Example company',
      ),
      cardEnabled: true,
    );
    BraintreeDropInResult result = await BraintreeDropIn.start(request);
    if (result != null) {
      showNonce();
    }
  }
}*/

import 'package:sound_chat/common/faileddialog.dart';
import 'package:sound_chat/common/index.dart';
import 'package:http/http.dart' as http;
import 'package:stripe_payment/stripe_payment.dart';

class ShopPay extends StatefulWidget {
  final firstname,
      lastname,
      address1,
      address2,
      city,
      state,
      postcode,
      country,
      email,
      phone;

  ShopPay(
    this.firstname,
    this.lastname,
    this.address1,
    this.address2,
    this.city,
    this.state,
    this.postcode,
    this.country,
    this.email,
    this.phone,
  );

  @override
  _ShopPayState createState() => _ShopPayState();
}

class _ShopPayState extends State<ShopPay> {
  final String publicationKey =
      'pk_test_51IcrCaSGgp78HSWo97V4Z9xHkZ8aYfbJJwA588p5XxmMGQLbESkrNASsxZ5jZlpqUd7xluY1DDkwaJrsarf5XSJt00jZ0YKVIm';
  final String secretKey =
      'sk_test_51IcrCaSGgp78HSWonqKdKI1a4DBeu3sSN44Yb6kR2yg4XzAsll1AflVCP8fEbhf7dleQj2pjf89QKwZ9EtN9jvWn00h0a5NKH3';
  String _paymentMethodId;
  String paymentIntentId;
  String _status;
  String clientSecret;
  String radioItem = '';
  var cart;
  bool loader = false;
  List lineItems;
  String totalamount;
  int id;
  String paymentMethodTitle = '';
  bool setPaid;
  double pricetotal;

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
        print("clientSecret: " + clientSecret);
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
        createOrder();
        print("SUCESSSFUL");
      }
    }).onError((error, stackTrace) {
      print("ERRORRR" + error.toString());
      faileddialog(error, context);
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
    _loadSavedData();
  }

  _loadSavedData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      if (sharedPreferences.getString('email') != null &&
          sharedPreferences.getString('email').isNotEmpty) {
        id = sharedPreferences.getInt('id');
      }
    });
  }

  stripePay(amount) async {
    addCard().whenComplete(
        () => createIntent(amount).whenComplete(() => authPayment(amount)));
  }

  createOrder() {
    createOrderState(
            widget.firstname,
            widget.lastname,
            widget.address1,
            widget.address2,
            widget.city,
            widget.state,
            widget.postcode,
            widget.country,
            widget.email.trim(),
            widget.phone,
            lineItems,
            id,
            paymentMethodTitle,
            paymentIntentId,
            _status,
            totalamount,
            context)
        .whenComplete(() => showNonce())
        .whenComplete(() =>
            Provider.of<ProductModellist>(context, listen: false).removeAll());
  }

  static final String tokenizationKey = 'sandbox_8hxpnkht_kzdtzv2btm4p7s5j';

  void showNonce() {
    // showDialog<void>(
    //   context: context,
    //   barrierDismissible: false, // user must tap button!
    //   builder: (BuildContext context) {
    //     return
    //       AlertDialog(
    //       title: Text('Success'),
    //       content: SingleChildScrollView(
    //         child: ListBody(
    //           children: <Widget>[
    //             Column(
    //               children: [
    //                 SizedBox(
    //                   height: 90,
    //                   width: 90,
    //                   child: Image.network(
    //                     'https://www.cntraveller.in/wp-content/themes/cntraveller/images/check-circle.gif',
    //                     fit: BoxFit.fill,
    //                   ),
    //                 ),
    //                 Text(
    //                   "Thank you for Shopping",
    //                   style: TextStyle(
    //                       fontSize: 20,
    //                       fontWeight: FontWeight.bold,
    //                       fontStyle: FontStyle.italic),
    //                 )
    //               ],
    //             ),
    //           ],
    //         ),
    //       ),
    //       actions: <Widget>[
    //         ElevatedButton(
    //           child: Text('Continue Shopping'),
    //           onPressed: () {
    //             Provider.of<ProductModellist>(context, listen: false)
    //                 .removeAll();
    //             Navigator.of(context).pushReplacement(
    //                 MaterialPageRoute(builder: (context) => Shopping()));
    //             // Navigator.pushAndRemoveUntil(
    //             //     context,
    //             //     MaterialPageRoute(builder: (BuildContext context) => Shopping()),
    //             //     ModalRoute.withName('/')
    //             // );
    //           },
    //         ),
    //       ],
    //     );
    //   },
    // );
    AwesomeDialog(
      context: context,
      dialogType: DialogType.SUCCES,
      animType: AnimType.BOTTOMSLIDE,
      btnOkColor: Colors.orange,
      title: 'Success',
      desc: 'Thank you for Shopping',
      btnOkOnPress: () {
        Provider.of<ProductModellist>(context, listen: false).removeAll();
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => Updatehome()));
      },
    )..show();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    cart = context.watch<ProductModellist>();
    //send data list produt id and quatity
    // for (int j = 0; j < cart.cart1.length; j++)
    //   pricetotal=cart.cart1[j].price* cart.cart1[j].quantity;
    lineItems = [
      for (int i = 0; i < cart.cart1.length; i++)
        {
          "product_id": cart.cart1[i].id,
          "quantity": cart.cart1[i].quantity,
          "size": cart.cart1[i].size,
          "color": cart.cart1[i].color,
          "total_price":
              (cart.cart1[i].price * cart.cart1[i].quantity).toString()
        }
    ];
    totalamount = cart.sum1.toString();
    print(lineItems);
    //end
    return SafeArea(
        child: Stack(children: [
      Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Color(0xFFE18D13),
          backwardsCompatibility: true,
        ),
        bottomNavigationBar: Container(
          height: height * 0.0731,
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: 46,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Color(0xFF780001)),
                  onPressed: () {
                    // setState(() {
                    //   loader = false;
                    // });
                    if (id == null) {
                      Toast.show("Please Login before Shopping", context,
                          duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
                    } else if (radioItem == 'stripe') {
                      stripePay(cart.sum1);
                    } else if (radioItem == 'cod') {
                      createOrder();
                    } else {
                      Toast.show("please select payment method", context,
                          duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
                    }
                  },
                  child: Text(
                    " Total Amount Pay:   \$" + cart.sum1.toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic),
                  ),
                ),
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 50,
              width: width,
              child: Row(
                children: [
                  Image.asset(
                    "assets/visa.png",
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Image.asset(
                    "assets/mastercard.png",
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Image.asset(
                    "assets/discover.png",
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Image.asset(
                    "assets/paypal.png",
                  ),
                ],
              ),
            ),
            Align(
                alignment: Alignment.centerLeft,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text("Payment Method",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color(0xFF535353),
                                fontSize: 20,
                                fontFamily: 'Montserrat1',
                                fontWeight: FontWeight.bold)),
                      ),
                      RadioListTile(
                        groupValue: radioItem,
                        title: Text('Credit Card (Stripe)'),
                        value: 'stripe',
                        onChanged: (val) {
                          setState(() {
                            radioItem = val;
                            setPaid = true;
                            paymentMethodTitle = 'Online Payment (Stripe)';
                            // Strippay();
                          });
                        },
                      ),
                      RadioListTile(
                        groupValue: radioItem,
                        title: Text('Cash On Delivery'),
                        value: 'cod',
                        onChanged: (val) {
                          setState(() {
                            radioItem = val;
                            setPaid = false;
                            paymentMethodTitle = 'COD';
                          });
                        },
                      ),
                    ]))
          ],
        ),
      ),
    ]));
  }
}
