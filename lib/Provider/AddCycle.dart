import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pet_app/Screens/AddPeriod.dart';

import '../UTILS/Utils.dart';

class AddCycleProvider extends ChangeNotifier {
  String selectedDate = DateFormat("dd-mm-yyyy").format(DateTime.now());
  bool isLoading = false;

  DateTime focusedDate = DateTime.now();
  int cycletime = 0;
  int cyclerepeattime = 0;
  DateTime perioddate = DateTime.now();
  String petcurrentstate = "Pregnant";

  bool periodPredictions = false;
  bool periodNotification = false;
  setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  addPeriodDate(DateTime date) {
    perioddate = date;
    notifyListeners();
  }

  final startdate = DateTime.now().subtract(Duration(days: 365));
  final enddate = DateTime.now().add(Duration(days: 365));
  void onSingleDaySeclect(DateTime selected, DateTime focusedDay) {
    if (DateTime.now().isAfter(selected)) {
      selectedDate = DateFormat("dd-mm-yyyy").format(selected);
      focusedDate = selected;
    }

    notifyListeners();
  }

  bool selectedDayPredicate(DateTime day) {
    return datematch(focusedDate, day);
  }
}
