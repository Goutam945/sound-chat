import 'package:sound_chat/common/index.dart';
class TermsConditions extends StatefulWidget {
  @override
  _TermsConditionsState createState() => _TermsConditionsState();
}

class _TermsConditionsState extends State<TermsConditions> {
 var terms;
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    // if (Provider.of<TermsResponse>(context, listen: false).data != null)
    //   Terms =Provider.of<TermsResponse>(context, listen: false).data;
    var data1 = context.watch<TermsResponse>().data;
    terms = (data1!=null)?data1['data']:[];
    return SafeArea(
      child: Stack(
          children:[
            Scaffold(
            backgroundColor: Colors.black,
              appBar: PreferredSize(preferredSize: Size.fromHeight(55),
                  child: Backappbar()),
            body:Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFF3F535E),
                        Color(0xFF3A432E),
                        //Color(0xFF0E0D13)
                      ])),
              child: ListView(
                children: [
                  SizedBox(height: 20,),
                  for(int i=0;i<terms.length;i++)

                  Padding(
                    padding: const EdgeInsets.only(top: 10,left: 10),
                    child: Text(terms[i]['id'].toString() +"  "+terms[i]['content_type'] +" \n " + terms[i]['description'],
                      style: TextStyle(fontSize: 12, color: Colors.white,),),
                  ),
                  //Text(Terms['data'].toString())
                ],
              ),
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
