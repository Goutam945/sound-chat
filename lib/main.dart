import 'package:connectivity/connectivity.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sound_chat/api/create_order.dart';
import 'package:sound_chat/api/free_video.dart';
import 'package:sound_chat/api/phoneinterview.dart';
import 'package:sound_chat/api/schedule.dart';
import 'package:sound_chat/common/index.dart';
import 'package:sound_chat/screens/spleshscreen.dart';
import 'Model/ProductModellist.dart';
import 'api/all _orders.dart';
import 'api/allproduct.dart';
import 'api/couponcode.dart';
import 'api/galley.dart';
import 'api/homeslider.dart';
import 'api/membership.dart';
import 'api/search_api.dart';
import 'api/subcribtion_lable.dart';
import 'api/termsofservices.dart';

void main() async{
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
        ChangeNotifierProvider(
          create: (_) => OverlayHandlerProvider(),
        ),
      ],
      child: MyApp(),
    ),
  );
}


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
  Widget build(BuildContext context) {
    internetcheck();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(debugShowCheckedModeBanner: false,  theme: ThemeData(fontFamily: 'Montserrat1'),
        home: checkinternet
            ? Container(color: Colors.white,
              child: Column(crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.network_check,size: 60,),
                   Text('No Internet Connection!!', style: TextStyle(fontSize: 18,decoration: TextDecoration.none),),
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
