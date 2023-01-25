import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:intl/intl.dart';
import 'package:pet_app/Api/Models/cycletackingModel.dart';
import 'package:pet_app/UTILS/Utils.dart';
import 'package:provider/provider.dart';

import '../../Api/Services.dart';
import '../../Colors/COLORS.dart';
import '../../Provider/AddCycle.dart';

class EditCycle_tracking extends StatefulWidget {
  const EditCycle_tracking({super.key});

  @override
  State<EditCycle_tracking> createState() => _EditCycle_trackingState();
}

class _EditCycle_trackingState extends State<EditCycle_tracking> {
  var h;
  var w;
  final last = TextEditingController();
  final pdays = TextEditingController();
  final cycledays = TextEditingController();
  bool isSwitched = false;
  bool isSwitched1 = false;

  void toggleSwitch(bool value) {
    if (isSwitched == false) {
      setState(() {
        isSwitched = true;
      });
      print('Switch Button is ON');
    } else {
      setState(() {
        isSwitched = false;
      });
      print('Switch Button is OFF');
    }
  }

  void toggleSwitch2(bool value) {
    if (isSwitched1 == false) {
      setState(() {
        isSwitched1 = true;
      });
      print('Switch Button is ON');
    } else {
      setState(() {
        isSwitched1 = false;
      });
      print('Switch Button is OFF');
    }
  }

