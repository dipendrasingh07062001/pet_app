import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pet_app/Api/Prefrence.dart';
import 'package:pet_app/Api/Services.dart';
import 'package:pet_app/SevicesListAll_Screens/Pregnancy.dart';
import '../Api/Models/getPregnancyModel.dart';
import '../Colors/COLORS.dart';
import '../Componants/Images&Icons.dart';
import '../UTILS/Utils.dart';

class Add_Pregnancy extends StatefulWidget {
  bool ispregnancyEdit;
  GetPregnancyListData? editpregnancymodel;
  Add_Pregnancy(
      {super.key, required this.ispregnancyEdit, this.editpregnancymodel});

  @override
  State<Add_Pregnancy> createState() => _Add_PregnancyState();
}

class _Add_PregnancyState extends State<Add_Pregnancy> {
  TextEditingController previouslitter = TextEditingController();
  String PastPregnancy = '1';
  final SelectPregnancy = ['1', '2', '3', '4', '5'];

  String? date;
  String? time;

  String setualActive = 'Yes';
  String nuetered = 'Yes';
  String reminder = '6month';

  @override
  void initState() {
    super.initState();
    if (widget.ispregnancyEdit) {
      setualActive = widget.editpregnancymodel!.sexuallyActive.toString();
      PastPregnancy = widget.editpregnancymodel!.pastPregnancy.toString();
      previouslitter.text =
          widget.editpregnancymodel!.previousLitter.toString();
      nuetered = widget.editpregnancymodel!.neutered.toString();
      reminder = widget.editpregnancymodel!.reminder.toString();
      date = widget.editpregnancymodel!.atDate.toString();
      time = widget.editpregnancymodel!.atTime.toString();
    }
  }

