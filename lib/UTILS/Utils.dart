import 'package:flutter/material.dart';
import 'package:pet_app/Colors/COLORS.dart';
import '../Componants/Images&Icons.dart';

//// select date
///
Future<DateTime?> cutomDatePicker(BuildContext context) async {
  final datePick = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100));
  if (datePick != null) {
    return datePick;
  }
  return null;
}

//// select time
///
Future showTime(BuildContext context) async {
  final TimeOfDay? result =
      await showTimePicker(context: context, initialTime: TimeOfDay.now());
  if (result != null) {
    return result;
  }
  return null;
}

//Default Button
class DefaultButton extends StatelessWidget {
  final String text;
  final double height;
  final double width;
  final Function() ontap;
  final double fontsize;

  const DefaultButton({
    Key? key,
    required this.text,
    required this.ontap,
    required this.fontsize,
    required this.height,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
          alignment: Alignment.center,
          height: height,
          width: width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: GREEN_CLR),
          child: Text(text,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: WHITE70_CLR,
                fontSize: fontsize,
              ))),
    );
  }
}

//Default Navigator
Navigate_to(BuildContext context, Widget widget) {
  return Navigator.push(context, MaterialPageRoute(builder: (ctx) => widget));
}

Navigate_replace(BuildContext context, Widget widget) {
  return Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (ctx) => widget));
}

Navigate_PushRemove(BuildContext context, Widget widget) {
  return Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => widget),
      (Route<dynamic> route) => false);
}

AppBar DefaultAppBar(String text) {
  return AppBar(
    centerTitle: true,
    toolbarHeight: 65,
    backgroundColor: WHITE70_CLR,
    elevation: 1,
    title: styleText(text, DARK_CLR, FontWeight.bold, 17),
  );
}

//DefultText
Text styleText(
  String value,
  Color color,
  FontWeight weight,
  double fontSize,
) {
  return Text(
    value,
    style: TextStyle(color: color, fontWeight: weight, fontSize: fontSize),
    textAlign: TextAlign.start,
  );
}

Text TutorialText(
  String value,
  Color color,
  FontWeight weight,
  double fontSize,
) {
  return Text(
    value,
    style: TextStyle(color: color, fontWeight: weight, fontSize: fontSize),
    textAlign: TextAlign.center,
  );
}

class DefaultRadioButton extends StatelessWidget {
  final String text;
  final int groupValue;
  final int value;

  final Function(int?) ontap;

  DefaultRadioButton({
    Key? key,
    required this.text,
    required this.groupValue,
    required this.value,
    required this.ontap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(left: 10, right: 10),
        alignment: Alignment.center,
        height: 50,
        margin: const EdgeInsets.only(top: 20),
        decoration: BoxDecoration(
            color: WHITE_CLR,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: BORDER_CLR, width: 1)),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          styleText(text, GREEN_CLR, FontWeight.normal, 15),
          SizedBox(
              height: 20,
              width: 20,
              child: Radio(
                value: value,
                groupValue: groupValue,
                activeColor: GREEN_CLR,
                onChanged: ontap,
              ))
        ]));
  }

  ////date picker /// select dob

  //// Snacbar

  // ScaffoldFeatureController<SnackBar, SnackBarClosedReason> snkbar(
  //   BuildContext context,
  //   String txt,
  // ) {
  //   return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //     content: Text(
  //       txt,
  //       style: const TextStyle(color: WHITE_CLR),
  //     ),
  //     backgroundColor: GREEN_CLR,
  //   ));
  // }
}

//// Delete Dilodg

Future deleteDialog(BuildContext context, Function() onTap, String text) {
  var h;
  var w;

  return showDialog(
      context: context,
      builder: (BuildContext context) {
        h = MediaQuery.of(context).size.height;
        w = MediaQuery.of(context).size.width;
        return Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            title: Center(
              child: TutorialText(text, BLACK_CLR, FontWeight.normal, 17),
            ),
            content: SizedBox(
              height: h * 0.13,
              width: w * 0.18,
              child: Column(
                children: [
                  SizedBox(
                    height: h * 0.010,
                  ),
                  DefaultButton(
                      text: DELETE,
                      ontap: onTap,
                      fontsize: 17,
                      height: 40,
                      width: 200),
                  const SizedBox(height: 18),
                  InkWell(
                      onTap: () => Navigator.of(context).pop(),
                      child:
                          styleText(CANCEL, GREEN_CLR, FontWeight.normal, 17)),
                ],
              ),
            ),
          ),
        );
      });
}

//// hide keybord while on tap
///
///

var currentFocus;

unfocus(BuildContext context) {
  currentFocus = FocusScope.of(context);
  if (!currentFocus.hasPrimaryFocus) {
    currentFocus.unfocus();
  }
}