  bool isLoadong = true;
  GetCycleModel model = GetCycleModel();
  @override
  void initState() {
    super.initState();
    pdays.text = "0";
    cycledays.text = "0";
    getcycletrackingData(context).then((value) {
      if (value != null) {
        model = value;
        pdays.text = model.lastPeriodDays!;
        cycledays.text = model.lastLongPeriodDays!;
        isSwitched = model.predictions == "true";
        isSwitched1 = model.periodNotification == "true";
      }
      setState(() {
        isLoadong = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: DefaultAppBar("Edit Pet Cycle"),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Visibility(
        visible: !isLoadong,
        child: Container(
          width: w,
          height: h * 0.06,
          margin: EdgeInsets.symmetric(
            horizontal: w * 0.05,
            vertical: h * 0.02,
          ),
          child: ElevatedButton(
            onPressed: () {
              editcycletrackingData(
                context,
                model.id.toString(),
                last.text,
                pdays.text,
                cycledays.text,
                "",
                isSwitched,
                isSwitched1,
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: GREEN_CLR,
            ),
            child: Center(
              child: styleText(
                "Done",
                WHITE_CLR,
                FontWeight.normal,
                14,
              ),
            ),
          ),
        ),
      ),
      body: isLoadong
          ? loader
          : Container(
              height: h,
              width: w,
              padding: EdgeInsets.symmetric(horizontal: w * 0.05),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    height: h * 0.05,
                    child: styleText(
                      "When did your pet’s last period start?",
                      GREEN_CLR,
                      FontWeight.normal,
                      14,
                    ),
                  ),
                  TextFormField(
                    controller: last,
                    onTap: () {
                      print("123456789876543");
                    },
                    readOnly: true,
                    decoration: InputDecoration(
                        fillColor: WHITE_CLR,
                        filled: true,
                        isDense: true,
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                          color: GREEN_CLR,
                        )),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                          color: GRAY_CLR,
                        )),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                          color: GREEN_CLR,
                        )),
                        hintText: model.lastPeriodDate != null
                            ? DateFormat("yyyy-MM-dd")
                                .format(model.lastPeriodDate!)
                            : "YYYY-MM-DD",
                        hintStyle: TextStyle(
                          color: GREEN_CLR,
                          fontSize: 14,
                        ),
                        suffixIcon: Icon(
                          Icons.calendar_month,
                          color: GREEN_CLR,
                        )),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    height: h * 0.05,
                    child: styleText(
                      "How long does your pet’s period usually last?",
                      GREEN_CLR,
                      FontWeight.normal,
                      14,
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: pdays,
                          onTap: () {
                            print("123456789876543");
                          },
                          keyboardType: TextInputType.numberWithOptions(
                            signed: false,
                            decimal: false,
                          ),
                          // readOnly: true,
                          inputFormatters: <TextInputFormatter>[
                            // for below version 2 use this
                            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
// for version 2 and greater youcan also use this
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          decoration: InputDecoration(
                            isDense: true,
                            filled: true,
                            fillColor: WHITE_CLR,
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                              color: GRAY_CLR,
                            )),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                              color: GRAY_CLR,
                            )),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                              color: GRAY_CLR,
                            )),
                            hintText: "",
                            hintStyle: TextStyle(color: GRAY_CLR),
                            suffixIcon: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                styleText(
                                  "Days",
                                  GREEN_CLR,
                                  FontWeight.normal,
                                  14,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: w * 0.01,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (int.parse(pdays.text) > 0) {
                            pdays.text = (int.parse(pdays.text) - 1).toString();
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: GREEN_CLR),
                        child: SizedBox(
                          height: h * 0.065,
                          child: Icon(Icons.remove),
                        ),
                      ),
                      SizedBox(
                        width: w * 0.01,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          pdays.text = (int.parse(pdays.text) + 1).toString();
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: GREEN_CLR),
                        child: SizedBox(
                          height: h * 0.065,
                          child: Icon(Icons.add),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    height: h * 0.05,
                    child: styleText(
                      "How long is the typical cycle?",
                      GREEN_CLR,
                      FontWeight.normal,
                      14,
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: cycledays,
                          onTap: () {
                            print("123456789876543");
                          },
                          keyboardType: TextInputType.numberWithOptions(
                            signed: false,
                            decimal: false,
                          ),
                          // readOnly: true,
                          inputFormatters: <TextInputFormatter>[
                            // for below version 2 use this
                            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
// for version 2 and greater youcan also use this
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          decoration: InputDecoration(
                            hintStyle: TextStyle(color: GRAY_CLR),
                            isDense: true,
                            fillColor: WHITE_CLR,
                            filled: true,
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                              color: GRAY_CLR,
                            )),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                              color: GRAY_CLR,
                            )),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                              color: GRAY_CLR,
                            )),
                            hintText: "",
                            suffixIcon: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                styleText(
                                  "Days",
                                  GREEN_CLR,
                                  FontWeight.normal,
                                  14,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: w * 0.01,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (int.parse(pdays.text) > 0) {
                            cycledays.text =
                                (int.parse(cycledays.text) - 1).toString();
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: GREEN_CLR),
                        child: SizedBox(
                          height: h * 0.065,
                          child: Icon(Icons.remove),
                        ),
                      ),
                      SizedBox(
                        width: w * 0.01,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          cycledays.text =
                              (int.parse(cycledays.text) + 1).toString();
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: GREEN_CLR),
                        child: SizedBox(
                          height: h * 0.065,
                          child: Icon(Icons.add),
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isSwitched = !isSwitched;
                        context.read<AddCycleProvider>().periodPredictions =
                            isSwitched;
                      });
                    },
                    child: Container(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        alignment: Alignment.center,
                        height: 50,
                        margin: EdgeInsets.only(top: 20),
                        decoration: BoxDecoration(
                            color: WHITE_CLR,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: BORDER_CLR, width: 1)),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              styleText(
                                "Period Predictions",
                                GREEN_CLR,
                                FontWeight.normal,
                                15,
                              ),
                              FlutterSwitch(
                                width: 40.0,
                                height: 18.0,
                                activeColor: GREEN_CLR,
                                inactiveColor: GRAY_CLR.withOpacity(0.3),
                                valueFontSize: 0.0,
                                toggleSize: 16.0,
                                value: isSwitched,
                                borderRadius: 40.0,
                                padding: 2,
                                onToggle: (val) {
                                  setState(() {
                                    isSwitched = val;
                                    context
                                        .read<AddCycleProvider>()
                                        .periodPredictions = isSwitched;
                                  });
                                },
                              ),
                            ])),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isSwitched1 = !isSwitched1;
                        context.read<AddCycleProvider>().periodNotification =
                            isSwitched1;
                      });
                    },
                    child: Container(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        alignment: Alignment.center,
                        height: 50,
                        margin: EdgeInsets.only(top: 20),
                        decoration: BoxDecoration(
                            color: WHITE_CLR,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: BORDER_CLR, width: 1)),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              styleText("Period Notification", GREEN_CLR,
                                  FontWeight.normal, 15),
                              FlutterSwitch(
                                width: 40.0,
                                height: 18.0,
                                activeColor: GREEN_CLR,
                                inactiveColor: GRAY_CLR.withOpacity(0.3),
                                valueFontSize: 0.0,
                                toggleSize: 16.0,
                                value: isSwitched1,
                                borderRadius: 40.0,
                                padding: 2,
                                onToggle: (val) {
                                  setState(() {
                                    isSwitched1 = val;
                                    context
                                        .read<AddCycleProvider>()
                                        .periodNotification = isSwitched1;
                                  });
                                },
                              ),
                            ])),
                  ),
                ],
              ),
            ),
    );
  }
}
