import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pet_app/Colors/COLORS.dart';
import 'package:pet_app/Componants/Images&Icons.dart';
import 'package:pet_app/Screens/Add_Pets/AddPet3.dart';
import 'package:pet_app/Testing1/linearCalender.dart';
import 'package:provider/provider.dart';

import '../../Api/Services.dart';
import '../../UTILS/Utils.dart';

class Symptoms extends StatefulWidget {
  int index;
  Symptoms({super.key, required this.index});

  @override
  State<Symptoms> createState() => _SymptomsState();
}

class _SymptomsState extends State<Symptoms> {
  int counter = 0;
  int currentIndex = 1;

  List<Widget> symptomslst = [
    Periods(),
    Symptomslst(),
    Spottings(),

    // symptomslst(
    //   title: "Period",
    //   options: ["Had Flow", "No Flow"],
    // ),
    // symptomslst(
    //   title: "Symptoms",
    //   options: [""],
    // ),
    // symptomslst(
    //   title: "Spotting",
    // ),
  ];

  var h;
  var w;

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: WHITE70_CLR,
        body: Consumer<CalenderProvider>(
          builder: (context, value, child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: h * 0.080,
                ),
                styleText(showdate(value.days[value.initialPage].date!),
                    BLACK_CLR, FontWeight.bold, 19),
                SizedBox(
                  height: h * 0.010,
                ),
                Container(
                    alignment: Alignment.topCenter,
                    // color: Colors.red,
                    margin: EdgeInsets.only(top: 15),
                    // height: h * 0.45,
                    width: w * 1,
                    child: CarouselSlider(
                      items: symptomslst,
                      options: CarouselOptions(
                          height: h * 0.45,
                          aspectRatio: 1 / 4,
                          viewportFraction: 0.75,
                          initialPage: widget.index,
                          scrollDirection: Axis.horizontal,
                          enableInfiniteScroll: false,
                          // reverse: true,
                          enlargeCenterPage: true,
                          onPageChanged: (index, reason) {
                            setState(() {
                              currentIndex = index + 1;
                            });
                          }),
                    )),
                SizedBox(
                  height: h * 0.030,
                ),
                styleText("$currentIndex of ${symptomslst.length}", DARK_CLR,
                    FontWeight.normal, 14),
                SizedBox(
                  height: h * 0.020,
                ),
                DefaultButton(
                    text: DONE,
                    ontap: () async {
                      value.onDaySelected(value.days[value.initialPage].date!,
                          value.days[value.initialPage].date!);
                      if (!value.days[value.initialPage].iscycle) {
                        value.days[value.initialPage].iscycle = true;
                        value.selecteddays.add(value.days[value.initialPage]);
                        value.days[value.initialPage].period = Periods.period;
                        value.days[value.initialPage].spotting =
                            Spottings.spotting;
                        value.days[value.initialPage].symptoms =
                            Symptomslst.symptoms.first;
                      }
                      await addcycle(
                        [
                          DateFormat("yyyy-MM-dd")
                              .format(value.days[value.initialPage].date!),
                        ],
                        Periods.period,
                        Symptomslst.symptoms.join(","),
                        Spottings.spotting,
                        "2",
                        true,
                      );
                      getcycletracking(context);

                      Navigator.of(context).pop();
                    },
                    fontsize: 15,
                    height: h * 0.055,
                    width: w * 0.8),
                SizedBox(
                  height: h * 0.020,
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child:
                        styleText("Cancel", GREEN_CLR, FontWeight.normal, 15)),
              ],
            );
          },
        ));
  }
}

int _radioSelected = 1;
String? _radioVal;

class Symptomslst extends StatefulWidget {
  static List symptoms = [];
  Symptomslst({
    super.key,
  });

  @override
  State<Symptomslst> createState() => _SymptomslstState();
}

class _SymptomslstState extends State<Symptomslst> {
  var h;

