import 'dart:collection';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pet_app/Api/Models/cycleModel.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

import '../Api/Services.dart';
import '../Colors/COLORS.dart';
import '../Componants/Images&Icons.dart';
import '../UTILS/Utils.dart';

class LinearCalender extends StatefulWidget {
  const LinearCalender({super.key});

  @override
  State<LinearCalender> createState() => _LinearCalenderState();
}

class _LinearCalenderState extends State<LinearCalender> {
  var read;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    read = context.read<CalenderProvider>();
    read.getDaysInBetween();
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return Consumer<CalenderProvider>(
      builder: ((context, value, child) {
        return Center(
          child: SizedBox(
              // height: h * 0.25,
              width: w,
              child: Column(
                children: [
                  Align(
                      alignment: Alignment.center,
                      child: TutorialText(
                          showdate(value.days[value.initialPage].date!),
                          // DateFormat("EEEE, dd MMM")
                          //     .format(value.days[value.initialPage].date!),
                          BLACK_CLR,
                          FontWeight.bold,
                          15)),
                  // CycleCalendra(),
                  Stack(children: [
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      width: w * 1,
                      decoration: const BoxDecoration(
                          border: Border(
                              top: BorderSide(color: GREEN_CLR, width: 2))),
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 6),
                        child:
                            Image.asset(DROP_ICON, height: 30, color: GREEN_CLR
                                // color: GREEN_CLR,
                                ),
                      ),
                    )
                  ]),
                  CarouselSlider(
                    carouselController: value.carouselController,
                    items: List.generate(value.days.length, (index) {
                      final dayName =
                          DateFormat('E').format(value.days[index].date!);
                      return GestureDetector(
                        onTap: () {
                          if (value.initialPage != index) {
                            value.carouselController.animateToPage(index);
                            return;
                          } else {
                            if (value.days[index].date!
                                .isBefore(DateTime.now())) {
                              value.onselect(index);
                            }
                          }
                        },
                        child: SizedBox(
                          height: h * 0.15,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                height: 28.0,
                                width: 28.0,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: value.initialPage == index
                                      ? GREEN_CLR
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(100.0),
                                ),
                                child: Text(
                                  dayName.substring(0, 1),
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    color: value.initialPage == index
                                        ? WHITE_CLR
                                        : GRAY_CLR,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Stack(
                                  children: [
                                    Center(
                                      child: value.days[index].iscycle
                                          ? Image.asset(
                                              "assets/png_image/dogbone.png",
                                              height: value.initialPage == index
                                                  ? 55
                                                  : 40,
                                            )
                                          : SvgPicture.asset(
                                              // value.days[index].iscycle
                                              //     ?
                                              CYCLE_TRACKING_IMAGE,
                                              // : CYCLE_TRACKING_selected_IMAGE,
                                              height: value.initialPage == index
                                                  ? 55
                                                  : 40,
                                              color: value.initialPage == index
                                                  ? GREEN_CLR
                                                  : GREEN_CLR.withOpacity(0.6)),
                                    ),
                                    // Center(
                                    //   child: Container(
                                    //       height: 15,
                                    //       width: 15,
                                    //       decoration: BoxDecoration(
                                    //           borderRadius:
                                    //               BorderRadius.circular(20),
                                    //           color: value.days[index].iscycle
                                    //               ? Colors.red
                                    //               : Colors.transparent)),
                                    // )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                    options: CarouselOptions(
                      viewportFraction: 0.15,
                      height: h * 0.13,
                      initialPage: value.initialPage,
                      onPageChanged: value.onPageChanged,
                      scrollPhysics: BouncingScrollPhysics(),
                    ),
                  ),
                ],
              )),
        );
      }),
    );
  }
}

class CalenderProvider extends ChangeNotifier {
  List<CycleModel> days = [];
  List<CycleModel> selecteddays = [];
  List<DateTime> addeddays = [];
  List<CycleModel> cycle_tracking_data = [];
  bool isloading = false;
  Set<DateTime> selectedTableDays = LinkedHashSet<DateTime>(
    equals: isSameDay,
    // hashCode: getHashCode,
  );
  void onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    // Update values in a Set
    if (DateTime.now().isAfter(selectedDay)) {
      ondaypressed(selectedDay);
    }
    notifyListeners();
  }

