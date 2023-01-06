import '../Notification/notificationMathod.dart';
import '../Notification/scheduledModel.dart';

class Preference {
  static var Pref;
}

class SavePrefs {
  static void savedata(List<ScheduledSave> data) async {
    String savedata = scheduledSaveToJson(data);
    print(savedata);
    await Preference.Pref.setString("scheduledNotification", savedata);
  }

  static Future<List<ScheduledSave>> getdataAndSceduldNotification() async {
    NotificationHelper notificationHelper = NotificationHelper();
    List<ScheduledSave> data = [];
    int id = 0;
    data = scheduledSaveFromJson(
        await Preference.Pref.getString("scheduledNotification") ?? "");

    data.forEach((element) {
      notificationHelper.scheduleonday(
        id,
        element.title!,
        element.body!,
        element.date!,
      );
      id++;
    });
    return data;
  }
}
