import 'package:flutter/material.dart';

class StepperDemo extends StatefulWidget {
  final int currentStep;

  StepperDemo({Key key, @required this.currentStep}) : super();

  final String title = "Stepper Demo";

  @override
  StepperDemoState createState() => StepperDemoState();
}

class StepperDemoState extends State<StepperDemo> {
  List<Step> steps = [
    Step(
      title: Text('Order',
          style: TextStyle(
              fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white)),
      content: Text('Your Order has been placed',
          style: TextStyle(
              fontSize: 11, fontWeight: FontWeight.bold, color: Colors.white)),
      isActive: true,
    ),
    Step(
      title: Text('Packed',
          style: TextStyle(
              fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white)),
      content: Text('Seller has Processed your order',
          style: TextStyle(
              fontSize: 11, fontWeight: FontWeight.bold, color: Colors.white)),
      isActive: true,
    ),
    Step(
      title: Text('Shipped',
          style: TextStyle(
              fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white)),
      content: Text('EKart Express',
          style: TextStyle(
              fontSize: 11, fontWeight: FontWeight.bold, color: Colors.white)),
      isActive: true,
    ),
    Step(
      title: Text('Deliverd',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          )),
      content: Text('Succesfully deliverd',
          style: TextStyle(
              fontSize: 11, fontWeight: FontWeight.bold, color: Colors.white)),
      isActive: true,
      state: StepState.complete,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      // Body
      body: Stepper(
        currentStep: widget.currentStep,
        steps: steps,
        type: StepperType.vertical,
      ),
    );
  }
}