  getCycleData(List data) {
    selecteddays = data
        .map(
          (x) => CycleModel(
            id: x["id"].toString(),
            date: DateTime.parse(x["date"]),
            is_add: 1,
            iscycle: true,
            period: x["period"],
            spotting: x["spotting"],
            symptoms: x["symptoms"],
          ),
        )
        .toList();
    selecteddays.forEach((element) {
      for (int i = 0; i < days.length; i++) {
        if (datematch(days[i].date!, element.date!)) {
          days[i] = element;
          print(days[i].date);
          print(days[i].id);
          print(days[i].is_add);
          print(days[i].iscycle);
          print(days[i].period);
        }
      }
      // days.forEach((e) {
      //   if (datematch(e.date!, element.date!)) {
      //     e = element;
      //     print(e.date);
      //     print(e.id);
      //     print(e.is_add);
      //     print(e.iscycle);
      //     print(e.period);
      //     print(e.spotting);
      //     print(e.symptoms);
      //   }
      // });
    });
    print(days[initialPage]);
    notifyListeners();
  }

  loadingstate(bool value) {
    isloading = value;
    notifyListeners();
  }

  addincalendra() {
    selectedTableDays = selecteddays.map((e) {
      return e.date!;
    }).toSet();
    notifyListeners();
  }

  bool selectedDayPredicate(DateTime day) {
    return selecteddays.any((element) => datematch(element.date!, day));
  }

  onenter() {
    addeddays.addAll(selecteddays.map((e) => e.date!).toList());
    notifyListeners();
  }

  final startdate = DateTime.now().subtract(Duration(days: 365));
  final enddate = DateTime.now().add(Duration(days: 365));
  int initialPage = 0;
  ondaypressed(DateTime date) async {
    days.forEach((e) async {
      if (datematch(e.date!, date)) {
        e.iscycle = !e.iscycle;
        if (e.iscycle) {
          selecteddays.add(e);
          await addcycle(date, "Had Flow", "qwertyu", "qwe", "1");
        } else {
          remove(e.date!);
        }
      }
    });
    print(selecteddays);
    notifyListeners();
  }

  remove(DateTime date) async {
    for (int i = 0; i < selecteddays.length; i++) {
      if (selecteddays[i].date!.compareTo(date) == 0) {
        selecteddays.removeAt(i);
        await addcycle(date, "Had Flow", "qwertyu", "qwe", "0");
        return;
      }
    }
    notifyListeners();
  }

  addDate(date) {
    CycleModel model = CycleModel();
    model.date = date;
    selecteddays.add(model);
  }

  CarouselController carouselController = CarouselController();
  getDaysInBetween() {
    initialPage = DateTime.now().difference(startdate).inDays;
    for (int i = 0; i <= enddate.difference(startdate).inDays; i++) {
      CycleModel mod = CycleModel();
      mod.date = startdate.add(Duration(days: i));
      days.add(mod);
    }
    print(days.length);
    print(days[200]);
    notifyListeners();
  }

  onPageChanged(
      int index, CarouselPageChangedReason carouselPageChangedReason) {
    initialPage = index;
    notifyListeners();
  }

  onselect(int index) async {
    days[index].iscycle = !days[index].iscycle;
    if (days[index].iscycle) {
      selecteddays.add(days[index]);
      selectedTableDays.add(days[index].date!);
      await addcycle(days[index].date!, "Had Flow", "qwertyu", "qwe", "1");
    } else {
      remove(days[index].date!);
      await addcycle(days[index].date!, "Had Flow", "qwertyu", "qwe", "0");
      selectedTableDays.remove(days[index].date);
    }
    notifyListeners();
  }
}
