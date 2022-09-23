import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pet_app/Colors/COLORS.dart';
import 'package:pet_app/Componants/Images&Icons.dart';
import 'package:pet_app/Screens/HOME/ServicesList.dart';
import 'package:pet_app/SevicesListAll_Screens/Add_Medicine.dart';
import 'package:pet_app/UTILS/Utils.dart';

class Medicines extends StatefulWidget {
  const Medicines({super.key});

  @override
  State<Medicines> createState() => _MedicinesState();
}

class _MedicinesState extends State<Medicines> {
  var h;
  var w;
  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: WHITE70_CLR,
      appBar: DefaultAppBar(MEDICINES),
      floatingActionButton: FloatingActionButton(
        backgroundColor: WHITE70_CLR,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(50)),
            side: BorderSide(color: GREEN_CLR)),
        onPressed: () {
          setState(() {
            Navigate_to(context, Add_Medicine());
          });
        },
        child: Icon(
          Icons.add,
          size: 40,
          color: GREEN_CLR,
        ),
        heroTag: "b1",
      ),
      body: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: 5,
          padding: EdgeInsets.symmetric(vertical: 20),
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: EdgeInsets.only(
                  left: w * 0.030, right: w * 0.030, bottom: h * 0.020),
              child: Container(
                // height: h*0.45,
                width: w * 1,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: DROP_CLR.withOpacity(0.1), blurRadius: 16)
                    ]),
                child: Padding(
                  padding: EdgeInsets.only(
                      left: w * 0.030,
                      right: w * 0.030,
                      top: h * 0.015,
                      bottom: h * 0.010),
                  child: Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        styleText(
                            MEDICINES_NAME, BLACK_CLR, FontWeight.bold, 16),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 28,
                              child: GestureDetector(
                                child: CircleAvatar(
                                  backgroundColor: FADE_BLUE_CLR,
                                  child: Icon(
                                    Icons.edit,
                                    size: 15,
                                    color: WHITE70_CLR,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: w * 0.01,
                            ),
                            SizedBox(
                              height: 28,
                              width: 28,
                              child: GestureDetector(
                                child: CircleAvatar(
                                  backgroundColor: FADE_BLUE_CLR,
                                  child: Icon(
                                    Icons.delete,
                                    color: WHITE70_CLR,
                                    size: 15,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: h * 0.010,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: w * 0.45,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              styleText(COURSE_START_DATE, GRAY_CLR,
                                  FontWeight.normal, 13),
                              styleText("20-12-2022", BLACK_CLR,
                                  FontWeight.normal, 15),
                              SizedBox(
                                height: h * 0.015,
                              ),
                              styleText(HEALTH_OF_PREVIOUS, GRAY_CLR,
                                  FontWeight.normal, 13),
                              styleText(
                                  "Good", BLACK_CLR, FontWeight.normal, 15),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: w * 0.4,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              styleText(COURSE_END_DTAE, GRAY_CLR,
                                  FontWeight.normal, 13),
                              styleText("20-12-2022", BLACK_CLR,
                                  FontWeight.normal, 15),
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: h * 0.010,
                    ),
                    Divider(
                      thickness: 1,
                      color: GRAY_CLR.withOpacity(0.1),
                    ),
                    Row(
                      children: [
                        styleText(REMINDER, DARK_CLR, FontWeight.bold, 14),
                        SizedBox(
                          width: w * 0.010,
                        ),
                        MaterialButton(
                            height: 20,
                            minWidth: w * 0.16,
                            color: GREEN_CLR,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                            onPressed: () {},
                            child: styleText(
                                DAILY, WHITE_CLR, FontWeight.normal, 11))
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: w * 0.4,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              styleText(REMINDER_DATE, GRAY_CLR,
                                  FontWeight.normal, 13),
                              styleText(
                                  "21st", BLACK_CLR, FontWeight.normal, 15),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: w * 0.4,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              styleText(REMINDER_TIME, GRAY_CLR,
                                  FontWeight.normal, 13),
                              styleText(
                                  "08:00 AM", BLACK_CLR, FontWeight.normal, 15),
                            ],
                          ),
                        )
                      ],
                    ),
                  ]),
                ),
              ),
            );
          }),
    );
  }
}
