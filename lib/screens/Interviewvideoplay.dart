import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sound_chat/api/free_video.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import 'Interview design.dart';

class InterviewDesign extends StatefulWidget {
  @override
  _InterviewDesign createState() => _InterviewDesign();
}

class _InterviewDesign extends State<InterviewDesign> {
  String data;
  int day = 6;
  int j;
  String url;
  bool isTrue = false;
  double videoheight = 0.5602;
  double videowidth = 1.018;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var superherosLength = (Provider.of<VideoResponse>(context, listen: false).data != null)?Provider.of<VideoResponse>(context, listen: false).data['data']['free_content']: null;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Tv Interviews"),
        backgroundColor: Color(0xFFE18D13),
        leading: Builder(builder: (BuildContext context) {
          return IconButton(
            icon: Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
              size: 25,
            ),
            onPressed: () {
              SystemChrome.setPreferredOrientations([
                DeviceOrientation.portraitUp,
                DeviceOrientation.portraitDown
              ]);
              Navigator.of(context).pop();
            },
          );
        }),
        actions: <Widget>[],
      ),
      body: (superherosLength != null)
          ? ListView(
              children: [
                (isTrue)
                    ? Container(
                        height: height * videoheight,
                        width: width * videowidth,
                        child: YoutubeVideoApp(url))
                    : Image.asset(
                        'assets/images.jpeg',
                        fit: BoxFit.fill,
                        height: height * 0.556,
                      ),
                Column(
                  children: [
                    Container(
                      child: Padding(
                        padding: EdgeInsets.only(right: width * 0.3314),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 4, right: 90),
                          child: Text("UPCOMMING SHOWS",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontStyle: FontStyle.italic)),
                        ),
                      ),
                    ),
                  ],
                ),
                SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        for (int i = 0; i < 130; i++)
                          SizedBox(
                            height: height * 0.4926,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 10, left: 5),
                                  child: Stack(
                                    children: [
                                      Container(
                                        width: width * 0.2397,
                                        height: height * 0.1393,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          child: CachedNetworkImage(
                                            imageUrl: jsonDecode(data)['data']
                                                    ['free_content']['$i']
                                                ['featured_img'],
                                            fit: BoxFit.fill,
                                            placeholder: (context, url) => Center(
                                                child:
                                                    CircularProgressIndicator()),
                                            errorWidget:
                                                (context, url, error) =>
                                                    Icon(Icons.error),
                                          ),
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: Colors.white,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 45, left: 45),
                                        child: IconButton(
                                          icon: Icon(
                                            Icons.play_circle_fill,
                                            color: Colors.pink[300],
                                            size: 35,
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              url = jsonDecode(data)['data']
                                                      ['free_content']['$i']
                                                  ['free_video_url'];
                                              isTrue = true;
                                            });
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: SizedBox(
                                      width: 120,
                                      child: Center(
                                          child: Text(
                                        jsonDecode(data)['data']['free_content']
                                                ['$i']['post_title']
                                            .toString(),
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontStyle: FontStyle.italic,
                                        ),
                                        textAlign: TextAlign.center,
                                      ))),
                                ),
                              ],
                            ),
                          ),
                      ],
                    )),
              ],
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}

class YoutubeAppDemo extends StatefulWidget {
  final videoURL;

  YoutubeAppDemo(
    this.videoURL,
  );

  @override
  _YoutubeAppDemoState createState() => _YoutubeAppDemoState();
}

class _YoutubeAppDemoState extends State<YoutubeAppDemo> {
  YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.videoURL,
      params: const YoutubePlayerParams(
        startAt: const Duration(minutes: 1, seconds: 36),
        showControls: true,
        showFullscreenButton: true,
        desktopMode: true,
        privacyEnhanced: true,
      ),
    );
    _controller.onEnterFullscreen = () {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
    };
    _controller.onExitFullscreen = () {
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
      Future.delayed(const Duration(seconds: 1), () {
        _controller.play();
      });
      Future.delayed(const Duration(seconds: 5), () {
        SystemChrome.setPreferredOrientations(DeviceOrientation.values);
      });
    };
  }

  @override
  Widget build(BuildContext context) {
    const player = YoutubePlayerIFrame();
    return YoutubePlayerControllerProvider(
      controller: _controller,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Youtube Player Demo'),
        ),
        body: LayoutBuilder(
          builder: (context, constraints) {
            if (kIsWeb && constraints.maxWidth > 800) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Expanded(child: player),
                  const SizedBox(
                    width: 500,
                    child: SingleChildScrollView(
                      child: Controls(),
                    ),
                  ),
                ],
              );
            }
            return ListView(
              children: [
                player,
                const Controls(),
              ],
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }
}

class Controls extends StatelessWidget {
  const Controls();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _space,
        ],
      ),
    );
  }

  Widget get _space => const SizedBox(height: 10);
}
