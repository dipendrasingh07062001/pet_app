import 'package:flutter/material.dart';
import 'package:pet_app/Screens/GetStart.dart';
import '../Screens/HOME/Home.dart';
import '../Screens/Onbording/ForgotPassword.dart';
import '../Screens/Onbording/Login.dart';
import '../Screens/Onbording/Signup.dart';
import '../UTILS/Utils.dart';

class ProviderTutorial extends ChangeNotifier {
  bool isClick = false;

  bool isloding = true;

  changePage() {
    isClick = true;

    notifyListeners();
  }

  change() {
    isClick = !isClick;
    isloding = !isloding;
    notifyListeners();
  }

  NavigateLogin(BuildContext context) {
    Navigate_replace(context, const Login());
    isClick = true;
    notifyListeners();
  }

  NavigateSinup(BuildContext context) {
    Navigate_to(context, const Signup());
    isClick = false;
    notifyListeners();
  }

  NavigateHome(BuildContext context) {
    Navigate_replace(context, Home());
    notifyListeners();
  }

  NavigateForgotPassword(BuildContext context) {
    Navigate_to(context, ForgotPassword());
    notifyListeners();
  }

  NavigateGetStarted(BuildContext context) {
    isClick = true;
    Navigate_replace(context, GetStarted());
    notifyListeners();
  }

  int gender = 1;
  OnValueChange(int? index) {
    gender = index ?? gender;
    notifyListeners();
  }

  TextEditingController searchLocationCantroller = TextEditingController();

  BottomSeetProvider(String search) {
    searchLocationCantroller == search;
    print(searchLocationCantroller);
    notifyListeners();
  }

////// select date
  String? selectAtdate;
  DateTime? birthDate;
  Future<void> datePicker(context) async {
    final datePick = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime(2100));
    if (datePick != null && datePick != birthDate) {
      birthDate = datePick;
      selectAtdate =
          "${birthDate!.day}-${birthDate!.month}-${birthDate!.year}"; // 08/14/2019

    }
    notifyListeners();
  }
}
