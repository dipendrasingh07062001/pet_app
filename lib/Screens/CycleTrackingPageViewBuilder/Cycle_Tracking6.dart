import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pet_app/Colors/COLORS.dart';
import 'package:pet_app/Componants/Images&Icons.dart';
import 'package:pet_app/Screens/AddPeriod.dart';
import 'package:pet_app/Screens/CycleTrackingPageViewBuilder/CycleTracking_Predication.dart';
import 'package:pet_app/Screens/CycleTrackingPageViewBuilder/Edit_cycle_previus.dart';
import 'package:pet_app/Screens/CycleTrackingPageViewBuilder/Symptoms.dart';
import 'package:pet_app/UTILS/Utils.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../Api/Services.dart';
import '../../Provider/predictionProvider.dart';
import '../../Testing1/linearCalender.dart';
import 'Cycle_prediction.dart';
import 'cycleTrackingBlog.dart';

class Cycle_Tracking6 extends StatefulWidget {
  const Cycle_Tracking6({super.key});

  @override
  State<Cycle_Tracking6> createState() => _Cycle_Tracking6State();
}

class _Cycle_Tracking6State extends State<Cycle_Tracking6> {
  var h;
  var w;

  double itemWidth = 55;
  int selected = 0;

  DateTime now = DateTime.now();
  late DateTime lastDayOfMonth;
  bool isLoading = true;

  List list = [];
  @override
  void initState() {
    super.initState();
    lastDayOfMonth = DateTime(2025, 12, 0);
    context.read<Predictions>().getPreductionDates(context).then((value) {
      isLoading = false;
      setState(() {});
    });
    getcycletracking(context);
    list = List.generate(lastDayOfMonth.day, (x) => false);
  }

  FixedExtentScrollController _scrollController = FixedExtentScrollController();
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
            padding: const EdgeInsets.only(right: 10, top: 18, bottom: 18),
            child: MaterialButton(
                height: 35,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: const BorderSide(color: GRAY_CLR)),
                onPressed: () {
                  Navigate_to(context, const Add_Period());
                },
                child: const Text(
                  ADD_PERIOD,
                  style: TextStyle(
                      color: GREEN_CLR,
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10, top: 18, bottom: 18),
            child: MaterialButton(
                height: 35,
                minWidth: 10,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: const BorderSide(color: GRAY_CLR)),
                onPressed: () {
                  Navigate_to(context, const EditCycle_tracking());
                },
                child: const Text(
                  "Edit",
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

            LinearCalender(),

            Align(
              alignment: Alignment.center,
              child: Container(
                margin: const EdgeInsets.only(top: 10),
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
            Consumer<CalenderProvider>(
              builder: (context, value, child) {
                return GestureDetector(
                  onTap: () => Navigate_to(
                      context,
                      Symptoms(
                        index: 0,
                      )),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(top: h * 0.010),
                    height: h * 0.06,
                    width: w * 1,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: BROUN_CLR),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          styleText(PERIOD, BLACK_CLR, FontWeight.normal, 15),
                          value.days[value.initialPage].iscycle
                              ? styleText(
                                  "Had Flow", RED_CLR, FontWeight.normal, 15)
                              : const Icon(
                                  Icons.add,
                                  size: 20,
                                  color: GRAY_CLR,
                                )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
            SizedBox(
              height: h * 0.025,
            ),
            styleText(OTHER_DATA, FADE_GREEN_CLR, FontWeight.bold, 13),
            Consumer<CalenderProvider>(builder: (context, value, child) {
              return Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(top: h * 0.010),
                height: h * 0.11,
                width: w * 1,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10), color: BROUN_CLR),
                child: Column(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () => Navigate_to(
                            context,
                            Symptoms(
                              index: 1,
                            )),
                        child: Container(
                          color: Colors.transparent,
                          padding: EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              styleText(
                                  SYMPTOMAS, BLACK_CLR, FontWeight.normal, 15),
                              value.days[value.initialPage].iscycle
                                  ? styleText(
                                      value.days[value.initialPage].symptoms,
                                      RED_CLR,
                                      FontWeight.normal,
                                      15)
                                  : const Icon(
                                      Icons.add,
                                      size: 20,
                                      color: GRAY_CLR,
                                    )
                            ],
                          ),
                        ),
                      ),
                    ),
                    // const SizedBox(
                    //   height: 5,
                    // ),
                    Divider(
                      color: GRAY_CLR.withOpacity(0.2),
                      thickness: 2,
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () => Navigate_to(
                            context,
                            Symptoms(
                              index: 2,
                            )),
                        child: Container(
                          color: Colors.transparent,
                          padding: EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              styleText(
                                  SPPOTING, BLACK_CLR, FontWeight.normal, 15),
                              value.days[value.initialPage].iscycle
                                  ? styleText(
                                      value.days[value.initialPage].spotting,
                                      RED_CLR,
                                      FontWeight.normal,
                                      15)
                                  : const Icon(
                                      Icons.add,
                                      size: 20,
                                      color: GRAY_CLR,
                                    )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              );
            }),
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
                        Navigate_to(context, const CycleTracking_Predication()),
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
            isLoading
                ? loader
                : Consumer<Predictions>(builder: ((context, value, child) {
                    return Cycle_prediction_cal(
                      index: 0,
                    );
                  })),
            // context.watch<Predictions>().isLoading
            //     ? loader
            //     : Cycle_prediction_cal(
            //         index: 0,
            //       ),
            SizedBox(
              height: h * 0.020,
            ),
            // Card(
            //   shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(10)),
            //   child: FlutterCalendar(
            //     style: const CalendarStyle(
            //       rangeLineColor: FADE_GREEN_CLR,
            //       markerColor: GREEN_CLR,
            //     ),
            //     isHeaderDisplayed: true,
            //     selectionMode: CalendarSelectionMode.multiple,
            //     onMultipleDates: (List<DateTime> dates) {
            //       for (var date in dates) {
            //         Date = date;
            //         print(date);
            //       }
            //     },
            //   ),
            // ),

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
                child: const Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: CycleTrackingBlog(),
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