  var w;
  List list = [
    {
      "title": "Excessive Licking",
      "status": false,
    },
    {
      "title": "Frequent Urination",
      "status": false,
    },
    {
      "title": "Hyperactive",
      "status": false,
    },
    {
      "title": "Anxious",
      "status": false,
    },
    {
      "title": "Aggressive",
      "status": false,
    },
    {
      "title": "Lazy",
      "status": false,
    },
    {
      "title": "Appetite Change",
      "status": false,
    },
    {
      "title": "Swelling of The Vulva",
      "status": false,
    },
    {
      "title": "Tail Tucking",
      "status": false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return SizedBox(
      // height: h*0.8,
      width: w * 0.75,
      child: Card(
        color: WHITE70_CLR,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            Container(
                alignment: Alignment.centerLeft,
                width: w * 1,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  color: GREEN_CLR,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: styleText("Symptoms", WHITE_CLR, FontWeight.bold, 15),
                )),
            Container(
                alignment: Alignment.centerLeft,
                width: w * 1,
                height: 40,
                color: WHITE_CLR,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: styleText("Select all that apply.", BLACK_CLR,
                      FontWeight.normal, 14),
                )),
            Expanded(
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: list.length,
                separatorBuilder: (context, index) {
                  return Divider(
                    height: 1,
                  );
                },
                padding: EdgeInsets.all(0),
                itemBuilder: (context, index) => ListTile(
                  onTap: () {
                    setState(() {
                      list[index]["status"] = !list[index]["status"];
                      Symptomslst.symptoms.clear();
                      list.forEach((element) {
                        if (element["status"]) {
                          Symptomslst.symptoms.add(element["title"]);
                        }
                      });
                      print(Symptomslst.symptoms);
                    });
                  },
                  tileColor: Color(0xffF9F9F9),
                  dense: true,
                  isThreeLine: false,
                  leading: styleText(
                      list[index]["title"], DARK_CLR, FontWeight.normal, 14),
                  trailing: Radio<bool>(
                    value: true,
                    // groupValue: "",
                    groupValue: list[index]["status"],
                    // Symptomslst.symptoms.isEmpty
                    //     ? ""
                    //     : Symptomslst.symptoms
                    //         .singleWhere((element) => element == list[index]),
                    activeColor: GREEN_CLR,
                    onChanged: (value) {
                      setState(() {
                        list[index]["status"] = !list[index]["status"];
                        Symptomslst.symptoms.clear();
                        list.forEach((element) {
                          if (element["status"]) {
                            Symptomslst.symptoms.add(element["title"]);
                          }
                        });
                        print(Symptomslst.symptoms);
                      });
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Periods extends StatefulWidget {
  static String period = "";
  const Periods({super.key});

  @override
  State<Periods> createState() => _PeriodsState();
}

class _PeriodsState extends State<Periods> {
  var h;

  var w;
  List<String> list = [
    "Had Flow",
    "No Flow",
  ];
  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return SizedBox(
      // height: h*0.8,
      width: w * 0.75,
      child: Card(
        color: WHITE70_CLR,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            Container(
                alignment: Alignment.centerLeft,
                width: w * 1,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  color: GREEN_CLR,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: styleText("Period", WHITE_CLR, FontWeight.bold, 15),
                )),
            ListView.separated(
              shrinkWrap: true,
              itemCount: list.length,
              separatorBuilder: (context, index) {
                return Divider(
                  height: 1,
                );
              },
              padding: EdgeInsets.all(0),
              itemBuilder: (context, index) => ListTile(
                onTap: () {
                  setState(() {
                    Periods.period = list[index];
                    print(Periods.period);
                  });
                },
                tileColor: Color(0xffF9F9F9),
                dense: true,
                isThreeLine: false,
                leading:
                    styleText(list[index], DARK_CLR, FontWeight.normal, 14),
                trailing: Radio<String>(
                  value: list[index],
                  groupValue: Periods.period,
                  activeColor: GREEN_CLR,
                  onChanged: (value) {
                    setState(() {
                      Periods.period = value!;
                    });
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Spottings extends StatefulWidget {
  static String spotting = "";
  const Spottings({super.key});

  @override
  State<Spottings> createState() => _SpottingsState();
}

class _SpottingsState extends State<Spottings> {
  var h;

  var w;
  List<String> list = [
    "Heavy",
    "Regular",
    "Light",
  ];
  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return SizedBox(
      // height: h*0.8,
      width: w * 0.75,
      child: Card(
        color: WHITE70_CLR,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            Container(
                alignment: Alignment.centerLeft,
                width: w * 1,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  color: GREEN_CLR,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: styleText("Spotting", WHITE_CLR, FontWeight.bold, 15),
                )),
            ListView.separated(
              shrinkWrap: true,
              itemCount: list.length,
              separatorBuilder: (context, index) {
                return Divider(
                  height: 1,
                );
              },
              padding: EdgeInsets.all(0),
              itemBuilder: (context, index) => ListTile(
                onTap: () {
                  setState(() {
                    Spottings.spotting = list[index];
                    print(Spottings.spotting);
                  });
                },
                tileColor: Color(0xffF9F9F9),
                dense: true,
                isThreeLine: false,
                leading:
                    styleText(list[index], DARK_CLR, FontWeight.normal, 14),
                trailing: Radio<String>(
                  value: list[index],
                  groupValue: Spottings.spotting,
                  activeColor: GREEN_CLR,
                  onChanged: (value) {
                    setState(() {
                      Spottings.spotting = value!;
                    });
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
