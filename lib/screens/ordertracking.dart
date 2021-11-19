import 'package:flutter/material.dart';

class Ordertraking extends StatefulWidget {
  final int currentStep;

  Ordertraking({Key key, @required this.currentStep}) : super();

  final String title = "Stepper Demo";

  @override
  OrdertrakingState createState() => OrdertrakingState();
}

class OrdertrakingState extends State<Ordertraking> {
  @override
  Widget build(BuildContext context) {
    List<Step> steps = [
      Step(
        title: Text('Order Placed',
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.white)),
        content: Align(
          alignment: Alignment.bottomLeft,
          child: Text('Your Order has been placed',
              style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
        ),
        isActive: widget.currentStep >= 0,
      ),
      Step(
        title: Text('Order Prepared',
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.white)),
        content: Align(
          alignment: Alignment.bottomLeft,
          child: Text('Seller has Processed your order',
              style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
        ),
        isActive: widget.currentStep >= 1,
      ),
      Step(
        title: Text('Order Shipped',
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.white)),
        content: Align(
          alignment: Alignment.bottomLeft,
          child: Text('Pickup your Order From Courier Service',
              style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
        ),
        isActive: widget.currentStep >= 2,
      ),
      Step(
        title: Text('Order Deliverd',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            )),
        content: Align(
          alignment: Alignment.bottomLeft,
          child: Text('Succesfully deliverd',
              style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
        ),
        isActive: widget.currentStep >= 3,
        state: StepState.complete,
      ),
    ];
    return Scaffold(
      backgroundColor: Colors.black,
      // Body
      body: Theme(
        data: ThemeData(colorScheme: ColorScheme.light(primary: Colors.green)),
        child: Stepper(
          currentStep: widget.currentStep,
          physics: const NeverScrollableScrollPhysics(),
          steps: steps,
          type: StepperType.vertical,
        ),
      ),
    );
  }
}
