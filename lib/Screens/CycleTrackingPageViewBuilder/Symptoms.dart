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
  const Symptoms({super.key});

  @override
  State<Symptoms> createState() => _SymptomsState();
}

class _SymptomsState extends State<Symptoms> {
  int counter = 0;
  int currentIndex = 0;

  List<Widget> Symptomslst = [
    symptomslst(),
    symptomslst(),
    symptomslst(),
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
                    height: h * 0.45,
                    width: w * 1,
                    child: CarouselSlider(
                      items: [Symptomslst[index]],
                      options: CarouselOptions(
                          height: h * 0.45,
                          aspectRatio: 1 / 4,
                          viewportFraction: 0.75,
                          initialPage: 2,
                          scrollDirection: Axis.horizontal,
                          enableInfiniteScroll: true,
                          reverse: true,
                          enlargeCenterPage: true,
                          onPageChanged: (index, reason) {
                            setState(() {
                              currentIndex = index;

                              if (counter <= 2) {
                                counter++;
                              }
                            });
                          }),
                    )),
                SizedBox(
                  height: h * 0.030,
                ),
                styleText("$counter of 3", DARK_CLR, FontWeight.normal, 14),
                SizedBox(
                  height: h * 0.020,
                ),
                DefaultButton(
                    text: DONE,
                    ontap: () async {
                      value.onDaySelected(value.days[value.initialPage].date!,
                          value.days[value.initialPage].date!);
                      await addcycle(value.days[value.initialPage].date!,
                          "Had Flow", "qwertyu", "qwe", "1");

                      Navigator.of(context).pop();
                    },
                    fontsize: 15,
                    height: h * 0.055,
                    width: w * 0.8),
                SizedBox(
                  height: h * 0.020,
                ),
                styleText("Cancel", GREEN_CLR, FontWeight.normal, 15),
              ],
            );
          },
        ));
  }
}

int _radioSelected = 1;
String? _radioVal;

class symptomslst extends StatefulWidget {
  symptomslst({super.key});

  @override
  State<symptomslst> createState() => _symptomslstState();
}

class _symptomslstState extends State<symptomslst> {
  var h;

  var w;

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
            // Divider(
            //   thickness: 1,
            //   color: GRAY_CLR.withOpacity(0.3),
            // ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    styleText(
                        "Abdominal Cramps", DARK_CLR, FontWeight.normal, 14),
                    SizedBox(
                        height: 20,
                        width: 20,
                        child: Radio(
                          value: 1,
                          groupValue: _radioSelected,
                          activeColor: GREEN_CLR,
                          onChanged: (value) {
                            setState(() {
                              _radioSelected = value!;
                              _radioVal = 'one';
                            });
                          },
                        ))
                  ]),
            ),
            SizedBox(
              height: h * 0.010,
            ),
            Divider(
              thickness: 1,
              color: GRAY_CLR.withOpacity(0.3),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    styleText(
                        "Abdominal Cramps", DARK_CLR, FontWeight.normal, 14),
                    SizedBox(
                        height: 20,
                        width: 20,
                        child: Radio(
                          value: 2,
                          groupValue: _radioSelected,
                          activeColor: GREEN_CLR,
                          onChanged: (value) {
                            setState(() {
                              _radioSelected = value!;
                              _radioVal = 'two';
                            });
                          },
                        ))
                  ]),
            ),
            SizedBox(
              height: h * 0.010,
            ),
            Divider(
              thickness: 1,
              color: GRAY_CLR.withOpacity(0.3),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    styleText(
                        "Abdominal Cramps", DARK_CLR, FontWeight.normal, 14),
                    SizedBox(
                        height: 20,
                        width: 20,
                        child: Radio(
                          value: 3,
                          groupValue: _radioSelected,
                          activeColor: GREEN_CLR,
                          onChanged: (value) {
                            setState(() {
                              _radioSelected = value!;
                              _radioVal = 'three';
                            });
                          },
                        ))
                  ]),
            ),
            SizedBox(
              height: h * 0.010,
            ),
            Divider(
              thickness: 1,
              color: GRAY_CLR.withOpacity(0.3),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    styleText(
                        "Abdominal Cramps", DARK_CLR, FontWeight.normal, 14),
                    SizedBox(
                        height: 20,
                        width: 20,
                        child: Radio(
                          value: 4,
                          groupValue: _radioSelected,
                          activeColor: GREEN_CLR,
                          onChanged: (value) {
                            setState(() {
                              _radioSelected = value!;
                              _radioVal = 'four';
                            });
                          },
                        ))
                  ]),
            ),
            SizedBox(
              height: h * 0.010,
            ),
            Divider(
              thickness: 1,
              color: GRAY_CLR.withOpacity(0.3),
            ),
          ],
        ),
      ),
    );
  }
}
