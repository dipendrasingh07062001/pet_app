import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rxdart/rxdart.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:collection';
import 'package:flutter/cupertino.dart';
import 'dart:io';

class ReceivedNotification {
  ReceivedNotification({
    required this.id,
    required this.title,
    required this.body,
    required this.payload,
  });

  final int id;
  final String? title;
  final String? body;
  final String? payload;
}

const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    description:
        'This channel is used for important notifications.', // description
    importance: Importance.max,
    enableLights: true,
    playSound: true,
    enableVibration: true);
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

final BehaviorSubject<String?> selectNotificationSubject =
    BehaviorSubject<String?>();
final BehaviorSubject<ReceivedNotification> didReceiveLocalNotificationSubject =
    BehaviorSubject<ReceivedNotification>();
String? selectedNotificationPayload;
const DarwinNotificationDetails iOSPlatformChannelSpecifics =
    DarwinNotificationDetails(
  presentAlert: true,
  presentBadge: true,
  presentSound: true,
);
const AndroidNotificationDetails androidPlatformChannelSpecifics =
    AndroidNotificationDetails(
  'high_importance_channel', // id
  'High Importance Notifications', // title
  channelDescription:
      'This channel is used for important notifications.', // description
  importance: Importance.max,
  enableLights: true,
  priority: Priority.high,
  playSound: true,
  enableVibration: true,
);

const NotificationDetails platformChannelSpecifics = NotificationDetails(
    android: androidPlatformChannelSpecifics, iOS: iOSPlatformChannelSpecifics);

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("notification backgroung handler");
  await Firebase.initializeApp();
  if (message.notification != null) {
    Map<String, dynamic> map = HashMap();
    print(map.toString());
    map["title"] = message.notification!.title;
    map["body"] = message.notification!.body;
    if (message.data.isNotEmpty) {
      flutterLocalNotificationsPlugin.show(10, message.notification!.title,
          message.notification!.body, platformChannelSpecifics,
          payload: message.data.toString());
      if (message.data.containsKey("type")) {
        map["type"] = message.data["type"];
      }
    }
  }
}

// backfun(NotificationResponse? payload) async {
//   if (payload != null) {
//     debugPrint('notification payload: $payload');
//     // navigatorKey.currentState!.pushNamed("/notification");

//   }
//   selectedNotificationPayload = payload?.payload;
//   selectNotificationSubject.add(payload?.payload);
// }
void notificationTapBackground(NotificationResponse notificationResponse) {
  // ignore: avoid_print
  print('notification(${notificationResponse.id}) action tapped: '
      '${notificationResponse.actionId} with'
      ' payload: ${notificationResponse.payload}');
  if (notificationResponse.input?.isNotEmpty ?? false) {
    // ignore: avoid_print
    print(
        'notification action tapped with input: ${notificationResponse.input}');
  }
}

inMainMethodCall() async {
  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/ic_launcher');

  final DarwinInitializationSettings initializationSettingsIOS =
      DarwinInitializationSettings(
          requestAlertPermission: true,
          requestBadgePermission: true,
          requestSoundPermission: true,
          defaultPresentAlert: true,
          defaultPresentBadge: true,
          defaultPresentSound: true,
          onDidReceiveLocalNotification: (
            int id,
            String? title,
            String? body,
            String? payload,
          ) async {
            didReceiveLocalNotificationSubject.add(
              ReceivedNotification(
                id: id,
                title: title,
                body: body,
                payload: payload,
              ),
            );
          });

  final InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
    iOS: initializationSettingsIOS,
  );
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
  await flutterLocalNotificationsPlugin.initialize(initializationSettings,
      onDidReceiveNotificationResponse:
          (NotificationResponse notificationResponse) {
    switch (notificationResponse.notificationResponseType) {
      case NotificationResponseType.selectedNotification:
        selectNotificationSubject.add(notificationResponse.payload);
        break;
      case NotificationResponseType.selectedNotificationAction:
        if (notificationResponse.actionId == "id_3") {
          selectNotificationSubject.add(notificationResponse.payload);
        }
        break;
    }
  }, onDidReceiveBackgroundNotificationResponse: notificationTapBackground);

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          IOSFlutterLocalNotificationsPlugin>()
      ?.requestPermissions(
        alert: true,
        badge: true,
        sound: true,
        critical: true,
      );
}

shownotification() async {
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  FirebaseMessaging.onMessage.listen((message) async {
    print("this is on message");

    if (message.notification != null) {
      Map<String, dynamic> map = HashMap();
      print(map.toString());
      map["title"] = message.notification?.title;
      map["body"] = message.notification?.body;
      if (message.data.isNotEmpty) {
        if (message.data.containsKey("type")) {
          map["type"] = message.data["type"];
        }
      }
    }
    // If `onMessage` is triggered with a notification, construct our own
    // local notification to show to users using the created channel.

    await flutterLocalNotificationsPlugin.show(
      message.notification.hashCode,
      message.notification?.title,
      message.notification?.body,
      platformChannelSpecifics,
      payload: message.data.toString(),
    );
  });
  //Routing on tap notification
  // when app is in background

  FirebaseMessaging.onMessageOpenedApp.listen((message) async {
    print("this is on onMessageOpenedApp");
    RemoteNotification? notification = message.notification;
    AndroidNotification? android = message.notification?.android;
    print("notification data" + message.data.toString());

    // If `onMessage` is triggered with a notification, construct our own
    // local notification to show to users using the created channel.
    if (message.notification != null) {
      if (message.data['type'] == 'editprofile') {}
      Map<String, dynamic> map = HashMap();

      print(map.toString());
      map["title"] = message.notification!.title;
      map["body"] = message.notification!.body;
      if (message.data.isNotEmpty) {
        if (message.data.containsKey("type")) {
          map["type"] = message.data["type"];
        }
      }
    }

    await flutterLocalNotificationsPlugin.show(
      10,
      message.notification!.title,
      message.notification!.body,
      platformChannelSpecifics,
      payload: message.data.toString(),
    );
  });
}

// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   if (message.data.isNotEmpty) {
//     // Handle data message
//     final dynamic data = message.data;
//   }

//   if (message.notification != null) {
//     // Handle notification message
//     final dynamic notification = message.notification;
//   }

//   // Or do other work.
// }

// messaginghandlers() {
//   // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
// }

getFCMtoken() async {
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  var fcmtokem;
  await messaging.getToken().then((value) {
    fcmtokem = value;
  });
  print(fcmtokem);
  return fcmtokem;
}

// listeningMessaging() async {
//   FirebaseMessaging messaging = FirebaseMessaging.instance;

//   await flutterLocalNotificationsPlugin
//       .resolvePlatformSpecificImplementation<
//           AndroidFlutterLocalNotificationsPlugin>()
//       ?.createNotificationChannel(channel);
//   FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
//     RemoteNotification notification = message.notification!;
//     AndroidNotification android = message.notification!.android!;
//     print("====== this is on message listening ");
//     // If `onMessage` is triggered with a notification, construct our own
//     // local notification to show to users using the created channel.
//     if (notification.body != null && android != null) {
//       await flutterLocalNotificationsPlugin.show(
//           notification.hashCode,
//           notification.title,
//           notification.body,
//           NotificationDetails(
//             android: AndroidNotificationDetails(
//               channel.id,
//               channel.name,
//               channelDescription: channel.description,
//               icon: android.smallIcon,
//               // other properties...
//             ),
//           ));
//     }
//   });
//   FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
//     RemoteNotification notification = message.notification!;
//     AndroidNotification android = message.notification!.android!;
//     // If `onMessageOpenedApp` is triggered with a notification, construct our own
//     // local notification to show to users using the created channel.
//     print("====== this is on opened app message listening ");
//     if (notification.body != null && android != null) {
//       await flutterLocalNotificationsPlugin.show(
//           notification.hashCode,
//           notification.title,
//           notification.body,
//           NotificationDetails(
//             android: AndroidNotificationDetails(
//               channel.id,
//               channel.name,
//               channelDescription: channel.description,
//               icon: android.smallIcon,
//               // other properties...
//             ),
//           ));
//     }
//   });
// }

// void requestNotificationPermission() async {
//   FirebaseMessaging messaging = FirebaseMessaging.instance;
//   final BehaviorSubject<String?> selectNotificationSubject =
//       BehaviorSubject<String?>();
//   final BehaviorSubject<ReceivedNotification>
//       didReceiveLocalNotificationSubject =
//       BehaviorSubject<ReceivedNotification>();
//   String? selectedNotificationPayload;

//   NotificationSettings settings = await messaging.requestPermission(
//     alert: true,
//     announcement: false,
//     badge: true,
//     carPlay: false,
//     criticalAlert: false,
//     provisional: false,
//     sound: true,
//   );

//   await messaging.setForegroundNotificationPresentationOptions(
//     alert: true, // Required to display a heads up notification
//     badge: true,
//     sound: true,
//   );
//   const AndroidInitializationSettings initializationSettingsAndroid =
//       AndroidInitializationSettings('@mipmap/ic_launcher');

//   final DarwinInitializationSettings initializationSettingsIOS =
//       DarwinInitializationSettings(
//           requestAlertPermission: true,
//           requestBadgePermission: true,
//           requestSoundPermission: true,
//           onDidReceiveLocalNotification: (
//             int id,
//             String? title,
//             String? body,
//             String? payload,
//           ) async {
//             didReceiveLocalNotificationSubject.add(
//               ReceivedNotification(
//                 id: id,
//                 title: title,
//                 body: body,
//                 payload: payload,
//               ),
//             );
//           });

//   final InitializationSettings initializationSettings = InitializationSettings(
//     android: initializationSettingsAndroid,
//     iOS: initializationSettingsIOS,
//   );
//   await flutterLocalNotificationsPlugin.initialize(initializationSettings,
//       onDidReceiveBackgroundNotificationResponse:
//           (NotificationResponse? payload) async {
//     if (payload != null) {
//       debugPrint('notification payload: $payload');
//       // navigatorKey.currentState!.pushNamed("/notification");

//     }
//     selectedNotificationPayload = payload?.payload;
//     selectNotificationSubject.add(payload?.payload);
//   });

//   // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

//   await flutterLocalNotificationsPlugin
//       .resolvePlatformSpecificImplementation<
//           AndroidFlutterLocalNotificationsPlugin>()
//       ?.createNotificationChannel(channel);

//   print('User granted permission: ${settings.authorizationStatus}');
// }
