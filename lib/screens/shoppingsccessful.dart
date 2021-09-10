import 'package:sound_chat/common/index.dart';
class ShopSccess extends StatefulWidget {
  @override
  _ShopSccessState createState() => _ShopSccessState();
}
//https://www.cntraveller.in/wp-content/themes/cntraveller/images/check-circle.gif
class _ShopSccessState extends State<ShopSccess> {
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Stack(children: [
          Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Color(0xFFE18D13),
              backwardsCompatibility: true,
            ),
            body: Center(
              child: Column(
                children: [
                  SizedBox(
                    child: Image.network(
                      'https://www.cntraveller.in/wp-content/themes/cntraveller/images/check-circle.gif',
                      fit: BoxFit.fill,
                    ),
                  ),
                  Text("Thankyou For Shopping",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic),)
                ],
              ),
            ),
          )
        ]
        )
    );
  }
}