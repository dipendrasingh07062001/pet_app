import 'package:flutter/material.dart';
import 'package:pet_app/Api/Models/My_pet_model.dart';
import 'package:pet_app/Api/Services.dart';
import 'package:pet_app/Colors/COLORS.dart';
import 'package:pet_app/Componants/Images&Icons.dart';
import 'package:pet_app/Screens/Add_Pets/AddPet3.dart';
import 'package:pet_app/SevicesListAll_Screens/Add_Deworming.dart';
import 'package:pet_app/UTILS/Utils.dart';

import '../Api/Models/getDewormingModel.dart';
import '../Api/Prefrence.dart';

class Deworming extends StatefulWidget {
  const Deworming({super.key});

  @override
  State<Deworming> createState() => _DewormingState();
}

class _DewormingState extends State<Deworming> {
  GetDewomingModel result = GetDewomingModel();
  MyPetModel result1 = MyPetModel();

  final petid = Preference.Pref.getInt('id');

  @override
  void initState() {
    super.initState();
    getDewormingListApi(petid).then((value) {
      setState(() {
        result = value;
        print(result.toString());
      });
    });
  }

  var h;
  var w;
  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: WHITE70_CLR,
      appBar: DefaultAppBar(DEWORMING),
      body: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: 2,
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
                        styleText(DEWORMING, BLACK_CLR, FontWeight.bold, 16),
                        SizedBox(
                          height: 28,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                Navigate_to(context, Add_Deworming());
                              });
                            },
                            child: const CircleAvatar(
                              backgroundColor: FADE_BLUE_CLR,
                              child: Icon(
                                Icons.edit,
                                color: WHITE70_CLR,
                                size: 15,
                              ),
                            ),
                          ),
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
                          width: w * 0.4,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              styleText(DEWORMING_STATUS, GRAY_CLR,
                                  FontWeight.normal, 13),
                              styleText("Done", TEXT_GREEN_CLR,
                                  FontWeight.normal, 15),
                              SizedBox(
                                height: h * 0.015,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: w * 0.4,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              styleText(NEXT_DEWORMING, GRAY_CLR,
                                  FontWeight.normal, 13),
                              styleText("Date : 20-12-2022", BLACK_CLR,
                                  FontWeight.normal, 15),
                            ],
                          ),
                        )
                      ],
                    ),
                    Container(
                      height: h * 0.062,
                      width: w * 0.4,
                      margin: EdgeInsets.only(bottom: h * 0.010),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: WHITE_CLR,
                          boxShadow: [
                            BoxShadow(
                                color: DROP_CLR.withOpacity(0.1), blurRadius: 3)
                          ]),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          styleText(DEWORMING_DURATION, GRAY_CLR,
                              FontWeight.normal, 13),
                          styleText(
                              "Monthly", BLACK_CLR, FontWeight.normal, 15),
                        ],
                      ),
                    ),
                    Divider(
                      thickness: 2,
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
                            minWidth: 60,
                            color: GREEN_CLR,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                            onPressed: () {},
                            child: styleText(
                                MONTHLY, WHITE_CLR, FontWeight.normal, 11))
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
