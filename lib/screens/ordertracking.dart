import 'package:flutter/material.dart';

class StepperDemo extends StatefulWidget {
  StepperDemo() : super();

  final String title = "Stepper Demo";

  @override
  StepperDemoState createState() => StepperDemoState();
}
class StepperDemoState extends State<StepperDemo> {
  //
  int current_step = 0;
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
            currentStep: this.current_step,
            steps: steps,
            type: StepperType.vertical,
            onStepTapped: (step) {
              setState(() {
                current_step = step;
              });
            },
            onStepContinue: () {
              setState(() {
                if (current_step < steps.length - 1) {
                  current_step = current_step + 1;
                } else {
                  current_step = 0;
                }
              });
            },
            onStepCancel: () {
              setState(() {
                if (current_step > 0) {
                  current_step = current_step - 1;
                } else {
                  current_step = 0;
                }
              });
            },
          ),
        ),
      ),
    );
  }
}