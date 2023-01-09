import 'dart:async';
import 'dart:isolate';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pet_app/Api/Prefrence.dart';
import 'package:pet_app/Colors/COLORS.dart';
import 'package:pet_app/Provider/Provider.dart';
import 'package:pet_app/Provider/Reminder_provider.dart';
import 'package:pet_app/Screens/Splash.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workmanager/workmanager.dart';
import 'AppServices/BackgroundServices.dart';
import 'Notification/notificationMathod.dart';
import 'Provider/AddCycle.dart';
import 'Provider/AppleSignin_provider.dart';
import 'Provider/ServiceListProvider.dart';
import 'Provider/predictionProvider.dart';
import 'Testing1/linearCalender.dart';

const fetchBackground = "fetchBackground";

bool isLoading = false;

void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    switch (task) {
      case fetchBackground:
        // Code to run in background
        print("exicuting notifications");
        Timer.periodic(Duration(seconds: 5), (timer) {
          flutterLocalNotificationsPlugin.show(
            12345,
            'Test Notification',
            'Awesome ${DateTime.now()}',
            // const NotificationDetails(android: androidPlatformChannelSpecifics),
            platformChannelSpecifics,
          );
        });
        break;
    }
    return Future.value(true);
  });
}

Future<void> main() async {
  // SendPort maintoIsolateStream = await initIsolate ();
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  // requestNotificationPermission();
  // listeningMessaging();
  await inMainMethodCall();
  await shownotification();
  await NotificationHelper().configureLocalTimeZone();
  Preference.Pref = await SharedPreferences.getInstance();
  // compute(initializeService(), "background services");
  await Workmanager().initialize(
    callbackDispatcher,
    isInDebugMode: true,
  );
  await Workmanager().registerPeriodicTask(
    "1",
    fetchBackground,
    frequency: Duration(seconds: 5),
    constraints: Constraints(
      networkType: NetworkType.connected,
    ),
  );
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
