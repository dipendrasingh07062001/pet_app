// ignore_for_file: deprecated_member_use

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:permission_handler/permission_handler.dart' as permission;
import 'package:rxdart/rxdart.dart';
import 'dart:collection';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

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
          AndroidFlutterLocalNotificationsPlugin>()
      ?.requestPermission();
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

class NotificationHelper {
  /// Initialize notification
  initializeNotification() async {
    configureLocalTimeZone();
    const DarwinInitializationSettings initializationSettingsIOS =
        DarwinInitializationSettings();

    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings("ic_launcher");

    const InitializationSettings initializationSettings =
        InitializationSettings(
      iOS: initializationSettingsIOS,
      android: initializationSettingsAndroid,
    );
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  /// Set right date and time for notifications
  tz.TZDateTime _convertTime(int hour, int minutes) {
    final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
    tz.TZDateTime scheduleDate = tz.TZDateTime(
      tz.local,
      now.year,
      now.month,
      now.day,
      hour,
      minutes,
    );
    if (scheduleDate.isBefore(now)) {
      scheduleDate = scheduleDate.add(const Duration(days: 1));
    }
    return scheduleDate;
  }

  Future<void> configureLocalTimeZone() async {
    tz.initializeTimeZones();
    final String timeZone = await FlutterNativeTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(timeZone));
  }

  /// Scheduled Notification
  schedulDailyNotification(
    int id,
    String title,
    String body,
    RepeatInterval repeatInterval,
    int hour,
    int minute,
  ) async {
    Time notificationTime = Time(
      hour,
      minute,
    );
    print("showing notification at $hour : $minute");
    await flutterLocalNotificationsPlugin.showDailyAtTime(
      id,
      title,
      body,
      notificationTime,
      platformChannelSpecifics,
    );
    // final scheduledate = tz.TZDateTime(
    //     tz.local, date.year, date.month, date.day, date.hour, date.minute + 1);
    // UILocalNotificationDateInterpretation
    //     uiLocalNotificationDateInterpretation =
    //     UILocalNotificationDateInterpretation.absoluteTime;
    // await flutterLocalNotificationsPlugin.zonedSchedule(
    //   0,
    //   title + "zoned",
    //   body,
    //   scheduledate,
    //   platformChannelSpecifics,
    //   uiLocalNotificationDateInterpretation:
    //       uiLocalNotificationDateInterpretation,
    //   androidAllowWhileIdle: true,
    // );

    // await flutterLocalNotificationsPlugin.periodicallyShow(
    //   0,
    //   title,
    //   body,
    //   repeatInterval,
    //   platformChannelSpecifics,
    // );
  }

  scheduleWeeklynotification(
    int id,
    String title,
    String body,
    RepeatInterval repeatInterval,
    int hour,
    int minute,
    Day day,
  ) async {
    Time notificationTime = Time(
      hour,
      minute,
    );
    await flutterLocalNotificationsPlugin.showWeeklyAtDayAndTime(
      id,
      title,
      body,
      day,
      notificationTime,
      platformChannelSpecifics,
    );
  }

  scheduleonday(
    int id,
    String title,
    String body,
    DateTime date,
  ) async {
    final scheduledate = tz.TZDateTime(
        tz.local, date.year, date.month, date.day, date.hour, date.minute);
    UILocalNotificationDateInterpretation
        uiLocalNotificationDateInterpretation =
        UILocalNotificationDateInterpretation.absoluteTime;
    print("this scheduled on $date");
    print("this scheduled on $scheduledate");
    await flutterLocalNotificationsPlugin.zonedSchedule(
      0,
      title,
      body,
      scheduledate,
      platformChannelSpecifics,
      uiLocalNotificationDateInterpretation:
          uiLocalNotificationDateInterpretation,
      androidAllowWhileIdle: true,
    );
  }

  // scheduledNotification({
  //   required int hour,
  //   required int minutes,
  //   required int id,
  //   required String sound,
  // }) async {
  //   await flutterLocalNotificationsPlugin.zonedSchedule(
  //     id,
  //     'It\'s time to drink water!',
  //     'After drinking, touch the cup to confirm',
  //     _convertTime(hour, minutes),
  //     NotificationDetails(
  //       android: AndroidNotificationDetails(
  //         'your channel id $sound',
  //         'your channel name',
  //         channelDescription: 'your channel description',
  //         importance: Importance.max,
  //         priority: Priority.high,
  //         sound: RawResourceAndroidNotificationSound(sound),
  //       ),
  //       iOS: DarwinNotificationDetails(sound: '$sound.mp3'),
  //     ),
  //     androidAllowWhileIdle: true,
  //     uiLocalNotificationDateInterpretation:
  //         UILocalNotificationDateInterpretation.absoluteTime,
  //     matchDateTimeComponents: DateTimeComponents.time,
  //     payload: 'It could be anything you pass',
  //   );
  // }

  /// Request IOS permissions
  void requestIOSPermissions() {
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
          alert: true,
          badge: true,
          sound: true,
        );
  }

  cancelAll() async => await flutterLocalNotificationsPlugin.cancelAll();
  cancel(id) async => await flutterLocalNotificationsPlugin.cancel(id);
}
