import 'package:sound_chat/api/free_video.dart';
import 'package:sound_chat/api/schedule.dart';
import 'package:sound_chat/common/index.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => VideoResponse()),
        ChangeNotifierProvider(create: (_) => ScheduleResponse()),
        ChangeNotifierProvider(create: (_) => LoginResponse()),
        ChangeNotifierProvider(
          create: (_) => OverlayHandlerProvider(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
      home: VideoSplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
