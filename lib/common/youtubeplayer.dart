import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sound_chat/common/index.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

import 'appConfig.dart';

//import 'index.dart';

// class Youtubeplayer extends StatefulWidget {
//   final String videoURL;
//   final ontap;

//   @override
//   VideoState createState() => VideoState();

//   Youtubeplayer(this.videoURL, this.ontap);
// }

// class VideoState extends State<Youtubeplayer> {
//   //YoutubePlayerController _controller;
//   YoutubePlayerController _ytbPlayerController;
//   String getVideoID(String url) {
//     url = url.replaceAll("https://www.youtube.com/watch?v=", "");
//     url = url.replaceAll("https://m.youtube.com/watch?v=", "");
//     return url;
//   }

//   @override
//   void initState() {
//     // _controller = YoutubePlayerController(
//     //     initialVideoId: YoutubePlayer.convertUrlToId(widget.videoURL),
//     //     flags: YoutubePlayerFlags());
//     _ytbPlayerController = YoutubePlayerController(
//         initialVideoId: getVideoID(widget.videoURL),
//         params: YoutubePlayerParams(
//           showFullscreenButton: true,
//           autoPlay: true,
//           startAt: const Duration(minutes: 0, seconds: 0),
//           showControls: true,
//           desktopMode: false,
//           privacyEnhanced: true,
//           useHybridComposition: true,
//         ));
//     super.initState();
//     SystemChrome.setPreferredOrientations([
//       DeviceOrientation.landscapeRight,
//       DeviceOrientation.landscapeLeft,
//       DeviceOrientation.portraitUp,
//       DeviceOrientation.portraitDown,
//     ]);
//     _ytbPlayerController.onEnterFullscreen = () {
//       SystemChrome.setPreferredOrientations([
//         DeviceOrientation.landscapeLeft,
//         DeviceOrientation.landscapeRight,
//       ]);
//       print('Entered Fullscreen');
//     };
//     _ytbPlayerController.onExitFullscreen = () {
//       print('Exited Fullscreen');
//     };
//   }

//   @override
//   void dispose() {
//     _ytbPlayerController.close();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     print(widget.videoURL);
//     return SafeArea(
//       child: Scaffold(
//           backgroundColor: Colors.black,
//           body: Center(
//             // child: YoutubePlayerBuilder(
//             //   onEnterFullScreen: widget.ontap,
//             //   onExitFullScreen: widget.ontap,
//             //   player: YoutubePlayer(
//             //     controller: _controller,
//             //     aspectRatio: 16 / 9,
//             //     showVideoProgressIndicator: true,
//             //   ),
//             //   builder: (context, player) {
//             //     return Column(
//             //       children: <Widget>[
//             //         player,
//             //       ],
//             //     );
//             //   },
//             // ),
//             child: _buildYtbView(),
//           )),
//     );
//   }

//   _buildYtbView() {
//     return AspectRatio(
//       aspectRatio: 16 / 9,
//       child: _ytbPlayerController != null
//           ? YoutubePlayerIFrame(controller: _ytbPlayerController)
//           : Center(child: CircularProgressIndicator()),
//     );
//   }
// }

class Youtubeplayer extends StatefulWidget {
  final String videoURL;

  @override
  VideoState createState() => VideoState();

  Youtubeplayer(
    this.videoURL,
  );
}

class VideoState extends State<Youtubeplayer> {
  //YoutubePlayerController _controller;
  YoutubePlayerController _ytbPlayerController;
  Stream stream = streamController.stream;
  StreamSubscription streamsub;
  String getVideoID(String url) {
    url = url.replaceAll("https://www.youtube.com/watch?v=", "");
    url = url.replaceAll("https://m.youtube.com/watch?v=", "");
    url = url.replaceAll("https://youtu.be/", "");
    return url;
  }

  load() {
    //_ytbPlayerController.load(getVideoID(widget.videoURL));

    streamsub = stream.listen((event) {
      _ytbPlayerController.load(getVideoID(event));
      print("GOUTAM" + event);
    });
  }

  @override
  void initState() {
    // _controller = YoutubePlayerController(
    //     initialVideoId: YoutubePlayer.convertUrlToId(widget.videoURL),
    //     flags: YoutubePlayerFlags());

    _ytbPlayerController = YoutubePlayerController(
        initialVideoId: getVideoID(widget.videoURL),
        params: YoutubePlayerParams(
          showFullscreenButton: true,
          autoPlay: true,
          startAt: const Duration(minutes: 0, seconds: 0),
          showControls: true,
          desktopMode: false,
          privacyEnhanced: true,
          useHybridComposition: true,
        ));
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    _ytbPlayerController.onEnterFullscreen = () {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
      print('Entered Fullscreen');
    };
    _ytbPlayerController.onExitFullscreen = () {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
      ]);
      print('Exited Fullscreen');
    };
    load();
  }

  @override
  void dispose() {
    _ytbPlayerController.close();
    streamsub.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.black,
          body: Center(
            // child: YoutubePlayerBuilder(
            //   onEnterFullScreen: widget.ontap,
            //   onExitFullScreen: widget.ontap,
            //   player: YoutubePlayer(
            //     controller: _controller,
            //     aspectRatio: 16 / 9,
            //     showVideoProgressIndicator: true,
            //   ),
            //   builder: (context, player) {
            //     return Column(
            //       children: <Widget>[
            //         player,
            //       ],
            //     );
            //   },
            // ),
            child: _buildYtbView(),
          )),
    );
  }

  _buildYtbView() {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: _ytbPlayerController != null
          ? YoutubePlayerIFrame(controller: _ytbPlayerController)
          : Center(child: CircularProgressIndicator()),
    );
  }
}
