import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_calendar_widget/flutter_calendar_widget.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:pet_app/Colors/COLORS.dart';
import 'package:pet_app/Componants/Images&Icons.dart';
import 'package:pet_app/Screens/AddPeriod.dart';
import 'package:pet_app/Screens/CycleTrackingPageViewBuilder/CycleTracking_Predication.dart';
import 'package:pet_app/Screens/CycleTrackingPageViewBuilder/Symptoms.dart';
import 'package:pet_app/Screens/HOME/BlogDetailList.dart';
import 'package:pet_app/UTILS/Utils.dart';

class Cycle_Tracking6 extends StatefulWidget {
  const Cycle_Tracking6({super.key});

  @override
  State<Cycle_Tracking6> createState() => _Cycle_Tracking6State();
}

class _Cycle_Tracking6State extends State<Cycle_Tracking6> {
  var h;
  var w;

  double itemWidth = 60.0;
  int selected = 0;
  DateTime now = DateTime.now();
  late DateTime lastDayOfMonth;
  @override
  void initState() {
    super.initState();
    lastDayOfMonth = DateTime(2025, 12, 0);
  }

  FixedExtentScrollController _scrollController =
      FixedExtentScrollController(initialItem: 200);
  var Date;
  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: WHITE70_CLR,
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 65,
        backgroundColor: WHITE70_CLR,
        elevation: 1,
        title: styleText(CYCLE_TRACKING, DARK_CLR, FontWeight.bold, 16),
        actions: [
          Padding(
            padding: const EdgeInsets.all(18),
            child: MaterialButton(
                height: 35,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: BorderSide(color: GRAY_CLR)),
                onPressed: () {
                  Navigate_to(context, Add_Period());
                },
                child: Text(
                  ADD_PERIOD,
                  style: TextStyle(
                      color: GREEN_CLR,
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                )),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(left: w * 0.030, right: w * 0.030),
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
              height: h * 0.040,
            ),

            Align(
                alignment: Alignment.center,
                child: TutorialText("Today, ${selected} August", BLACK_CLR,
                    FontWeight.bold, 15)),

            Stack(children: [
              Container(
                margin: EdgeInsets.only(top: 10),
                width: w * 1,
                decoration: BoxDecoration(
                    border:
                        Border(top: BorderSide(color: GREEN_CLR, width: 2))),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 7),
                  child: Image.asset(
                    DROP_ICON,
                    height: 30,
                    color: GREEN_CLR,
                    // color: GREEN_CLR,
                  ),
                ),
              )
            ]),

            Container(
              alignment: Alignment.bottomCenter,
              height: h * 0.12,
              child: RotatedBox(
                  quarterTurns: 5,
                  child: ListWheelScrollView(
                    clipBehavior: Clip.antiAlias,
                    renderChildrenOutsideViewport: false,
                    onSelectedItemChanged: (x) {
                      setState(() {
                        selected = x;
                      });
                      print(selected);
                    },
                    controller: _scrollController,
                    children: List.generate(
                      lastDayOfMonth.day,
                      (x) {
                        final currentDate =
                            lastDayOfMonth.add(Duration(days: x + 1));
                        final dayName = DateFormat('E').format(currentDate);
                        return Row(
                          children: [
                            Container(
                              height: 28.0,
                              width: 28.0,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: x == selected
                                    ? GREEN_CLR
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(100.0),
                              ),
                              child: Transform.rotate(
                                angle: -70.7,
                                child: Text(
                                  dayName.substring(0, 1),
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    color: x == selected ? WHITE_CLR : GRAY_CLR,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Transform.rotate(
                              angle: -80.1,
                              child: SvgPicture.asset(CYCLE_TRACKING_IMAGE,
                                  height: x == selected ? 50 : 40,
                                  color: x == selected
                                      ? GREEN_CLR
                                      : GREEN_CLR.withOpacity(0.8)),
                            ),
                          ],
                        );
                      },
                    ),
                    itemExtent: itemWidth,
                  )),
            ),

            Align(
              alignment: Alignment.center,
              child: Container(
                margin: EdgeInsets.only(top: 10),
                height: 1.2,
                width: w * 1,
                color: GRAY_CLR.withOpacity(0.3),
              ),
            ),

            SizedBox(
              height: h * 0.020,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                styleText(CYCLE_LOG, DARK_CLR, FontWeight.bold, 18),
                styleText(OPTION, GREEN_CLR, FontWeight.normal, 14),
              ],
            ),

            SizedBox(
              height: h * 0.005,
            ),
            styleText(MENSTRUATION, FADE_GREEN_CLR, FontWeight.bold, 13),

            Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(top: h * 0.010),
                height: h * 0.06,
                width: w * 1,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10), color: BROUN_CLR),
                child: GestureDetector(
                  onTap: () => Navigate_to(context, Symptoms()),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        styleText(PERIOD, BLACK_CLR, FontWeight.normal, 15),
                        Icon(
                          Icons.add,
                          size: 20,
                          color: GRAY_CLR,
                        )
                      ],
                    ),
                  ),
                )),
            SizedBox(
              height: h * 0.025,
            ),
            styleText(OTHER_DATA, FADE_GREEN_CLR, FontWeight.bold, 13),

            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(top: h * 0.010),
              height: h * 0.11,
              width: w * 1,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: BROUN_CLR),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () => Navigate_to(context, Symptoms()),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          styleText(
                              SYMPTOMAS, BLACK_CLR, FontWeight.normal, 15),
                          Icon(
                            Icons.add,
                            size: 20,
                            color: GRAY_CLR,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Divider(
                      color: GRAY_CLR.withOpacity(0.2),
                      thickness: 2,
                    ),
                    GestureDetector(
                      onTap: () => Navigate_to(context, Symptoms()),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          styleText(SPPOTING, BLACK_CLR, FontWeight.normal, 15),
                          Icon(
                            Icons.add,
                            size: 20,
                            color: GRAY_CLR,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: h * 0.020,
            ),

            Divider(
              color: GRAY_CLR.withOpacity(0.4),
              thickness: 1,
            ),
            SizedBox(
              height: h * 0.010,
            ),

            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                styleText(PREDICTION, DARK_CLR, FontWeight.bold, 18),
                GestureDetector(
                    onTap: () =>
                        Navigate_to(context, CycleTracking_Predication()),
                    child:
                        styleText(SHOW_ALL, GREEN_CLR, FontWeight.normal, 13)),
              ],
            ),

            SizedBox(
              height: h * 0.005,
            ),
            styleText(PERIOD_PREDICTION, FADE_GREEN_CLR, FontWeight.bold, 13),
            SizedBox(
              height: h * 0.010,
            ),
            styleText(
                "Your pet’s period is likely to start on or around 23 August",
                DARK_CLR,
                FontWeight.bold,
                15),

            SizedBox(
              height: h * 0.020,
            ),

            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: FlutterCalendar(
                style: const CalendarStyle(
                  rangeLineColor: FADE_GREEN_CLR,
                  markerColor: GREEN_CLR,
                ),
                isHeaderDisplayed: true,
                selectionMode: CalendarSelectionMode.multiple,
                onMultipleDates: (List<DateTime> dates) {
                  for (var date in dates) {
                    Date = date!;
                    print(date);
                  }
                },
              ),
            ),

            //  Text("$Date"),

            SizedBox(
              height: h * 0.020,
            ),

            styleText(CYCLE_TRACKING_BLOG, BLACK_CLR, FontWeight.bold, 19),

            SizedBox(
              height: h * 0.015,
            ),

            SizedBox(
                height: h * 0.25,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: BlogDetailsList(),
                )),

            SizedBox(
              height: h * 0.050,
            ),
          ]),
        ),
      ),
    );
  }
}
