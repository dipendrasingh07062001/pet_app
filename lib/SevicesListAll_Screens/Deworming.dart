import 'package:flutter/material.dart';
import 'package:pet_app/Api/Prefrence.dart';
import 'package:pet_app/Api/Services.dart';
import 'package:pet_app/Colors/COLORS.dart';
import 'package:pet_app/Componants/Images&Icons.dart';
import 'package:pet_app/SevicesListAll_Screens/Add_Deworming.dart';
import 'package:pet_app/UTILS/Utils.dart';
import '../Api/Models/getDewormingModel.dart';

class Deworming extends StatefulWidget {
  const Deworming({super.key});

  @override
  State<Deworming> createState() => _DewormingState();
}

class _DewormingState extends State<Deworming> {
  GetdewormingModelList result = GetdewormingModelList();

  final petId = Preference.Pref.getInt('selectedPetId').toString();
  @override
  void initState() {
    super.initState();
    getDewormingListApi(petId).then((value) {
      result = value;
      setState(() {});
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
        floatingActionButton: flotingButton(() {
          Navigate_replace(context, Add_Deworming(isedit: false));
        }),
        body: result.data == null
            ? const Center(
                child: CircularProgressIndicator(
                color: GREEN_CLR,
              ))
            : Column(
                children: [
                  Padding(
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
                                color: DROP_CLR.withOpacity(0.1),
                                blurRadius: 16)
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
                                  DEWORMING, BLACK_CLR, FontWeight.bold, 16),
                              SizedBox(
                                height: 28,
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      Navigate_replace(
                                          context,
                                          Add_Deworming(
                                            isedit: true,
                                            editDewormingModel: result.data,
                                          ));
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
                                    styleText(
                                        result.data!.dewormingStatus.toString(),
                                        TEXT_GREEN_CLR,
                                        FontWeight.normal,
                                        15),
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
                                    styleText(
                                        result.data!.dewormingDate.toString(),
                                        BLACK_CLR,
                                        FontWeight.normal,
                                        15),
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
                                      color: DROP_CLR.withOpacity(0.1),
                                      blurRadius: 3)
                                ]),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                styleText(DEWORMING_DURATION, GRAY_CLR,
                                    FontWeight.normal, 13),
                                styleText(
                                    result.data!.dewormingDuration.toString(),
                                    BLACK_CLR,
                                    FontWeight.normal,
                                    15),
                              ],
                            ),
                          ),
                          Divider(
                            thickness: 2,
                            color: GRAY_CLR.withOpacity(0.1),
                          ),
                          Row(
                            children: [
                              styleText(
                                  REMINDER, DARK_CLR, FontWeight.bold, 14),
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
                                      result.data!.reminder.toString(),
                                      WHITE_CLR,
                                      FontWeight.normal,
                                      11))
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
                                    styleText(result.data!.atDate.toString(),
                                        BLACK_CLR, FontWeight.normal, 15),
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
                                    styleText(result.data!.atTime.toString(),
                                        BLACK_CLR, FontWeight.normal, 15),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ]),
                      ),
                    ),
                  ),
                ],
              ));
  }
}
