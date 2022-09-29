import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pet_app/Colors/COLORS.dart';
import 'package:pet_app/Prefrence.dart';
import 'package:pet_app/Provider/Provider.dart';
import 'package:pet_app/Screens/Splash.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Provider/ServiceListProvider.dart';
import 'Screens/ChangePassword1.dart';
import 'Screens/Login.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Preference.Pref = await SharedPreferences.getInstance();
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the  Provider root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<ProviderTutorial>(
              create: (context) => ProviderTutorial()),
          ChangeNotifierProvider<ServicesListProvider>(
              create: (context) => ServicesListProvider()),
          ChangeNotifierProvider<ServiceHealthProvider>(
              create: (context) => ServiceHealthProvider()),
          ChangeNotifierProvider<BlogDetailProvider>(
              create: (context) => BlogDetailProvider()),
          ChangeNotifierProvider<addPetProvider>(
              create: (context) => addPetProvider()),
          ChangeNotifierProvider<CycleTrackingProvider>(
              create: (context) => CycleTrackingProvider())
        ],
        child: AnnotatedRegion<SystemUiOverlayStyle>(
          value: const SystemUiOverlayStyle(
              statusBarIconBrightness: Brightness.light,
              systemNavigationBarContrastEnforced: true),
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Pet App',
            theme: ThemeData(
              appBarTheme: AppBarTheme(
                iconTheme: IconThemeData(color: BLACK_CLR),
                color: Colors.deepPurpleAccent,
                foregroundColor: Colors.red,
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Colors.transparent,
                  statusBarIconBrightness: Brightness.dark,
                  statusBarBrightness: Brightness.dark,
                ),
              ),
              // iconTheme: Theme.of(context).iconTheme,
              fontFamily: "Poppins",
              buttonColor: BLACK_CLR,
              primarySwatch: Colors.blue,
            ),
            home: Splash(),
          ),
        ));
  }
}
