import 'package:sound_chat/common/index.dart';

class VideoPlayerPage extends StatefulWidget {
  @override
  _VideoPlayerPageState createState() => _VideoPlayerPageState();
}

class _VideoPlayerPageState extends State<VideoPlayerPage> {
  VideoPlayerController _videoPlayerController;
  double aspectRatio = 16 / 9;
  _initVideo() {
    _videoPlayerController = VideoPlayerController.network(
      "https://5dcabf026b188.streamlock.net/soundchatradio/livestream/playlist.m3u8",
    );
    _videoPlayerController.setLooping(true);

    _videoPlayerController
      ..initialize().then((value) {
        setState(() {
          aspectRatio = _videoPlayerController.value.aspectRatio ?? 16 / 9;
        });
        _videoPlayerController.play();
      });
  }

  @override
  void initState() {
    super.initState();
    _initVideo();
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            _buildVideoPlayer(),
            Expanded(child: Text("Live video")),
          ],
        ),
      ),
    );
  }

  Widget _buildVideoPlayer() {
    return Consumer<OverlayHandlerProvider>(
        builder: (context, overlayProvider, _) {
      return Stack(
        children: <Widget>[
          Container(
            color: Colors.black,
            child: AspectRatio(
              aspectRatio: aspectRatio,
              child: VideoPlayer(
                _videoPlayerController,
              ),
            ),
          ),
          if (!overlayProvider.inPipMode)
            Positioned(
              top: 8.0,
              left: 8.0,
              child: IconButton(
                  icon: Icon(Icons.keyboard_arrow_down),
                  color: Colors.white,
                  onPressed: () {
                    Provider.of<OverlayHandlerProvider>(context, listen: false)
                        .enablePip(aspectRatio);
                  }),
            ),
          Positioned(
            top: 8.0,
            right: 8.0,
            child: IconButton(
                icon: Icon(
                  Icons.close,
                  size: 30,
                  color: Colors.black,
                ),
                color: Colors.white,
                onPressed: () {
                  Provider.of<OverlayHandlerProvider>(context, listen: false)
                      .removeOverlay(context);
                }),
          ),
          if (overlayProvider.inPipMode)
            Positioned(
              top: 0,
              left: 0,
              bottom: 0,
              right: 0,
              child: InkWell(
                onTap: () {
                  Provider.of<OverlayHandlerProvider>(context, listen: false)
                      .disablePip();
                },
                child: Container(),
              ),
            ),
        ],
      );
    });
  }
}
