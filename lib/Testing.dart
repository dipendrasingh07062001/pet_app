import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:pet_app/Colors/COLORS.dart';
import 'package:pet_app/Screens/Add_Pets/AddPet3.dart';
import 'UTILS/Utils.dart';

// class WorkoutScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar: CalendarAppBar(),
//         body: SingleChildScrollView(
//           physics: BouncingScrollPhysics(),
//           child: Column(
//             children: [
//               SizedBox(height: 12),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   WorkoutDetailsCard(),
//                 ],
//               ),
//               SizedBox(height: 22),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   StepsCard(),
//                 ],
//               ),
//               SizedBox(height: 22),
//               Row(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.only(left: 16),
//                     child: Text(
//                       'Track your workout',
//                       style: openSans22DarkBold,
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 12),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   TrackWorkoutCard(),
//                 ],
//               ),
//               SizedBox(height: 22),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   AddWorkoutCard(),
//                 ],
//               ),
//               SizedBox(height: 22),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   AverageCalBurntCard(),
//                 ],
//               ),
//               SizedBox(height: 22),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   ReminderCard(),
//                 ],
//               ),
//               SizedBox(height: 34),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }



class CalendarAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CalendarAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(148.0);

  @override
  State<CalendarAppBar> createState() => _CalendarAppBarState();
}

class _CalendarAppBarState extends State<CalendarAppBar> {


  int selectedIndex = 0;
  DateTime now = DateTime.now();
  late DateTime lastDayOfMonth;
  @override
  void initState() {
    super.initState();
    lastDayOfMonth = DateTime(now.year, now.month + 1, 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        children: [

          SizedBox(height: 60,),
          Text(
            ( "Today, 25 August"),
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),

                 
                 


          
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: const ClampingScrollPhysics(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                lastDayOfMonth.day,
                (index) {
                  final currentDate =
                      lastDayOfMonth.add(Duration(days: index + 1));
                  final dayName = DateFormat('E').format(currentDate);
                  return GestureDetector(
                    onTap: () => setState(
                      () {
                        selectedIndex = index;
                      },
                    ),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        

                        SizedBox(height: 8,),
                        Container(
                          height: 30.0,
                          width: 30.0,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: selectedIndex == index
                                ? GREEN_CLR
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(44.0),
                          ),
                          child: Text(
                            dayName.substring(0, 1),
                            style: TextStyle(
                              fontSize: 15.0,
                              color: selectedIndex == index
                                  ? WHITE_CLR
                                  : GRAY_CLR,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),

                        SizedBox(height: 8,),
                        Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: SvgPicture.asset("assets/svg_image/icon1.svg",
                              height:selectedIndex == index ?65:50,
                              color: selectedIndex == index
                              ? GREEN_CLR
                              : GREEN_CLR.withOpacity(0.8)
                              ),
                            ),
               ],
                    ),
                  );
                },
              ),
            ),
          ),


        ],
      ),
    );
  }
}