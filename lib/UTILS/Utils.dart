import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:pet_app/Colors/COLORS.dart';
import '../Api/Prefrence.dart';
import '../Componants/Images&Icons.dart';
import '../Screens/Onbording/Login.dart';
import 'package:geolocator/geolocator.dart';

/// Determine the current position of the device.
///
/// When the location services are not enabled or permissions
/// are denied the `Future` will return an error.
Future<Position> determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  // Test if location services are enabled.
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    // Location services are not enabled don't continue
    // accessing the position and request users of the
    // App to enable the location services.
    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      // Permissions are denied, next time you could try
      // requesting permissions again (this is also where
      // Android's shouldShowRequestPermissionRationale
      // returned true. According to Android guidelines
      // your App should show an explanatory UI now.
      return Future.error('Location permissions are denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    // Permissions are denied forever, handle appropriately.
    return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
  }

  // When we reach here, permissions are granted and we can
  // continue accessing the position of the device.
  return await Geolocator.getCurrentPosition();
}

//// select date

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

/////Snackbar

customSnackbar(
  BuildContext context,
  String txt,
) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: Duration(milliseconds: 1000),
      backgroundColor: GREEN_CLR,
      behavior: SnackBarBehavior.floating,
      content: Text(txt.toString())));
}

//// select time

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

flotingButton(Function() ontap) {
  return Padding(
    padding: const EdgeInsets.only(top: 10),
    child: FloatingActionButton(
      backgroundColor: WHITE70_CLR,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(50)),
          side: BorderSide(color: GREEN_CLR)),
      onPressed: ontap,
      child: const Icon(
        Icons.add,
        size: 40,
        color: GREEN_CLR,
      ),
    ),
  );
}

customradioButton(
  String value,
  String groupvalue,
  Function(String?) ontap,
) {
  return SizedBox(
    height: 20,
    width: 20,
    child: Radio(
        value: value,
        groupValue: groupvalue,
        activeColor: GREEN_CLR,
        onChanged: ontap),
  );
}

///// custom date Container
var h;
var w;
customDateContainer(BuildContext context, Function()? ontap, String text) {
  h = MediaQuery.of(context).size.height;
  w = MediaQuery.of(context).size.width;
  return Container(
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
          text,
          style: const TextStyle(color: GRAY_CLR, fontSize: 14),
        ),
        GestureDetector(
          onTap: ontap,
          child: Icon(
            Icons.calendar_month_sharp,
            color: GRAY_CLR.withOpacity(0.5),
            size: 20,
          ),
        )
      ],
    ),
  );
}

///// image picker by galllery

// PickedFile? selectImage = null;

// Opengallery(BuildContext context) async {
//   final GalleryImage = await ImagePicker().getImage(
//     source: ImageSource.gallery,
//   );

//   selectImage = GalleryImage!;

File? imageFile;

FromGallery() async {
  PickedFile? pickedFile = await ImagePicker().getImage(
    source: ImageSource.gallery,
    maxWidth: 1800,
    maxHeight: 1800,
  );
  if (pickedFile != null) {
    // setState(() {});
    imageFile = File(pickedFile.path);
  }
}

const loader = Center(
  child: CircularProgressIndicator.adaptive(
    backgroundColor: GREEN_CLR,
  ),
);
Widget valueLoader(double? value) => Center(
      child: CircularProgressIndicator.adaptive(value: value),
    );

Future pickimageFile() async {
  FilePickerResult? result = await FilePicker.platform.pickFiles(
    type: FileType.image,
  );

  return result != null ? result.paths.first : null;
}

Future pickdocFile() async {
  FilePickerResult? result = await FilePicker.platform.pickFiles(
    type: FileType.custom,
    allowedExtensions: ['pdf', 'doc'],
  );

  return result != null ? result.paths.first : null;
}

floatingsnackbar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Container(
      // width: MediaQuery.of(context).size.width * 0.5,
      height: MediaQuery.of(context).size.height * 0.06,
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: BLACK70_CLR, borderRadius: BorderRadius.circular(20)),
      alignment: Alignment.center,
      child: Text(
        message,
        textAlign: TextAlign.center,
      ),
    ),
    elevation: 0,
    backgroundColor: Colors.transparent,
    behavior: SnackBarBehavior.floating,
    margin: EdgeInsets.only(
      bottom: MediaQuery.of(context).size.height * 0.1,
      left: MediaQuery.of(context).size.width * 0.15,
      right: MediaQuery.of(context).size.width * 0.15,
      // top: MediaQuery.of(context).size.height * 0.1,
    ),
  ));
}

Future pickImage(ImageSource imageType) async {
  try {
    final photo = await ImagePicker().pickImage(source: imageType);
    if (photo == null) return;
    final tempImage = File(photo.path);
    return tempImage;
  } catch (error) {
    debugPrint(error.toString());
    return null;
  }
}

bool datematch(DateTime date1, DateTime date2) {
  return date1.day == date2.day &&
      date1.year == date2.year &&
      date1.month == date2.month;
}

showdate(DateTime date) {
  String qwe = "";
  final now = DateTime.now();
  final tomorrow = DateTime.now().add(const Duration(days: 1));
  final yesterday = DateTime.now().subtract(const Duration(days: 1));
  if (now.day == date.day && now.month == date.month && now.year == date.year) {
    qwe = "Today,";
    return qwe + DateFormat(" dd MMM").format(date);
  }
  if (tomorrow.day == date.day &&
      tomorrow.month == date.month &&
      tomorrow.year == date.year) {
    qwe = "Tomorrow,";
    return qwe + DateFormat(" dd MMM").format(date);
  }
  if (yesterday.day == date.day &&
      yesterday.month == date.month &&
      yesterday.year == date.year) {
    qwe = "Yesterday,";
    return qwe + DateFormat(" dd MMM").format(date);
  }
  return DateFormat("EEEE, dd MMM").format(date);
}

Future<void> Logout(BuildContext context) {
  var h;
  var w;

  h = MediaQuery.of(context).size.height;
  w = MediaQuery.of(context).size.width;
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            title: Center(
              child:
                  TutorialText(LOGOUT_TITLE, BLACK_CLR, FontWeight.normal, 17),
            ),
            content: SizedBox(
              height: h * 0.12,
              width: w * 0.18,
              child: Column(
                children: [
                  SizedBox(
                    height: h * 0.010,
                  ),
                  DefaultButton(
                      text: LOGOUT,
                      ontap: () async {
                        Preference.Pref.clear().then((value) async {
                          Navigate_PushRemove(context, Login());
                          GoogleSignIn googleSignIn = GoogleSignIn();
                          await googleSignIn.signOut();

                          print(value.toString());
                        });
                      },
                      fontsize: 17,
                      height: 40,
                      width: 300),
                  const SizedBox(
                    height: 18,
                  ),
                  GestureDetector(
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
