import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pet_app/Api/Models/getMedicineModel.dart';
import 'package:pet_app/Api/Models/getMedicineNameModel.dart';
import 'package:pet_app/Api/Services.dart';
import 'package:pet_app/Componants/Images&Icons.dart';
import 'package:pet_app/SevicesListAll_Screens/Medicines.dart';

import '../Colors/COLORS.dart';
import '../UTILS/Utils.dart';

class Add_Medicine extends StatefulWidget {
  bool isedit;
  GetMidecineModelList? editmedicine;
  Add_Medicine({super.key, required this.isedit, this.editmedicine});

  @override
  State<Add_Medicine> createState() => _Add_MedicineState();
}

class _Add_MedicineState extends State<Add_Medicine> {
  TextEditingController medicineCantroller = TextEditingController();
  String Duration = '1';
  final SelectDuration = ['1', '2', '3', '4', '5'];

  String day = '1';
  final SelectDay = ['1', '2', '3', '4', '5'];

  String? startdate;
  String? enddate;
  String? attime;
  DateTime? start;
  DateTime? end;
  String reminder = 'Daily';
  String? selectedmedicine;

  GetMedicineNameModel medicinename = GetMedicineNameModel();

  @override
  void initState() {
    super.initState();
    medicinename.name = "Medicine Name";
    medicinenamelist.clear();
    medicinenamelist.add(medicinename);
    getMedicineNameApi().whenComplete(() {
      setState(() {});
    });
    print("=====" + medicinename.name.toString());

    if (widget.isedit) {
      medicinename.name = widget.editmedicine!.name.toString();
      Duration = widget.editmedicine!.duration.toString();
      day = widget.editmedicine!.does.toString();
      startdate = widget.editmedicine!.startDate.toString();
      enddate = widget.editmedicine!.endDate.toString();
      reminder = widget.editmedicine!.reminder.toString();
      attime = widget.editmedicine!.atTime.toString();
    }
    print("=====" + medicinename.name.toString());
    setState(() {});
  }

