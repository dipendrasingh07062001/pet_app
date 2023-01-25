import 'package:flutter/cupertino.dart';
import '../Api/Services.dart';
import '../UTILS/Utils.dart';

class Predictions extends ChangeNotifier {
  List<DateTime> days = [];
  List<DateTime> showdates = [];
  bool isLoading = false;
  int iterval = 0;
  int lastlong = 0;

  Future getPreductionDates(BuildContext context) async {
    isLoading = true;
    await getcycleprediction(context).then((value) {
      showdates.clear();
      value.forEach((e) {
        showdates.add(DateTime.parse(e));
      });
      days.clear();
      showdates.forEach((element) {
        generatedateList(element);
      });
      isLoading = false;
      notifyListeners();
    });
    notifyListeners();
  }

  bool selectedDayPredicate(DateTime day) {
    return days.any((element) => datematch(element, day));
  }

  generatedateList(final value) {
    for (int i = 0; i < lastlong; i++) {
      days.add(value.add(Duration(days: i)));
    }
    print(days);
    // days.add(value);
    // days.add(value.add(Duration(days: 1)));
    // days.add(value.add(Duration(days: 2)));
    // days.add(value.add(Duration(days: 3)));
    // days.add(value.add(Duration(days: 4)));
    notifyListeners();
  }
}
