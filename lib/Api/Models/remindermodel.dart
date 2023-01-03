// To parse this JSON data, do
//
//     final reminderModel = reminderModelFromJson(jsonString);

import 'dart:convert';

List<ReminderModel> reminderModelFromJson(String str) =>
    List<ReminderModel>.from(
        json.decode(str).map((x) => ReminderModel.fromJson(x)));

String reminderModelToJson(List<ReminderModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ReminderModel {
  ReminderModel({
    this.id = 0,
    this.petId = 0,
    this.userId = 0,
    this.reminderId = 0,
    this.name = "",
    this.type = "",
    this.status = "",
    this.reminder = "",
    this.createdAt,
    this.updatedAt,
    this.medicineName = "",
    this.duration = "",
    this.does = "",
    this.courseStartDate,
    this.courseEndDate,
    this.atTime,
    this.reminderweekly,
    this.reminderdaily,
  });

  final int? id;
  final int? petId;
  final int? userId;
  final int? reminderId;
  final String? name;
  final String? type;
  final dynamic status;
  final String? reminder;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? medicineName;
  final String? duration;
  final String? does;
  final DateTime? courseStartDate;
  final DateTime? courseEndDate;
  final String? atTime;
  final String? reminderweekly;
  final String? reminderdaily;

  factory ReminderModel.fromJson(Map<String, dynamic> json) => ReminderModel(
        id: json["id"],
        petId: json["pet_id"],
        userId: json["user_id"],
        reminderId: json["reminder_id"],
        name: json["name"],
        type: json["type"],
        status: json["status"],
        reminder: json["reminder"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        medicineName: json["medicine_name"],
        duration: json["duration"],
        does: json["does"],
        courseStartDate: DateTime.parse(json["course_start_date"]),
        courseEndDate: DateTime.parse(json["course_end_date"]),
        atTime: json["at_time"],
        reminderweekly:
            json["reminderweekly"] == null ? null : json["reminderweekly"],
        reminderdaily:
            json["reminderdaily"] == null ? null : json["reminderdaily"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "pet_id": petId,
        "user_id": userId,
        "reminder_id": reminderId,
        "name": name,
        "type": type,
        "status": status,
        "reminder": reminder,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "medicine_name": medicineName,
        "duration": duration,
        "does": does,
        "course_start_date": courseStartDate!.toIso8601String(),
        "course_end_date": courseEndDate!.toIso8601String(),
        "at_time": atTime,
        "reminderweekly": reminderweekly == null ? null : reminderweekly,
        "reminderdaily": reminderdaily == null ? null : reminderdaily,
      };
}
