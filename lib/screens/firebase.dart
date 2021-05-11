import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:sound_chat/common/index.dart';

final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // await Firebase.initializeApp();
  print("Handling a background message: ${message.messageId}");
  print("Handling a background message: ${message.data}");
  print("Handling a background message: ${message.category}");
  print("Handling a background message: ${message.notification.title}");
  print("Handling a background message: ${message.notification.body}");
}

firebase(context) async{

  NotificationSettings settings = await _firebaseMessaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
  print('User granted permission: ${settings.authorizationStatus}');

  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    print('Got a message whilst in the foreground!');
    print('Message data: ${message.data}');
    // setState(() {
    //   data = message;
    // });

    if (message.notification != null) {
      print('Message also contained a notification: ${message.notification}');
      print(message.notification.title);
      print(message.notification.body);

    }
  });

  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    print('onMessageOpenedApp: ' + message.notification.title.toString());
    //Navigator.of(context).push(MaterialPageRoute(builder: (context)=>BibleReading()));
  });

  // FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
}

class Notification1 extends StatelessWidget {
  final notification;
  Notification1({Key key, this.notification}):super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text(notification.title),),
        body: ListView(children: [
          Text(notification.body)
        ],),
      ),
    );
  }
}
