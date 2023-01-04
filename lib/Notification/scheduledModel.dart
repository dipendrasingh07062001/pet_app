// To parse this JSON data, do
//
//     final scheduledSave = scheduledSaveFromJson(jsonString);

import 'dart:convert';

List<ScheduledSave> scheduledSaveFromJson(String str) =>
    List<ScheduledSave>.from(
        json.decode(str).map((x) => ScheduledSave.fromJson(x)));

String scheduledSaveToJson(List<ScheduledSave> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ScheduledSave {
  ScheduledSave({
    this.date,
    this.id = 0,
    this.title = "",
    this.body = "",
  });

  DateTime? date;
  int? id;
  String? title;
  String? body;

  factory ScheduledSave.fromJson(Map<String, dynamic> json) => ScheduledSave(
        date: DateTime.parse(json["date"]),
        id: json["id"],
        title: json["title"],
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "date": date!.toIso8601String(),
        "id": id,
        "title": title,
        "body": body,
      };
}
