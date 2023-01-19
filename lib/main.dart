import 'dart:async';
import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:pet_app/Api/Prefrence.dart';
import 'package:pet_app/Colors/COLORS.dart';
import 'package:pet_app/Provider/Provider.dart';
import 'package:pet_app/Provider/Reminder_provider.dart';
import 'package:pet_app/Screens/Splash.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Api/Services.dart';
import 'AppServices/BackgroundServices.dart';
import 'AppServices/cron_servies.dart';
import 'Notification/notificationMathod.dart';
import 'Provider/AddCycle.dart';
import 'Provider/AppleSignin_provider.dart';
import 'Provider/ServiceListProvider.dart';
import 'Provider/predictionProvider.dart';
import 'Testing1/linearCalender.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

import 'UTILS/Utils.dart';

const fetchBackground = "fetchBackground";
const foregorundfetch = "foregorundfetch";
late String localPath;
bool isLoading = false;

// void callbackDispatcher() {
//   Workmanager().executeTask((task, inputData) async {
//     print("=====12345");
//     await getreminderData();
//     // initializeService();
//     // Timer.periodic(Duration(seconds: 2), ((timer) {
//     //   print("this is running");
//     // }));
//     // switch (task) {
//     //   case fetchBackground:
//     //     // Code to run in background
//     //     print("======" + inputData!["id"]);
//     //     print("exicuting notifications");
//     //     Random a = Random();
//     //     NotificationHelper().scheduleonday(
//     //         a.nextInt(99),
//     //         "Test",
//     //         "Testing ${inputData["id"]}",
//     //         DateTime(
//     //           2023,
//     //           01,
//     //           10,
//     //           DateTime.now().hour,
//     //           DateTime.now().minute + 1,
//     //         ));
//     //     break;
//     //   case foregorundfetch:
//     //     print("=====12345");
//     //     Timer.periodic(Duration(seconds: 2), ((timer) {
//     //       print("this is running");
//     //     }));
//     //     break;
//     // }
//     return Future.value(true);
//   });
// }

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  await inMainMethodCall();
  await shownotification();
  await NotificationHelper().configureLocalTimeZone();
  Preference.Pref = await SharedPreferences.getInstance();

  // await Workmanager().initialize(
  //   callbackDispatcher,
  //   isInDebugMode: true,
  // );
  initializeService();
  // cron_services();
  prepareSaveDir();

  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<Predictions>(
            create: (context) => Predictions(),
          ),
          ChangeNotifierProvider<AddCycleProvider>(
              create: (context) => AddCycleProvider()),
          ChangeNotifierProvider<ProviderTutorial>(
              create: (context) => ProviderTutorial()),
          ChangeNotifierProvider<ServiceHealthProvider>(
              create: (context) => ServiceHealthProvider()),
          // ChangeNotifierProvider<AddPetProvider>(
          //     create: (context) => AddPetProvider()),
          ChangeNotifierProvider<CycleTrackingProvider>(
              create: (context) => CycleTrackingProvider()),
          ChangeNotifierProvider<CurrentPage>(
              create: ((context) => CurrentPage())),
          ChangeNotifierProvider<AuthenticationProvider>(
              create: ((context) =>
                  AuthenticationProvider(FirebaseAuth.instance))),
          ChangeNotifierProvider<CalenderProvider>(
              create: ((context) => CalenderProvider())),
          ChangeNotifierProvider<ReminderService>(
              create: ((context) => ReminderService())),
        ],
        child: AnnotatedRegion<SystemUiOverlayStyle>(
          value: const SystemUiOverlayStyle(
              statusBarIconBrightness: Brightness.light,
              systemNavigationBarContrastEnforced: true),
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Pet App',
            theme: ThemeData(
              appBarTheme: const AppBarTheme(
                iconTheme: IconThemeData(color: BLACK_CLR),
                color: Colors.deepPurpleAccent,
                foregroundColor: Colors.transparent,
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Colors.transparent,
                  statusBarIconBrightness: Brightness.dark,
                  statusBarBrightness: Brightness.dark,
                ),
              ),
              // iconTheme: Theme.of(context).iconTheme,
              fontFamily: "Poppins",
              // buttonColor: BLACK_CLR,
              primarySwatch: Colors.blue,
            ),
            home: Splash(),
          ),
        ));
  }
}
