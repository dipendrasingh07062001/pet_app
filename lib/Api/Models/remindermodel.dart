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

final String tableNotes = 'medicine_notification';

class NoteFields {
  static final List<String> values = [
    /// Add all fields
    id, pet_id, medicine_name, duration, does, attime, nextdate,
  ];

  static final String id = 'id';
  static final String pet_id = 'pet_id';
  static final String medicine_name = 'medicine_name';
  static final String duration = 'duration';
  static final String does = "does";
  static final String attime = 'attime';
  static final String nextdate = 'nextdate';
  static final String which = 'which';
}

class Note {
  final int? id;
  final int pet_id;
  final String medicine_name;
  final String duration;
  final String does;
  final String attime;
  final String nextdate;
  final String which;

  Note({
    this.id,
    required this.pet_id,
    required this.medicine_name,
    required this.duration,
    required this.does,
    required this.attime,
    required this.nextdate,
    required this.which,
  });

  Note copy({
    int? id,
    int? pet_id,
    String? medicine_name,
    String? duration,
    String? does,
    String? attime,
    String? nextdate,
    String? which,
  }) =>
      Note(
        id: id ?? this.id,
        pet_id: pet_id ?? this.pet_id,
        medicine_name: medicine_name ?? this.medicine_name,
        duration: duration ?? this.duration,
        does: does ?? this.does,
        attime: attime ?? this.attime,
        nextdate: nextdate ?? this.nextdate,
        which: which ?? this.which,
      );

  static Note fromJson(Map<String, Object?> json) => Note(
        id: json[NoteFields.id] as int?,
        pet_id: json[NoteFields.pet_id] as int,
        medicine_name: json[NoteFields.medicine_name] as String,
        duration: json[NoteFields.duration] as String,
        does: json[NoteFields.does] as String,
        attime: json[NoteFields.attime] as String,
        nextdate: json[NoteFields.nextdate] as String,
        which: json[NoteFields.which] as String,
      );

  Map<String, Object?> toJson() => {
        NoteFields.id: id,
        NoteFields.pet_id: pet_id,
        NoteFields.medicine_name: medicine_name,
        NoteFields.duration: duration,
        NoteFields.does: does,
        NoteFields.attime: attime,
        NoteFields.nextdate: nextdate,
        NoteFields.which: which,
      };
}
