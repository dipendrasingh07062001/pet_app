import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:isolate';
import 'dart:math';
import 'dart:ui';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_background_service_android/flutter_background_service_android.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:pet_app/AppServices/database.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Api/ApiBaseUrl.dart';
import '../Api/Models/remindermodel.dart';
import '../Api/Models/schedulemodel.dart';
import '../Api/Prefrence.dart';
import '../Api/Services.dart';
import '../Notification/notificationMathod.dart';
import '../UTILS/Utils.dart';
import 'package:http/http.dart' as http;

import 'cron_servies.dart';

// Future <SendPort> initIsolate()async{}
dynamic initializeService() async {
  final service = FlutterBackgroundService();
  print("=======initalizing");

  await service.configure(
    androidConfiguration: AndroidConfiguration(
      // this will be executed when app is in foreground or background in separated isolate
      onStart: onStart,

      // auto start service
      autoStart: true,
      isForegroundMode: false,

      notificationChannelId: 'high_importance_channel',
      initialNotificationTitle: 'Background service',
      initialNotificationContent: 'Initializing',
      foregroundServiceNotificationId: 888,
    ),
    iosConfiguration: IosConfiguration(
      // auto start service
      autoStart: true,

      // this will be executed when app is in foreground in separated isolate
      onForeground: onStart,

      // you have to enable background fetch capability on xcode project
      onBackground: onIosBackground,
    ),
  );

  service.startService();
  return service.isRunning().toString();
}

// to ensure this is executed
// run app from xcode, then from xcode menu, select Simulate Background Fetch

@pragma('vm:entry-point')
Future<bool> onIosBackground(ServiceInstance service) async {
  WidgetsFlutterBinding.ensureInitialized();
  DartPluginRegistrant.ensureInitialized();
  return true;
}

