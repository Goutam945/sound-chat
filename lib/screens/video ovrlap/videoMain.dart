import 'package:sound_chat/common/index.dart';

void main() {
  runApp(Video());
}

class Video extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<OverlayHandlerProvider>(
      create: (_) => OverlayHandlerProvider(),
      child: MaterialApp(
        title: 'InApp PIP',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(title: 'Flutter InApp PIP'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  MyHomePage({Key key, this.title}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  _addVideoOverlay() {
    OverlayService().addVideosOverlay(context, VideoPlayerPage());
  }
  _addVideoWithTitleOverlay() {
    OverlayService().addVideoTitleOverlay(context, VideoPlayerTitlePage());
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if(Provider.of<OverlayHandlerProvider>(context, listen: false).overlayActive) {
          Provider.of<OverlayHandlerProvider>(context, listen: false).enablePip(1.77);
          return false;
        }
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                child: Text("Add Video With Drag Overlay"),
                onPressed: () {
                  _addVideoOverlay();
                },
              ),
              ElevatedButton(
                child: Text("Add Video With Title Overlay"),
                onPressed: () {
                  _addVideoWithTitleOverlay();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}