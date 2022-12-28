import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pet_app/Api/Prefrence.dart';
import 'package:pet_app/Api/Services.dart';
import 'package:pet_app/Screens/HOME/Home.dart';
import 'package:pet_app/SevicesListAll_Screens/Deworming.dart';
import '../Api/Models/getDewormingModel.dart';
import '../Colors/COLORS.dart';
import '../Componants/Images&Icons.dart';
import '../UTILS/Utils.dart';

class Add_Deworming extends StatefulWidget {
  bool isedit;
  Data? editDewormingModel;
  Add_Deworming({super.key, required this.isedit, this.editDewormingModel});

  @override
  State<Add_Deworming> createState() => _Add_DewormingState();
}

class _Add_DewormingState extends State<Add_Deworming> {
  String day = 'Daily';
  String day1 = 'Daily';
  String selectStatus = 'false';
  final SelectStstusitems = [
    'false',
    'true',
  ];
  var selectAtdate;
  String? selectDate;
  String? selectedTime;
  @override
  void initState() {
    super.initState();
    if (widget.isedit) {
      selectStatus = widget.editDewormingModel!.dewormingStatus.toString();
      day = widget.editDewormingModel!.dewormingDuration.toString();
      selectDate = widget.editDewormingModel!.dewormingDate.toString();
      day1 = widget.editDewormingModel!.reminder.toString();
      selectAtdate = widget.editDewormingModel!.atDate.toString();
      selectedTime = widget.editDewormingModel!.atTime.toString();
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
        appBar: DefaultAppBar(DEWORMING),
        body: Padding(
          padding: EdgeInsets.only(
              left: w * 0.030,
              right: w * 0.030,
              top: h * 0.020,
              bottom: h * 0.050),
          child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              styleText(DEWORMING_STATUS, BLACK_CLR, FontWeight.normal, 15),
              Container(
                height: h * 0.06,
                margin: EdgeInsets.only(top: h * 0.010),
                decoration: BoxDecoration(
                    color: WHITE_CLR,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: BORDER_CLR, width: 1)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, right: 5, top: 3),
                  child: DropdownButton<String>(
                    isExpanded: true,
                    borderRadius: BorderRadius.circular(10),
                    underline: SizedBox(),
                    value: selectStatus,
                    onChanged: (String? newValue) => setState(
                      () => selectStatus = newValue!,
                    ),
                    items: SelectStstusitems.map<DropdownMenuItem<String>>(
                        (String value) => DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value.toString(),
                                style: TextStyle(color: GRAY_CLR, fontSize: 14),
                              ),
                            )).toList(),
                    icon: Icon(
                      Icons.keyboard_arrow_down_sharp,
                      color: GRAY_CLR.withOpacity(0.5),
                      size: 25,
                    ),
                    iconSize: 30,
                  ),
                ),
              ),
              SizedBox(
                height: h * 0.020,
              ),
              styleText(DEWORMING_DURATION, BLACK_CLR, FontWeight.normal, 15),
              SizedBox(
                height: h * 0.020,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  customradioButton("Daily", day, (value) {
                    setState(() {
                      day = value.toString();
                    });
                  }),
                  SizedBox(
                    width: w * 0.010,
                  ),
                  Text(
                    DAILY,
                    style: TextStyle(color: GRAY_CLR),
                  ),
                  SizedBox(
                    width: w * 0.1,
                  ),
                  customradioButton("Weekly", day, (value) {
                    setState(() {
                      day = value.toString();
                    });
                  }),
                  SizedBox(
                    width: w * 0.010,
                  ),
                  Text(
                    WEEKLY,
                    style: TextStyle(color: GRAY_CLR),
                  ),
                  SizedBox(
                    width: w * 0.1,
                  ),
                  customradioButton("Monthly", day, (value) {
                    setState(() {
                      day = value.toString();
                    });
                  }),
                  SizedBox(
                    width: w * 0.010,
                  ),
                  Text(
                    MONTHLY,
                    style: TextStyle(color: GRAY_CLR),
                  ),
                ],
              ),
              SizedBox(
                height: h * 0.020,
              ),
              styleText(DEWORMING_DATE, BLACK_CLR, FontWeight.normal, 15),
              Container(
                height: h * 0.06,
                padding: EdgeInsets.only(left: w * 0.030, right: w * 0.030),
                margin: EdgeInsets.only(top: h * 0.010),
                decoration: BoxDecoration(
                    color: WHITE_CLR,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: BORDER_CLR, width: 1)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      selectDate == null ? "DD-MM-YYYY" : "${selectDate}",
                      style: TextStyle(color: GRAY_CLR, fontSize: 14),
                    ),
                    GestureDetector(
                        onTap: () {
                          cutomDatePicker(context).then((value) {
                            setState(() {
                              selectDate =
                                  DateFormat("dd-MM-yyyy").format(value!);
                            });
                          });
                        },
                        child: Icon(
                          Icons.calendar_month_sharp,
                          color: GRAY_CLR.withOpacity(0.5),
                          size: 20,
                        ))
                  ],
                ),
              ),
              SizedBox(
                height: h * 0.025,
              ),
              styleText(REMINDER, BLACK_CLR, FontWeight.normal, 17),
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
                  customradioButton("Daily", day1, (value) {
                    setState(() {
                      day1 = value.toString();
                    });
                  }),
                  SizedBox(
                    width: w * 0.010,
                  ),
                  Text(
                    DAILY,
                    style: TextStyle(color: GRAY_CLR),
                  ),
                  SizedBox(
                    width: w * 0.1,
                  ),
                  customradioButton("Weekly", day1, (value) {
                    setState(() {
                      day1 = value.toString();
                    });
                  }),
                  SizedBox(
                    width: w * 0.010,
                  ),
                  Text(
                    WEEKLY,
                    style: TextStyle(color: GRAY_CLR),
                  ),
                  SizedBox(
                    width: w * 0.1,
                  ),
                  customradioButton("Monthly", day1, (value) {
                    setState(() {
                      day1 = value.toString();
                    });
                  }),
                  SizedBox(
                    width: w * 0.010,
                  ),
                  Text(
                    MONTHLY,
                    style: TextStyle(color: GRAY_CLR),
                  ),
                ],
              ),
              SizedBox(
                height: h * 0.030,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    styleText(AT_DATE, BLACK_CLR, FontWeight.normal, 15),
                    GestureDetector(
                      onTap: () {
                        cutomDatePicker(context).then((value) {
                          setState(() {
                            selectAtdate =
                                DateFormat("dd-MM-yyyy").format(value!);
                          });
                        });
                      },
                      child: Container(
                        height: h * 0.06,
                        width: w * 0.45,
                        padding:
                            EdgeInsets.only(left: w * 0.030, right: w * 0.030),
                        margin: EdgeInsets.only(top: h * 0.010),
                        decoration: BoxDecoration(
                            color: WHITE_CLR,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: BORDER_CLR, width: 1)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              selectAtdate == null
                                  ? "DD-MM-YYYY"
                                  : selectAtdate,
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
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    styleText(AT_TIME, BLACK_CLR, FontWeight.normal, 15),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          showTime(context).then((value) {
                            setState(() {
                              selectedTime = value.format(context);
                            });
                          });
                        });
                      },
                      child: Container(
                        width: w * 0.45,
                        height: h * 0.06,
                        padding:
                            EdgeInsets.only(left: w * 0.030, right: w * 0.030),
                        margin: EdgeInsets.only(top: h * 0.010),
                        decoration: BoxDecoration(
                            color: WHITE_CLR,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: BORDER_CLR, width: 1)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              selectedTime != null
                                  ? selectedTime!
                                  : 'Select Time ',
                              style: TextStyle(color: GRAY_CLR, fontSize: 14),
                            ),
                            Icon(
                              Icons.access_time_rounded,
                              color: GRAY_CLR.withOpacity(0.5),
                              size: 20,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ]),
              SizedBox(
                height: h * 0.050,
              ),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: isAddDeworming || iseditDeworming
                      ? loader
                      : DefaultButton(
                          text: DONE,
                          ontap: () async {
                            if (widget.isedit) {
                              setState(() {
                                iseditDeworming = true;
                              });
                              await editDewormingApi(
                                selectStatus,
                                day,
                                selectDate.toString(),
                                day1,
                                selectAtdate,
                                selectedTime.toString(),
                              ).then((value) {
                                getDewormingListApi(
                                    Preference.Pref.getInt('selectedPetId')
                                        .toString());
                                customSnackbar(
                                    context, editDewormingmsg.toString());
                                Navigate_replace(context, Deworming());
                                setState(() {
                                  iseditDeworming = false;
                                });
                              }).catchError((e) {
                                customSnackbar(context, e.toString());
                                setState(() {
                                  iseditDeworming = false;
                                });
                              });
                              setState(() {
                                iseditDeworming = false;
                              });
                            } else {
                              if (devormingValidation()) {
                                setState(() {
                                  isAddDeworming = true;
                                });
                                await addDewormingApi(
                                        selectStatus,
                                        day,
                                        selectDate.toString(),
                                        day1,
                                        selectAtdate,
                                        selectedTime.toString())
                                    .then((value) {
                                  Preference.Pref.setInt(
                                      'dewormingId', value['data']['id']);
                                  print(value['data']['id']);
                                  customSnackbar(
                                      context, addDewormingmsg.toString());
                                  Navigate_replace(context, Home());

                                  setState(() {
                                    isAddDeworming = false;
                                  });
                                }).catchError((e) {
                                  customSnackbar(context, e.toString());
                                  print(e);
                                  setState(() {
                                    isAddDeworming = false;
                                  });
                                });
                                setState(() {
                                  isAddDeworming = false;
                                });
                              }
                            }
                          },
                          fontsize: 15,
                          height: h * 0.060,
                          width: w * 0.8))
            ]),
          ),
        ));
  }

  devormingValidation() {
    if (selectDate == null) {
      customSnackbar(context, "Please select deworming date");
      return false;
    } else if (selectAtdate == null) {
      customSnackbar(context, "Please select date");
      return false;
    } else if (selectedTime == null) {
      customSnackbar(context, "Please select time");
      return false;
    }
    return true;
  }
}
