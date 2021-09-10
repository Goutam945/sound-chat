import 'package:sound_chat/api/free_video.dart';
import 'package:sound_chat/api/galley.dart';
import 'package:sound_chat/api/schedule.dart';
import 'package:sound_chat/common/index.dart';
import 'package:video_player/video_player.dart';

class VideoSplashScreen extends StatefulWidget {
  @override
  VideoState createState() => VideoState();
}

class VideoState extends State<VideoSplashScreen> {
  VideoPlayerController playerController;
  VoidCallback listener;

  @override
  void initState() {
    super.initState();
    createVideoState(context);
    createScheduleState(context);
    createGalleryState(context);
    listener = () {};
    initializeVideo();
    playerController.play();
    startTime();
  }

  startTime() async {
    Timer(
        Duration(seconds: 10),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomeScreen())));
  }

  void initializeVideo() {
    playerController = VideoPlayerController.asset('assets/VideoSplesh.mp4')
      ..addListener(listener)
      ..setVolume(1.0)
      ..initialize()
      ..play();
  }

  @override
  void deactivate() {
    if (playerController != null) {
      playerController.setVolume(0.0);
      playerController.removeListener(listener);
    }
    super.deactivate();
  }

  @override
  void dispose() {
    if (playerController != null) playerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AspectRatio(aspectRatio: 1,
          child: VideoPlayer(
            playerController,
          ),
        ),
      ),
    );
  }
}
