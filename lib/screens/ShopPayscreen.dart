import 'package:flutter_braintree/flutter_braintree.dart';
import 'package:sound_chat/Model/ProductModellist.dart';
import 'package:sound_chat/api/create_order.dart';
import 'package:sound_chat/common/index.dart';
import 'package:sound_chat/screens/ShoppingSccessful.dart';

import 'Shopping.dart';
import 'package:flutter_stripe_payment/flutter_stripe_payment.dart';

class ShopPay extends StatefulWidget {
  final firstname,lastname,address1,address2,city,state,postcode,country,email,phone,
      shipname,shiplastname,shipaddress1,shipaddress2,shipcity,shipsate,shippostcode,shipcountry;
  ShopPay(this.firstname,this.lastname,this.address1,this.address2,this.city,this.state,this.postcode,
      this.country,this.email,this.phone,this.shipname,this.shiplastname,this.shipaddress1,this.shipaddress2,this.shipcity,
      this.shipsate,this.shippostcode,this.shipcountry,);
  @override
  _ShopPayState createState() => _ShopPayState();
}
class _ShopPayState extends State<ShopPay> {
  String radioItem = '';
  var cart;
  bool loader=false;
  String _paymentMethodId;
  String _errorMessage = "";
  List line_items;
  int id;
  final _stripePayment = FlutterStripePayment();
  @override
  void initState() {
    super.initState();
    _stripePayment.setStripeSettings(
        "{STRIPE_PUBLISHABLE_KEY}", "{STRIPE_APPLE_PAY_MERCHANTID}");
    _stripePayment.onCancel = () {
      print("the payment form was cancelled");
    };
    _loadSavedData();
  }
  _loadSavedData() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      if(sharedPreferences.getString('email') != null && sharedPreferences.getString('email').isNotEmpty){
        id = sharedPreferences.getInt('id');
      }
    });
  }

  static final String tokenizationKey = 'sandbox_8hxpnkht_kzdtzv2btm4p7s5j';
  void showNonce(BraintreePaymentMethodNonce nonce) {
    showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Sccessfully'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Column(
                  children: [
                    SizedBox(height: 90,width: 90,
                      child: Image.network(
                        'https://www.cntraveller.in/wp-content/themes/cntraveller/images/check-circle.gif',
                        fit: BoxFit.fill,
                      ),
                    ),
                    Text("Thankyou For Shopping",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic),)
                  ],
                ),

              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Continue Shopping'),
              onPressed: () {
                Provider.of<ProductModellist>(context, listen: false).removeAll();
                Navigator.of(context)
                    .pushReplacement(
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
    cart= context.watch<ProductModellist>();
    //send data list produt id and quatity
    line_items= [
      for(int i=0;i<cart.cart1.length;i++)
        {
          "product_id": cart.cart1[i].id,
          "quantity": cart.cart1[i].quantity
        }
    ];
    print(line_items);
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
              height: height*0.0731,
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.red),
                    onPressed: () {
                      setState(() {
                        loader=false;
                      });
                      createOrderState(widget.firstname,widget.lastname,widget.address1,widget.address2,widget.city,
                          widget.state,widget.postcode,widget.country,widget.email,widget.phone,widget.shipname,widget.shiplastname,
                          widget.shipaddress1,widget.shipaddress2,widget.shipcity,widget.shipsate,widget.shippostcode,widget.shipcountry,line_items,id,context).whenComplete(() => Navigator.of(context)
                          .pushReplacement(
                          MaterialPageRoute(builder: (context) => ShopSccess())));
                      setState(() {
                        loader=true;
                      });
                      Provider.of<ProductModellist>(context, listen: false).removeAll();//clear provider data

                    },
                    child: Text(
                      " Total Amount Pay:   \$"+cart.sum1.toString(),
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
                SizedBox(height: 50,width: width,
                  child: Row(
                    children: [
                      Image.asset("assets/visa.png",),
                      SizedBox(width: 10,),
                      Image.asset("assets/mastercard.png",),
                      SizedBox(width: 10,),
                      Image.asset("assets/discover.png",),
                      SizedBox(width: 10,),
                      Image.asset("assets/paypal.png",),
                    ],
                  ),
                ),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
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
                            value: 'Item 1',
                            onChanged: (val) {
                              setState(() {
                                radioItem = val;
                                pay();

                              });
                            },
                          ),

                          RadioListTile(
                            groupValue: radioItem,
                            title: Text('Credit Card (Stripe)'),
                            value: 'Item 2',
                            onChanged: (val) {
                              setState(() {
                                radioItem = val;
                                Strippay();
                              });
                            },
                          ),
                          RadioListTile(
                            groupValue: radioItem,
                            title: Text('Cash On Delivery'),
                            value: 'Item 3',
                            onChanged: (val) {
                              setState(() {
                                radioItem = val;
                              });
                            },
                          ),
               ]
            )
            )
              ],
            ),
          ),
          if(loader)Center(child: CircularProgressIndicator(),)
        ]
        )
    );
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
    BraintreeDropInResult result =
    await BraintreeDropIn.start(request);
    if (result != null) {
      showNonce(result.paymentMethodNonce);
    }
  }
 Strippay() async {
   var paymentResponse = await _stripePayment.addPaymentMethod();
   setState(() {
     if (paymentResponse.status ==
         PaymentResponseStatus.succeeded) {
       print(paymentResponse.paymentMethodId);
       Toast.show(paymentResponse.paymentMethodId, context,
           duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
       _paymentMethodId = paymentResponse.paymentMethodId;
     } else {
       _errorMessage = paymentResponse.errorMessage;
     }
   });
 }

}