import 'package:sound_chat/api/audiovideo_url.dart';
import 'package:sound_chat/common/index.dart';
import 'package:sound_chat/screens/firebase.dart';
import 'package:sound_chat/stripe_api/create_customer.dart';
import 'package:sound_chat/stripe_api/create_subcription.dart';
import 'package:sound_chat/stripe_api/get_plans.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => VideoResponse()),
        ChangeNotifierProvider(create: (_) => ScheduleResponse()),
        ChangeNotifierProvider(create: (_) => LoginResponse()),
        ChangeNotifierProvider(create: (_) => GalleryResponse()),
        ChangeNotifierProvider(create: (_) => ProductModellist()),
        ChangeNotifierProvider(create: (_) => HomesliderResponse()),
        ChangeNotifierProvider(create: (_) => AllproductResponse()),
        ChangeNotifierProvider(create: (_) => TermsResponse()),
        ChangeNotifierProvider(create: (_) => OrderResponse()),
        ChangeNotifierProvider(create: (_) => MembershipResponse()),
        ChangeNotifierProvider(create: (_) => CoupncodeResponse()),
        ChangeNotifierProvider(create: (_) => AllorderResponse()),
        ChangeNotifierProvider(create: (_) => SubcriptionlevalResponse()),
        ChangeNotifierProvider(create: (_) => SearchResponse()),
        ChangeNotifierProvider(create: (_) => PhoneinterviewResponse()),
        ChangeNotifierProvider(create: (_) => BanneradsResponse()),
        ChangeNotifierProvider(
          create: (_) => OverlayHandlerProvider(),
        ),
        ChangeNotifierProvider(create: (_) => Plans()),
        ChangeNotifierProvider(create: (_) => Crteatecustomer()),
        ChangeNotifierProvider(create: (_) => CreateSubscription()),
        ChangeNotifierProvider(create: (context) => AudiovideoUrls()),
      ],
      child: MyApp(),
    ),
  );
}

final GlobalKey<NavigatorState> navigatorKey =
    GlobalKey(debugLabel: "Main Navigator");

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool checkinternet = false;

  void internetcheck() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      // I am connected to a mobile network.
      //print("connection" + connectivityResult.toString());
      setState(() {
        checkinternet = false;
      });
    } else if (connectivityResult == ConnectivityResult.wifi) {
      // I am connected to a wifi network.
      //print(connectivityResult);
      setState(() {
        checkinternet = false;
      });
    } else {
      // print("connection" + connectivityResult.toString());
      setState(() {
        checkinternet = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    firebase(context);
  }

  @override
  Widget build(BuildContext context) {
    internetcheck();
    //SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: fontfamily),
        home: checkinternet
            ? Container(
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.network_check,
                      size: 60,
                    ),
                    Text(
                      'No Internet Connection!!',
                      style: TextStyle(
                          fontSize: 18, decoration: TextDecoration.none),
                    ),
                  ],
                ),
              )
            : SpleshScreen());

    // return MaterialApp(
    //   home: SpleshScreen(),
    //   debugShowCheckedModeBanner: false,
    // );
  }
}
