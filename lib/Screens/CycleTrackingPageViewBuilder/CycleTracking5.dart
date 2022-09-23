import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import '../../Colors/COLORS.dart';
import '../../UTILS/Utils.dart';

class CycleTracking5 extends StatefulWidget {
  const CycleTracking5({super.key});

  @override
  State<CycleTracking5> createState() => _CycleTracking5State();
}

class _CycleTracking5State extends State<CycleTracking5> {
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

  var h;
  var w;
  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: WHITE70_CLR,
        body: Padding(
            padding: EdgeInsets.all(h * 0.020),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(
                height: h * 0.050,
              ),
              styleText("Period predictions and \nnotifications?", DARK_CLR,
                  FontWeight.bold, 20),
              Container(
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
                        styleText("Period Predictions", GREEN_CLR,
                            FontWeight.normal, 15),
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
                            });
                          },
                        ),
                      ])),
              Container(
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
                            });
                          },
                        ),
                      ])),
            ])));
  }
}
