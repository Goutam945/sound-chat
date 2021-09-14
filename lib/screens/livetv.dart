import 'package:audioplayers/audioplayers.dart';
import 'package:better_player/better_player.dart';
import 'package:sound_chat/common/index.dart';
class LiveVideo extends StatefulWidget {
  @override
  _LiveVideoState createState() => _LiveVideoState();
}

class _LiveVideoState extends State<LiveVideo> {
  BetterPlayerController _betterPlayerController;
  GlobalKey _betterPlayerKey = GlobalKey();
  AudioPlayer audioPlayer = new AudioPlayer(
      playerId: 'Soundchat Radio', mode: PlayerMode.MEDIA_PLAYER);
  stopaudio()async{
    await audioPlayer.stop();
    play=true;
    MediaNotification.showNotification(
        title: 'Soundchat Radio', isPlaying: !play);
  }

  @override
  void initState() {
    stopaudio();
    BetterPlayerConfiguration betterPlayerConfiguration =
    BetterPlayerConfiguration(
        aspectRatio: 16 / 9,
        fit: BoxFit.contain,
        autoPlay: true,
        eventListener: (event) {
          print(event.betterPlayerEventType);
          print(event.parameters);
        },
      deviceOrientationsOnFullScreen: [
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ],
      ///Orientation after full screen dismissed
      deviceOrientationsAfterFullScreen: [
        DeviceOrientation.portraitUp,
      ],
    );

    BetterPlayerDataSource dataSource = BetterPlayerDataSource(
        BetterPlayerDataSourceType.network, "https://5dcabf026b188.streamlock.net/soundchatradio/livestream/playlist.m3u8",
        liveStream: true,
        cacheConfiguration: BetterPlayerCacheConfiguration(useCache: false),
        videoExtension: "m3u8",
        notificationConfiguration: BetterPlayerNotificationConfiguration(
          title: "Sound chat",
          imageUrl:
          "https://soundchatradio.com/wp-content/uploads/2018/10/cropped-logo-soundchat-radioSmall-300x300.png",
          showNotification: true,
        ));
    _betterPlayerController = BetterPlayerController(betterPlayerConfiguration);
    _betterPlayerController.setupDataSource(dataSource);
    _betterPlayerController.setBetterPlayerGlobalKey(_betterPlayerKey);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xFF481621),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.center,
                colors: [Color(0xFF481621), Color(0xFF271732)]
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: height * 0.025,
              ),
              BetterPlayer(
                controller: _betterPlayerController,
                key: _betterPlayerKey,
              ),
              SizedBox(height: 20,),
            ],
          ),
        ),
      ),
    );
  }
}