@pragma('vm:entry-point')
void onStart(ServiceInstance service) async {
  // Only available for flutter 3.0.0 and later
  DartPluginRegistrant.ensureInitialized();

  // For flutter prior to version 3.0.0
  // We have to register the plugin manually
  /// OPTIONAL when use custom notification

  if (service is AndroidServiceInstance) {
    service.on('setAsForeground').listen((event) async {
      service.setAsForegroundService();
    });

    service.on('setAsBackground').listen((event) async {
      service.setAsBackgroundService();
    });
  }

  service.on('stopService').listen((event) async {
    service.stopSelf();
  });
  Timer.periodic(const Duration(seconds: 30), (timer) async {
    List<Note> list = await NotesDatabase.instance.readAllNotes();
    print('FLUTTER BACKGROUND SERVICE====: ${DateTime.now()}');
    list.forEach((element) {
      final time = to24Hours(element.attime);
      final date = DateTime.parse(element.nextdate);
      DateTime date2 = DateTime(
        date.year,
        date.month,
        date.day - 1,
        int.parse(time.split(":").first),
        int.parse(time.split(":")[1]),
      );
      print("notify ${element.which} date $date2");
      if (date2.isAfter(DateTime.now())) {
        if (is_In_This_hour(date2)) {
          flutterLocalNotificationsPlugin.show(
            element.id!,
            element.medicine_name,
            "Please give ${element.which == "medicine" ? "medicine" : element.which == "vaccine" ? "vaccine" : "dewarming"} to your pet",
            platformChannelSpecifics,
          );
        }
      }
    });
  });
  // await cron_services();
  // bring to foreground
  // Timer.periodic(const Duration(seconds: 10), (timer) async {
  //   // if (service is AndroidServiceInstance) {
  //   //   if (await service.isForegroundService()) {
  //   //     /// OPTIONAL for use custom notification
  //   //     /// the notification id must be equals with AndroidConfiguration when you call configure() method.
  //   //     // flutterLocalNotificationsPlugin.show(
  //   //     //   888,
  //   //     //   'COOL SERVICE',
  //   //     //   'Awesome ${DateTime.now()}',
  //   //     //   platformChannelSpecifics,
  //   //     // );

  //   //     // if you don't using custom notification, uncomment this
  //   //     // service.setForegroundNotificationInfo(
  //   //     //   title: "My App Service",
  //   //     //   content: "Updated at ${DateTime.now()}",
  //   //     // );
  //   //   }
  //   // }

  //   /// you can see this log in logcat
  //   // SharedPreferences preferences = await SharedPreferences.getInstance();
  //   print('FLUTTER BACKGROUND SERVICE====: ${DateTime.now()}');
  //   // List<Daily?>? dailyList = [];
  //   // List<Daily?>? weekList = [];
  //   // dailyList =
  //   //     dailyFromJson(jsonEncode(preferences.getString("dailyReminder")));
  //   // weekList =
  //   //     dailyFromJson(jsonEncode(preferences.getString("weeklyReminder")));
  //   // print(dailyList!.length);
  //   // print(weekList!.length);
  //   // try {
  //   //   var response = await http.post(
  //   //     Uri.parse(baseURL + get_reminder_url),
  //   //     body: {"user_id": Preference.Pref.getInt("userId").toString()},
  //   //     headers: headers,
  //   //   );
  //   //   print("getting response");
  //   //   if (response.statusCode == 200) {
  //   //     final data = json.decode(response.body);
  //   //     print("got response");

  //   //     // List<ReminderModel> list = [];
  //   //     // list = reminderModelFromJson(jsonEncode(data["data"]));

  //   //     // DateTime date = DateTime(
  //   //     //   2023,
  //   //     //   01, 10, 15, 50,
  //   //     //   // int.parse(element.atTime!.split(":").first),
  //   //     //   // int.parse(element.atTime!.split(":")[1]),
  //   //     // );
  //   //     // NotificationHelper().scheduleonday(
  //   //     //   1,
  //   //     //   "qwertyt",
  //   //     //   "Your pet medicine time",
  //   //     //   date,
  //   //     // );

  //   int i = 0;
  //   //     List<Daily?>? dailyList = [];
  //   //     List<Daily?>? weekList = [];
  //   //     dailyList = dailyFromJson(jsonEncode(data["daily"]));
  //   //     weekList = dailyFromJson(jsonEncode(data["week"]));

  //   // dailyList.forEach((element) {
  //   //   DateTime date = DateTime(
  //   //     element!.nextdate!.year,
  //   //     element.nextdate!.month,
  //   //     element.nextdate!.day - 1,
  //   //     int.parse(element.atTime!.split(":").first),
  //   //     int.parse(element.atTime!.split(":")[1]),
  //   //   );
  //   //   if (is_In_This_hour(date)) {
  //   //     flutterLocalNotificationsPlugin.show(
  //   //       i,
  //   //       element.medicineName,
  //   //       "qwertyuiopuytre daily",
  //   //       platformChannelSpecifics,
  //   //     );
  //   //     i++;

  //   //     //   NotificationHelper().scheduleonday(
  //   //     //     i,
  //   //     //     element.medicineName.toString(),
  //   //     //     "Your pet medicine time",
  //   //     //     date,
  //   //     //   );
  //   //     //   i++;
  //   //   }
  //   // });
  //   // weekList.forEach((element) {
  //   //   DateTime date = DateTime(
  //   //     element!.nextdate!.year,
  //   //     element.nextdate!.month,
  //   //     element.nextdate!.day,
  //   //     int.parse(element.atTime!.split(":").first),
  //   //     int.parse(element.atTime!.split(":")[1]),
  //   //   );
  //   //   if (is_In_This_hour(date)) {
  //   //     flutterLocalNotificationsPlugin.show(
  //   //       i,
  //   //       element.medicineName,
  //   //       "qwertyuiopuytre week",
  //   //       platformChannelSpecifics,
  //   //     );
  //   //     i++;

  //   //     //   NotificationHelper().scheduleonday(
  //   //     //     i,
  //   //     //     element.medicineName.toString(),
  //   //     //     "Your pet medicine time",
  //   //     //     date,
  //   //     //   );
  //   //     //   i++;
  //   //   }
  //   // });

  //   //     // return list;
  //   //     // customSnackbar(context, jsoncode["message"]);

  //   //   } else {}
  //   // } catch (e) {
  //   //   // TODO
  //   //   ;
  //   // }
  //   // await getreminderData();

  //   // test using external plugin
  //   final deviceInfo = DeviceInfoPlugin();
  //   String? device;
  //   if (Platform.isAndroid) {
  //     final androidInfo = await deviceInfo.androidInfo;
  //     device = androidInfo.model;
  //   }

  //   if (Platform.isIOS) {
  //     final iosInfo = await deviceInfo.iosInfo;
  //     device = iosInfo.model;
  //   }

  //   service.invoke(
  //     'update',
  //     {
  //       "current_date": DateTime.now().toIso8601String(),
  //       "device": device,
  //     },
  //   );
  // });
}
