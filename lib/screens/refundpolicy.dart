import 'package:sound_chat/common/index.dart';

class Refundpolicy extends StatefulWidget {
  const Refundpolicy({Key key}) : super(key: key);

  @override
  _RefundpolicyState createState() => _RefundpolicyState();
}

class _RefundpolicyState extends State<Refundpolicy> {
  bool isLoading = true;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Stack(
        children: [
          Scaffold(
              backgroundColor: Colors.black,
              appBar: PreferredSize(
                  preferredSize: Size.fromHeight(55), child: Backappbar()),
              body: Column(
                children: [
                  Expanded(
                    child: WebView(
                      javascriptMode: JavascriptMode.unrestricted,
                      onPageFinished: (finish) {
                        setState(() {
                          isLoading = false;
                        });
                      },
                      initialUrl: "",
                    ),
                  ),
                ],
              )),
          Positioned(
              top: AppBar().preferredSize.height * 0.1,
              left: width * 0.39865,
              child: SizedBox(
                  height: height * 0.12168,
                  width: width * 0.21875,
                  child: Image.asset(
                    'assets/soundpic.png',
                  ))),
          isLoading
              ? Center(
                  child: Container(
                      padding: EdgeInsets.only(top: 30),
                      child: CircularProgressIndicator()),
                )
              : Stack()
        ],
      ),
    );
  }
}