  var h;
  var w;
  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: WHITE70_CLR,
      appBar: DefaultAppBar(PREGNANCY),
      body: Padding(
        padding: EdgeInsets.only(
            left: w * 0.030,
            right: w * 0.030,
            top: h * 0.015,
            bottom: h * 0.010),
        child: ListView(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            children: [
              styleText(SEXUALLY_ACTIVE, BLACK_CLR, FontWeight.normal, 15),
              SizedBox(
                height: h * 0.010,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  customradioButton('Yes', setualActive, (value) {
                    setState(() {
                      setualActive = value.toString();
                    });
                  }),
                  SizedBox(
                    width: w * 0.010,
                  ),
                  styleText(YES, GRAY_CLR, FontWeight.normal, 15),
                  SizedBox(
                    width: w * 0.1,
                  ),
                  customradioButton('No', setualActive, (value) {
                    setState(() {
                      setualActive = value.toString();
                    });
                  }),
                  SizedBox(
                    width: w * 0.010,
                  ),
                  styleText(NO, GRAY_CLR, FontWeight.normal, 15),
                ],
              ),
              SizedBox(
                height: h * 0.015,
              ),
              styleText(NO_OF_PREGNANCY, BLACK_CLR, FontWeight.normal, 15),
              Container(
                height: h * 0.06,
                margin: EdgeInsets.only(top: h * 0.010),
                decoration: BoxDecoration(
                    color: WHITE_CLR,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: BORDER_CLR, width: 1)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, right: 5),
                  child: DropdownButton<String>(
                    isExpanded: true,
                    borderRadius: BorderRadius.circular(10),
                    underline: SizedBox(),
                    value: PastPregnancy,
                    onChanged: (String? newValue) =>
                        setState(() => PastPregnancy = newValue!),
                    items: SelectPregnancy.map<DropdownMenuItem<String>>(
                        (String value) => DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: TextStyle(color: GRAY_CLR, fontSize: 14),
                              ),
                            )).toList(),
                    icon: Image.asset(
                      UPDOUN_ICON,
                      color: GRAY_CLR.withOpacity(0.5),
                      height: 25,
                    ),
                    iconSize: 30,
                  ),
                ),
              ),
              SizedBox(
                height: h * 0.020,
              ),
              styleText(HEALTH_OF_PREVIOUS, BLACK_CLR, FontWeight.normal, 15),
              Container(
                padding: EdgeInsets.only(left: 10),
                alignment: Alignment.center,
                height: h * 0.06,
                margin: EdgeInsets.only(top: h * 0.010),
                decoration: BoxDecoration(
                    color: WHITE_CLR,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: BORDER_CLR, width: 1)),
                child: TextFormField(
                    controller: previouslitter,
                    decoration: InputDecoration(
                        errorText: "",
                        errorStyle: TextStyle(height: 0),
                        hintText: "Good",
                        hintStyle: TextStyle(
                            color: GRAY_CLR,
                            fontSize: 14,
                            fontWeight: FontWeight.normal),
                        border: InputBorder.none)),
              ),
              SizedBox(
                height: h * 0.020,
              ),
              styleText(NEUTERED, BLACK_CLR, FontWeight.normal, 15),
              SizedBox(
                height: h * 0.015,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  customradioButton('Yes', nuetered, (value) {
                    setState(() {
                      nuetered = value.toString();
                    });
                  }),
                  SizedBox(
                    width: w * 0.010,
                  ),
                  styleText(YES, GRAY_CLR, FontWeight.normal, 15),
                  SizedBox(
                    width: w * 0.1,
                  ),
                  customradioButton('No', nuetered, (value) {
                    setState(() {
                      nuetered = value.toString();
                    });
                  }),
                  SizedBox(
                    width: w * 0.010,
                  ),
                  styleText(NO, GRAY_CLR, FontWeight.normal, 15),
                ],
              ),
              SizedBox(
                height: h * 0.030,
              ),
              styleText(REMINDER, DARK_CLR, FontWeight.bold, 15),
              SizedBox(
                height: h * 0.020,
              ),
              styleText(REMINDER_DURATION, BLACK_CLR, FontWeight.normal, 15),
              SizedBox(
                height: h * 0.020,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                      child: Row(children: [
                    customradioButton('6month', reminder, (value) {
                      setState(() {
                        reminder = value.toString();
                      });
                    }),
                    SizedBox(
                      width: w * 0.010,
                    ),
                    styleText(MONTH1, GRAY_CLR, FontWeight.normal, 15),
                  ])),
                  Expanded(
                      child: Row(children: [
                    customradioButton('9month', reminder, (value) {
                      setState(() {
                        reminder = value.toString();
                      });
                    }),
                    SizedBox(
                      width: w * 0.010,
                    ),
                    styleText(MONTH2, GRAY_CLR, FontWeight.normal, 15),
                  ])),
                  Expanded(
                      child: Row(children: [
                    customradioButton('12month', reminder, (value) {
                      setState(() {
                        reminder = value.toString();
                      });
                    }),
                    SizedBox(
                      width: w * 0.010,
                    ),
                    styleText(MONTH3, GRAY_CLR, FontWeight.normal, 15),
                  ])),
                ],
              ),
              SizedBox(
                height: h * 0.030,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      styleText(AT_DATE, BLACK_CLR, FontWeight.normal, 15),
                      GestureDetector(
                        onTap: () {
                          cutomDatePicker(context).then((value) {
                            setState(() {
                              date = DateFormat('dd-MM-yyyy').format(value!);
                            });
                          });
                        },
                        child: Container(
                          height: h * 0.06,
                          width: w * 0.45,
                          padding: EdgeInsets.only(
                              left: w * 0.030, right: w * 0.030),
                          margin: EdgeInsets.only(top: h * 0.010),
                          decoration: BoxDecoration(
                              color: WHITE_CLR,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: BORDER_CLR, width: 1)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                date == null ? "DD-MM-YYYY" : date.toString(),
                                style: TextStyle(color: GRAY_CLR, fontSize: 14),
                              ),
                              Icon(
                                Icons.calendar_month_sharp,
                                color: GRAY_CLR.withOpacity(0.5),
                                size: 20,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      styleText(AT_TIME, BLACK_CLR, FontWeight.normal, 15),
                      GestureDetector(
                        onTap: () {
                          showTime(context).then((value) {
                            setState(() {
                              time = value.format(context);
                            });
                          });
                        },
                        child: Container(
                          height: h * 0.06,
                          width: w * 0.45,
                          padding: EdgeInsets.only(
                              left: w * 0.030, right: w * 0.030),
                          margin: EdgeInsets.only(top: h * 0.010),
                          decoration: BoxDecoration(
                              color: WHITE_CLR,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: BORDER_CLR, width: 1)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                time == null ? "Select Time" : time.toString(),
                                style: TextStyle(color: GRAY_CLR, fontSize: 14),
                              ),
                              Icon(
                                Icons.access_time_rounded,
                                color: GRAY_CLR.withOpacity(0.5),
                                size: 20,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: h * 0.070,
              ),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: isaddpregnancy || iseditpregnancy
                      ? loader
                      : DefaultButton(
                          text: DONE,
                          ontap: () async {
                            if (widget.ispregnancyEdit == true) {
                              setState(() {
                                iseditpregnancy = true;
                              });
                              await editPregnancyApi(
                                      setualActive,
                                      PastPregnancy,
                                      previouslitter.text,
                                      nuetered,
                                      reminder,
                                      time.toString(),
                                      date.toString())
                                  .then((value) {
                                customSnackbar(
                                    context, value['message'].toString());
                                Navigate_replace(context, Pregnancy());
                                setState(() {
                                  iseditpregnancy = false;
                                });
                              }).catchError((e) {
                                print(e);
                                customSnackbar(context, e.toString());
                                setState(() {
                                  iseditpregnancy = false;
                                });
                              });
                              setState(() {
                                iseditpregnancy = false;
                              });
                            } else {
                              if (AddPregnacyValidation()) {
                                setState(() {
                                  isaddpregnancy = true;
                                });
                                await addPregnancyApi(
                                        setualActive,
                                        PastPregnancy,
                                        previouslitter.text,
                                        nuetered,
                                        reminder,
                                        time.toString(),
                                        date.toString())
                                    .then((value) {
                                  Preference.Pref.setInt(
                                      "pregnancyId", value['data']['id']);
                                  print("=========" +
                                      Preference.Pref.getInt("pregnancyId")
                                          .toString());
                                  customSnackbar(
                                      context, addPregnancysg.toString());
                                  // Navigator.of(context).pop();
                                  Navigate_replace(context, Pregnancy());
                                  print(value);
                                  setState(() {
                                    isaddpregnancy = false;
                                  });
                                }).catchError((e) {
                                  print(e);
                                  customSnackbar(context, e.toString());
                                  setState(() {
                                    isaddpregnancy = false;
                                  });
                                });
                                setState(() {
                                  isaddpregnancy = false;
                                });
                              }
                            }
                          },
                          fontsize: 15,
                          height: h * 0.060,
                          width: w * 0.8)),
            ]),
      ),
    );
  }

  AddPregnacyValidation() {
    if (previouslitter.text == "") {
      customSnackbar(context, "Please enter previous litter");
      return false;
    } else if (date == null) {
      customSnackbar(context, "Please select date");
      return false;
    } else if (time == null) {
      customSnackbar(context, "Please select time");
      return false;
    }
    return true;
  }
}
