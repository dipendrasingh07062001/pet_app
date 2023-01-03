import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http/http.dart';
import 'package:pet_app/Api/Models/remindermodel.dart';
import 'package:pet_app/Notification/notificationMathod.dart';

import '../Api/Services.dart';

class ReminderService extends ChangeNotifier {
  List<ReminderModel> reminderList = [];
  bool isLoading = false;
  get_reminder(BuildContext context) async {
    reminderList.clear();
    isLoading = true;
    notifyListeners();
    await getreminderData(context).then((value) {
      if (value != null) {
        reminderList.addAll(value);
      }
      isLoading = false;
      notifyListeners();
    });
    notificationschedule();
    notifyListeners();
  }

  notificationschedule() {
    NotificationHelper notificationHelper = NotificationHelper();
    reminderList.forEach((element) {
      switch (element.reminder!.toLowerCase()) {
        case "daily":
          DateTime date = DateTime.parse(element.atTime!);
          print(date);
          // notificationHelper.schedulDailyNotification(
          //   element.id??0,
          //   element.name??"",
          //   "Your pet medicine time",
          //   RepeatInterval.daily,
          //   element.
          // );
          break;
        case "weekly":
          int hour = int.parse(element.atTime!.split(":").first);
          int minute = int.parse(element.atTime!.split(":")[1]);
          // DateTime date = DateTime.parse(element.atTime!);

          notificationHelper.scheduleWeeklynotification(
            element.id ?? 0,
            element.name ?? "",
            "Your pet medicine time",
            RepeatInterval.weekly,
            hour,
            minute,
          );
          break;
        default:
      }
      // NotificationHelper
    });
  }
}
