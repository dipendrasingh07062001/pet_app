
import 'package:flutter/material.dart';
import 'package:pet_app/Colors/COLORS.dart';
import 'package:pet_app/Provider/LoginProvider.dart';
import 'package:pet_app/Provider/Provider.dart';
import 'package:pet_app/Screens/Splash.dart';
import 'package:provider/provider.dart';

import 'Screens/Add_Pets/addPet.dart';
import 'Screens/ChangePassword.dart';
import 'Screens/CycleTrackingPageViewBuilder/CycleTracking_Page.dart';
import 'Screens/EnterOTP.dart';
import 'Screens/ForgotPassword.dart';
import 'Screens/HOME/Home.dart';

import 'Screens/SuccesFullVerified.dart';
import 'Screens/Tutorial.dart';
import 'SevicesListAll_Screens/Add_Deworming.dart';
import 'SevicesListAll_Screens/Add_Medicine.dart';
import 'SevicesListAll_Screens/Add_Pregnancy.dart';
import 'SevicesListAll_Screens/Add_Vaccinations.dart';
import 'Screens/CycleTrackingPageViewBuilder/Cycle_Tracking4.dart';

void main() {
  runApp( MyApp(),
    );
    
    //  MultiProvider(
    // providers: [
    // Provider<ProviderTutorial>(create: ( context)=>ProviderTutorial(),),
    // // Provider<LoginProvider>(create: (context)=>LoginProvider()),
    // ],child:
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return
     MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pet App',
      theme: ThemeData(
        appBarTheme:AppBarTheme( iconTheme: IconThemeData(
    color: BLACK_CLR
  ),) ,
         iconTheme: Theme.of(context).iconTheme,
        fontFamily: "Poppins",
         buttonColor: BLACK_CLR,
        primarySwatch: Colors.blue,
      ),
      home:  Splash(),
    
    
    );
  }
       
  }




