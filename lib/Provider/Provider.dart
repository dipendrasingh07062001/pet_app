import 'package:flutter/material.dart';
import 'package:pet_app/Screens/GetStart.dart';
import '../Screens/ForgotPassword.dart';
import '../Screens/HOME/Home.dart';
import '../Screens/Login.dart';
import '../Screens/Signup.dart';
import '../UTILS/Utils.dart';

class ProviderTutorial extends ChangeNotifier {
  bool isClick = false;

  bool isloding = false;

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
    Navigate_replace(context, Login());
    isClick = true;
    notifyListeners();
  }

  NavigateSinup(BuildContext context) {
    Navigate_to(context, Signup());
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
}
