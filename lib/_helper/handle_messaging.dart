import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:vibration/vibration.dart';

class HandleMessaging {
  static FirebaseMessaging firebaseMessaging = FirebaseMessaging();
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static Future initFlutterLocalNotification() {
    var initializationSettingsAndroid =
        AndroidInitializationSettings('app_icon');
    var initializationSettingsIOS = IOSInitializationSettings(
        onDidReceiveLocalNotification: onDidReceiveLocalNotification);
    var initializationSettings = InitializationSettings(
        initializationSettingsAndroid, initializationSettingsIOS);
    flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: onSelectNotification);
    return null;
  }

  static Future onDidReceiveLocalNotification(
      int id, String title, String body, String payload) async {
    // // display a dialog with the notification details, tap ok to go to another page
    // showDialog(
    //   context: context,
    //   builder: (BuildContext context) => new CupertinoAlertDialog(
    //     title: new Text(title),
    //     content: new Text(body),
    //     actions: [
    //       CupertinoDialogAction(
    //         isDefaultAction: true,
    //         child: new Text('Ok'),
    //         onPressed: () async {
    //           Navigator.of(context, rootNavigator: true).pop();
    //           await Navigator.push(
    //             context,
    //             new MaterialPageRoute(
    //               builder: (context) => new SecondScreen(payload),
    //             ),
    //           );
    //         },
    //       )
    //     ],
    //   ),
    // );
  }

  static bool showAlert = true;
  static String progressStatus;
  static Future showNotificationExample(String title, String message) async {
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
        'your channel id', 'your channel name', 'your channel description',
        importance: Importance.Max, priority: Priority.High);

    var iOSPlatformChannelSpecifics = IOSNotificationDetails();

    var platformChannelSpecifics = NotificationDetails(
      androidPlatformChannelSpecifics,
      iOSPlatformChannelSpecifics,
    );

    await flutterLocalNotificationsPlugin.show(
      0,
      title,
      message,
      platformChannelSpecifics,
      payload: 'item id 2',
    );
  }

  static Future onSelectNotification(String payload) async {
    if (payload != null) {
      print('onSelectNotification > payload : ' + payload);
    }
  }

  static Future requestPermissionAndInit() async {
    firebaseMessaging.requestNotificationPermissions();
    await HandleMessaging.initEvent();
    await HandleMessaging.initFlutterLocalNotification();
  }

  static Future initEvent() async {
    firebaseMessaging.configure(
      onLaunch: (Map<String, dynamic> message) {
        print("onLaunch Called ");
        return;
      },
      onMessage: (Map<String, dynamic> message) async {
        var title = message["notification"]["title"];
        var body = message["notification"]["body"];

        HandleMessaging.showNotificationExample(title, body);

        bool hasVibrator = await Vibration.hasVibrator();
        if (hasVibrator) {
          Vibration.vibrate(
            duration: 1000,
          );
        }
      },
      onResume: (Map<String, dynamic> message) {
        print("onResume Called ");
        return;
      },
    );
  }

  static Future getToken() async {
    return await firebaseMessaging.getToken();
  }

  static String fcmToken;
  static FirebaseAuth firebaseAuth;
  static FirebaseUser firebaseUser;

  static Future firebaseSignInAndGetFcmToken() async {
    firebaseAuth = FirebaseAuth.instance;
    firebaseUser = (await firebaseAuth.signInAnonymously()).user;

    // //! Get FCM Token Message & Send
    HandleMessaging.requestPermissionAndInit();

    // //!Get Token and Save to DB
    var fcmToken = await HandleMessaging.getToken();
    print("Your Token nih $fcmToken");

    HandleMessaging.fcmToken = fcmToken;
  }
}
