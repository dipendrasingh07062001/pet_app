import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pet_app/Api/Prefrence.dart';
import 'package:pet_app/Colors/COLORS.dart';
import 'package:pet_app/Provider/Provider.dart';
import 'package:pet_app/Screens/HOME/Home.dart';
import 'package:pet_app/Screens/Splash.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Provider/ServiceListProvider.dart';

bool isLoading = false;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Preference.Pref = await SharedPreferences.getInstance();
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
          ChangeNotifierProvider<ProviderTutorial>(
              create: (context) => ProviderTutorial()),
          ChangeNotifierProvider<ServiceHealthProvider>(
              create: (context) => ServiceHealthProvider()),
          ChangeNotifierProvider<AddPetProvider>(
              create: (context) => AddPetProvider()),
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
            home: const Splash(),
          ),
        ));
  }
}
