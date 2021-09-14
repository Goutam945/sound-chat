import 'package:flutter/material.dart';

class StepperDemo extends StatefulWidget {
  StepperDemo() : super();

  final String title = "Stepper Demo";

  @override
  StepperDemoState createState() => StepperDemoState();
}
class StepperDemoState extends State<StepperDemo> {
  //
  int currentstep = 0;
  List<Step> steps = [
    Step(
      title: Text('Order',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
      content: Text('Your Order has been placed',),
      isActive: true,
    ),
    Step(
      title: Text('Packed',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
      content: Text('Seller has Processed your order',),
      isActive: true,
    ),
    Step(
      title: Text('Shipped',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
      content: Text('COD EKart Express',),
      isActive: true,
    ),
    Step(
      title: Text('Deliverd',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
      content: Text('Succesfully deliverd',),
      isActive: true,
      state: StepState.complete,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(backwardsCompatibility: true,
          // Title
          backgroundColor: Color(0xFFE18D13),
          title: Text("Order Status"),
        ),
        // Body
        body: Theme(
          data: ThemeData(
            accentColor: Colors.red,
            primarySwatch: Colors.red,
            colorScheme: ColorScheme.light(
                primary: Colors.red

            )
        ),
          child: Stepper(
            currentStep: this.currentstep,
            steps: steps,
            type: StepperType.vertical,
            onStepTapped: (step) {
              setState(() {
                currentstep = step;
              });
            },
            onStepContinue: () {
              setState(() {
                if (currentstep < steps.length - 1) {
                  currentstep = currentstep + 1;
                } else {
                  currentstep = 0;
                }
              });
            },
            onStepCancel: () {
              setState(() {
                if (currentstep > 0) {
                  currentstep = currentstep - 1;
                } else {
                  currentstep = 0;
                }
              });
            },
          ),
        ),
      ),
    );
  }
}