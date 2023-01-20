import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:pet_app/Api/Models/getDewormingModel.dart';
import 'package:pet_app/Api/Models/remindermodel.dart';
import 'package:pet_app/Api/Models/schedulemodel.dart';
import 'package:pet_app/Api/Prefrence.dart';
import 'package:pet_app/Notification/notificationMathod.dart';
import 'package:pet_app/Notification/scheduledModel.dart';

import '../Api/Services.dart';

class ReminderService extends ChangeNotifier {
  List<Daily?>? dailyreminderList = [];
  List<Daily?>? weeklyreminderList = [];
  List<VaccinationReminder> vaccineList = [];
  List<Data> dList = [];
  bool isLoading = false;
  get_reminder(BuildContext context) async {
    dailyreminderList?.clear();
    weeklyreminderList?.clear();
    vaccineList.clear();
    isLoading = true;
    notifyListeners();
    await getAllreminderData(context);
    // notificationschedule();
    isLoading = false;
    notifyListeners();
  }

  // notificationschedule() {
  //   NotificationHelper notificationHelper = NotificationHelper();
  //   List<ScheduledSave> list = [];
  //   int id = 0;
  //   reminderList.forEach((element) {
  //     print("entering");
  //     int hour = int.parse(element.atTime!.split(":").first);
  //     int minute = int.parse(element.atTime!.split(":")[1]);
  //     DateTime date = DateTime(
  //       element.courseStartDate!.year,
  //       element.courseStartDate!.month,
  //       element.courseStartDate!.day,
  //       hour,
  //       minute,
  //       00,
  //     ); //element.courseStartDate!.add(Duration(days: i));
  //     print("before");
  //     print(DateTime.now().isBefore(date));
  //     print(DateTime.now().toIso8601String());
  //     print(date.toIso8601String());
  //     if (DateTime.now().isBefore(date)) {
  //       print("12345678909876543");
  //       ScheduledSave mod = ScheduledSave();
  //       mod.id = element.id;
  //       mod.title = element.name;
  //       mod.body = "Your pet's medicine time";
  //       mod.date = date;
  //       list.add(mod);

  //       notificationHelper.scheduleonday(
  //         element.id!,
  //         element.name!,
  //         "your pet medicine time",
  //         date,
  //       );
  //       id++;
  //     }
  //     // for (int i = 0;
  //     //     i <
  //     //         element.courseEndDate!
  //     //             .difference(element.courseStartDate!)
  //     //             .inDays;
  //     //     i++) {
  //     //   print(
  //     //     "=======" +
  //     //         element.courseEndDate!
  //     //             .difference(element.courseStartDate!)
  //     //             .inDays
  //     //             .toString(),
  //     //   );
  //     //   print(
  //     //     "=======+++" + id.toString(),
  //     //   );

  //     //   // print()
  //     // }

  //     // switch (element.reminder!.toLowerCase()) {
  //     //   case "daily":
  //     //     int hour = int.parse(element.atTime!.split(":").first) - 1;
  //     //     int minute = int.parse(element.atTime!.split(":")[1]);
  //     //     notificationHelper.schedulDailyNotification(
  //     //         element.id ?? 0,
  //     //         element.name ?? "",
  //     //         "Your pet medicine time",
  //     //         RepeatInterval.daily,
  //     //         hour,
  //     //         minute);
  //     //     break;
  //     //   case "weekly":
  //     //     int hour = int.parse(element.atTime!.split(":").first);
  //     //     int minute = int.parse(element.atTime!.split(":")[1]);
  //     //     // DateTime date = DateTime.parse(element.atTime!);

  //     //     notificationHelper.scheduleWeeklynotification(
  //     //       element.id ?? 0,
  //     //       element.name ?? "",
  //     //       "Your pet medicine time",
  //     //       RepeatInterval.weekly,
  //     //       hour,
  //     //       minute,
  //     //       Day(0),
  //     //       // Day(int.parse(DateFormat("E").format(element.courseStartDate!))),
  //     //     );
  //     //     break;
  //     //   default:
  //     // }
  //     // NotificationHelper
  //   });
  //   // SavePrefs.savedata(list);
  //   // SavePrefs.getdataAndSceduldNotification();
  // }
}
