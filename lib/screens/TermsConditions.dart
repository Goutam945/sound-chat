import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:sound_chat/api/termsofservices.dart';
import 'package:sound_chat/common/index.dart';
class TermsConditions extends StatefulWidget {
  @override
  _TermsConditionsState createState() => _TermsConditionsState();
}

class _TermsConditionsState extends State<TermsConditions> {
 var Terms;
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    if (Provider.of<TermsResponse>(context, listen: false).data != null)
      Terms =Provider.of<TermsResponse>(context, listen: false).data;
    return SafeArea(
      child: Stack(
          children:[ Scaffold(
            backgroundColor: Colors.black,
            appBar: AppBar(
              backgroundColor: Color(0xFFE18D13),
              //title: Text("Flutter Http Example"),
            ),
            body:ListView(
              children: [
                SizedBox(height: 20,),
                Html(data: Terms['data'],style: {
              "body": Style(
                fontSize: FontSize(15.0),
                color: Colors.white
              ),
            },),
                //Text(Terms['data'].toString())
              ],
            )

          ),
            Positioned(
              top: AppBar().preferredSize.height*0.2,
              left: width * 0.39865,
              child: SizedBox(
                height: height * 0.12168,
                width: width * 0.21875,
                child: Image.asset(
                  'assets/soundpic.png',
                ),
              ),
            ),
          ]
      ),
    );
  }
}
