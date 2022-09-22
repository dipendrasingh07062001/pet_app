
import 'package:flutter/material.dart';
import 'package:pet_app/Colors/COLORS.dart';
import 'package:pet_app/Provider/Provider.dart';
import 'package:pet_app/Screens/HOME/Home.dart';
import 'package:pet_app/Screens/Splash.dart';
import 'package:provider/provider.dart';
import 'Provider/ServiceListProvider.dart';
import 'Screens/CycleTrackingPageViewBuilder/CycleTracking_Page.dart';
import 'Testing.dart';


void main() {
  runApp( MyApp(),
    );

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return
     MultiProvider(
      
       providers: [
        ChangeNotifierProvider<ProviderTutorial>(create: (context)=>ProviderTutorial()),
        ChangeNotifierProvider<ServicesListProvider>(create: (context)=>ServicesListProvider()),
        ChangeNotifierProvider<ServiceHealthProvider>(create:(context)=>ServiceHealthProvider()),
        ChangeNotifierProvider<BlogDetailProvider>(create:  (context)=>BlogDetailProvider()),
        ChangeNotifierProvider<addPetProvider>(create: (context)=>addPetProvider()),
        ChangeNotifierProvider<CycleTrackingProvider>(create: (context)=>CycleTrackingProvider())

       ],
       child: MaterialApp(
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
        home:  MyHomePAge(),
         
         
         ),
     );
  }
       
  }









  