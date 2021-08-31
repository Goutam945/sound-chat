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
    createtermsState(context);
  }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    // if (Provider.of<TermsResponse>(context, listen: false).data != null)
    //   Terms =Provider.of<TermsResponse>(context, listen: false).data;
    var data1 = context.watch<TermsResponse>().data;
    Terms = (data1!=null)?data1['data']:[];
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
                for(int i=0;i<Terms.length;i++)
                /*Html(data: Terms[i]['description'],style: {
              "body": Style(
                fontSize: FontSize(15.0),
                color: Colors.white
              ),
            },),*/

                Padding(
                  padding: const EdgeInsets.only(top: 10,left: 10),
                  child: Text(Terms[i]['id'].toString() +"  "+Terms[i]['content_type'] +" \n " + Terms[i]['description'],style: TextStyle(fontSize: subtitlefontsize, color: Colors.white,),),
                ),
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