  var h;
  var w;
  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: WHITE70_CLR,
      appBar: DefaultAppBar(MEDICINES),
      body: Padding(
        padding: EdgeInsets.only(
            left: w * 0.030,
            right: w * 0.030,
            top: h * 0.015,
            bottom: h * 0.020),
        child: ListView(
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            children: [
              styleText(MEDICINES_NAME, BLACK_CLR, FontWeight.normal, 15),
              Container(
                alignment: Alignment.centerLeft,
                height: h * 0.06,
                margin: EdgeInsets.only(top: h * 0.020),
                decoration: BoxDecoration(
                    color: WHITE_CLR,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: BORDER_CLR, width: 1)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: DropdownButton<GetMedicineNameModel?>(
                    isExpanded: true,
                    borderRadius: BorderRadius.circular(10),
                    underline: const SizedBox(),
                    value: medicinename,
                    onChanged: (newValue) {
                      medicinename = newValue!;
                      setState(() {
                        selectedmedicine = medicinename.name.toString();
                      });
                    },
                    items: medicinenamelist
                        .map<DropdownMenuItem<GetMedicineNameModel>>(
                            (GetMedicineNameModel value) =>
                                DropdownMenuItem<GetMedicineNameModel>(
                                  value: value,
                                  child: Text(
                                    value.name.toString(),
                                    style: const TextStyle(
                                        color: GRAY_CLR, fontSize: 14),
                                  ),
                                ))
                        .toList(),

                    // add extra sugar..
                    icon: Icon(
                      Icons.keyboard_arrow_down_sharp,
                      color: GRAY_CLR.withOpacity(0.5),
                      size: 30,
                    ),
                    iconSize: 30,
                  ),
                ),
              ),
              SizedBox(
                height: h * 0.020,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: w * 0.4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        styleText(DURATION, BLACK_CLR, FontWeight.normal, 15),
                        Container(
                          height: h * 0.06,
                          margin: EdgeInsets.only(top: h * 0.010),
                          decoration: BoxDecoration(
                              color: WHITE_CLR,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: BORDER_CLR, width: 1)),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 15, right: 5, top: 3),
                            child: DropdownButton<String>(
                              isExpanded: true,
                              borderRadius: BorderRadius.circular(10),
                              underline: SizedBox(),
                              value: Duration,
                              onChanged: (String? newValue) =>
                                  setState(() => Duration = newValue!),
                              items:
                                  SelectDuration.map<DropdownMenuItem<String>>(
                                      (String value) =>
                                          DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(
                                              value,
                                              style: TextStyle(
                                                  color: PLACE_H_CLR,
                                                  fontSize: 14),
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
                      ],
                    ),
                  ),
                  SizedBox(
                    width: w * 0.45,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        styleText(DOSE_DAY, BLACK_CLR, FontWeight.normal, 15),
                        Container(
                          height: h * 0.06,
                          margin: EdgeInsets.only(top: h * 0.010),
                          decoration: BoxDecoration(
                              color: WHITE_CLR,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: BORDER_CLR, width: 1)),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 15, right: 5, top: 3),
                            child: DropdownButton<String>(
                              isExpanded: true,
                              borderRadius: BorderRadius.circular(10),
                              underline: SizedBox(),
                              value: day,
                              onChanged: (String? newValue) =>
                                  setState(() => day = newValue!),
                              items: SelectDay.map<DropdownMenuItem<String>>(
                                  (String value) => DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(
                                          value,
                                          style: TextStyle(
                                              color: PLACE_H_CLR, fontSize: 14),
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
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: h * 0.020,
              ),
              styleText(COURSE_START_DATE, BLACK_CLR, FontWeight.normal, 15),
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
                      startdate == null ? "DD-MM-YYYY" : "$startdate",
                      style: TextStyle(color: GRAY_CLR, fontSize: 14),
                    ),
                    GestureDetector(
                        onTap: () {
                          cutomDatePicker(context).then((value) {
                            setState(() {
                              startdate =
                                  DateFormat('dd/MM/yyyy').format(value!);
                              start = value;
                            });
                          });
                        },
                        child: Icon(
                          Icons.calendar_month_sharp,
                          color: GRAY_CLR.withOpacity(0.5),
                          size: 20,
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: h * 0.020,
              ),
              styleText(COURSE_END_DTAE, BLACK_CLR, FontWeight.normal, 15),
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
                      enddate == null ? "DD-MM-YYYY" : "$enddate",
                      style: TextStyle(color: GRAY_CLR, fontSize: 14),
                    ),
                    GestureDetector(
                        onTap: () {
                          cutomDatePicker(context).then((value) {
                            setState(() {
                              enddate = DateFormat('dd/MM/yyyy').format(value!);
                              end = value;
                            });
                          });
                        },
                        child: Icon(
                          Icons.calendar_month_sharp,
                          color: GRAY_CLR.withOpacity(0.5),
                          size: 20,
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: h * 0.028,
              ),
              styleText(REMINDER, BLACK_CLR, FontWeight.normal, 15),
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
                  customradioButton('Daily', reminder, (value) {
                    setState(() {
                      reminder = value.toString();
                    });
                  }),
                  SizedBox(
                    width: w * 0.010,
                  ),
                  styleText(DAILY, GRAY_CLR, FontWeight.normal, 15),
                  SizedBox(
                    width: w * 0.12,
                  ),
                  customradioButton('Weekly', reminder, (value) {
                    setState(() {
                      reminder = value.toString();
                    });
                  }),
                  SizedBox(
                    width: w * 0.010,
                  ),
                  styleText(WEEKLY, GRAY_CLR, FontWeight.normal, 15),
                ],
              ),
              SizedBox(
                height: h * 0.020,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  styleText(AT_TIME, BLACK_CLR, FontWeight.normal, 15),
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
                          attime != null ? attime! : '00 : 00 AM',
                          style: TextStyle(color: GRAY_CLR, fontSize: 14),
                        ),
                        GestureDetector(
                            onTap: () {
                              showTime(context).then((value) {
                                setState(() {
                                  attime = value.format(context);
                                });
                              });
                            },
                            child: Icon(
                              Icons.access_time_rounded,
                              color: GRAY_CLR.withOpacity(0.5),
                              size: 20,
                            )),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: h * 0.050,
              ),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: isaddmedicine || isdeditingmedicine
                      ? loader
                      : DefaultButton(
                          text: DONE,
                          ontap: () async {
                            if (widget.isedit == true) {
                              setState(() {
                                isdeditingmedicine = true;
                              });
                              print("=====start");
                              await EditMedicineApi(
                                      medicinename.name ?? "",
                                      Duration,
                                      day,
                                      start == null
                                          ? startdate!
                                          : DateFormat("yyyy-MM-dd")
                                              .format(start!),
                                      end == null
                                          ? enddate!
                                          : DateFormat("yyyy-MM-dd")
                                              .format(end!),
                                      reminder,
                                      attime.toString(),
                                      widget.editmedicine!.id.toString())
                                  .then((value) {
                                customSnackbar(
                                    context, value['message'].toString());
                                Navigate_replace(context, Medicines());
                                setState(() {
                                  isdeditingmedicine = false;
                                });
                              });
                              setState(() {
                                isdeditingmedicine = false;
                              });
                            } else {
                              if (checkValidation()) {
                                setState(() {
                                  isaddmedicine = true;
                                });
                                await addMedicineApi(
                                  selectedmedicine.toString(),
                                  Duration,
                                  day,
                                  DateFormat("yyyy-MM-dd").format(start!),
                                  DateFormat("yyyy-MM-dd").format(end!),
                                  reminder,
                                  attime.toString(),
                                ).then((value) {
                                  customSnackbar(
                                      context, value['message'].toString());
                                  Navigate_replace(context, Medicines());
                                  setState(() {
                                    isaddmedicine = false;
                                  });
                                });
                                setState(() {
                                  isaddmedicine = false;
                                });
                              }
                            }
                          },
                          fontsize: 15,
                          height: h * 0.060,
                          width: w * 0.8))
            ]),
      ),
    );
  }

  checkValidation() {
    if (selectedmedicine == null) {
      customSnackbar(context, "Please select medicine name");
      return false;
    } else if (startdate == null) {
      customSnackbar(context, "Please select course start date");
      return false;
    } else if (enddate == null) {
      customSnackbar(context, "Please select course end date");
      return false;
    } else if (attime == null) {
      customSnackbar(context, "Please select time");
      return false;
    }
    return true;
  }
}
