// To parse this JSON data, do
//
//     final daily = dailyFromJson(jsonString);

import 'dart:convert';

List<Daily?>? dailyFromJson(String str) => json.decode(str) == null
    ? []
    : List<Daily?>.from(json.decode(str)!.map((x) => Daily.fromJson(x)));

String dailyToJson(List<Daily?>? data) => json.encode(
    data == null ? [] : List<dynamic>.from(data.map((x) => x!.toJson())));

class Daily {
  Daily({
    this.id,
    this.userId,
    this.petId,
    this.medicineName,
    this.duration,
    this.does,
    this.courseStartDate,
    this.courseEndDate,
    this.reminder,
    this.atTime,
    this.timesreminder,
    this.nextdate,
  });

  final int? id;
  final int? userId;
  final int? petId;
  final String? medicineName;
  final String? duration;
  final String? does;
  final DateTime? courseStartDate;
  final DateTime? courseEndDate;
  final String? reminder;
  final String? atTime;
  final String? timesreminder;
  final DateTime? nextdate;

  factory Daily.fromJson(Map<String, dynamic> json) => Daily(
        id: json["id"],
        userId: json["user_id"],
        petId: json["pet_id"],
        medicineName: json["medicine_name"],
        duration: json["duration"],
        does: json["does"],
        courseStartDate: DateTime.parse(json["course_start_date"]),
        courseEndDate: DateTime.parse(json["course_end_date"]),
        reminder: json["reminder"],
        atTime: json["at_time"],
        timesreminder: json["timesreminder"],
        nextdate: DateTime.parse(json["nextdate"] ?? json["weekdate"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "pet_id": petId,
        "medicine_name": medicineName,
        "duration": duration,
        "does": does,
        "course_start_date":
            "${courseStartDate!.year.toString().padLeft(4, '0')}-${courseStartDate!.month.toString().padLeft(2, '0')}-${courseStartDate!.day.toString().padLeft(2, '0')}",
        "course_end_date":
            "${courseEndDate!.year.toString().padLeft(4, '0')}-${courseEndDate!.month.toString().padLeft(2, '0')}-${courseEndDate!.day.toString().padLeft(2, '0')}",
        "reminder": reminder,
        "at_time": atTime,
        "timesreminder": timesreminder,
        "nextdate":
            "${nextdate!.year.toString().padLeft(4, '0')}-${nextdate!.month.toString().padLeft(2, '0')}-${nextdate!.day.toString().padLeft(2, '0')}",
      };
}
