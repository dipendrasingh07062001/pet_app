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

List<VaccinationReminder> vaccinationReminderFromJson(String str) =>
    List<VaccinationReminder>.from(
        json.decode(str).map((x) => VaccinationReminder.fromJson(x)));

String vaccinationReminderToJson(List<VaccinationReminder> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class VaccinationReminder {
  VaccinationReminder({
    this.id,
    this.userId,
    this.petId,
    this.vaccinationId,
    this.vaccinationStatus,
    this.vaccinationDate,
    this.vaccinationCertificatee,
    this.reminder,
    this.atTime,
    this.atDate,
    this.dose,
    this.nextdose,
  });

  final int? id;
  final int? userId;
  final int? petId;
  final String? vaccinationId;
  final String? vaccinationStatus;
  final dynamic vaccinationDate;
  final String? vaccinationCertificatee;
  final String? reminder;
  final String? atTime;
  final DateTime? atDate;
  final String? dose;
  final DateTime? nextdose;

  factory VaccinationReminder.fromJson(Map<String, dynamic> json) =>
      VaccinationReminder(
        id: json["id"],
        userId: json["user_id"],
        petId: json["pet_id"],
        vaccinationId: json["vaccination_id"],
        vaccinationStatus: json["vaccination_status"],
        vaccinationDate: json["vaccination_date"],
        vaccinationCertificatee: json["vaccination_certificatee"],
        reminder: json["reminder"],
        atTime: json["at_time"],
        atDate: DateTime.parse(json["at_date"]),
        dose: json["dose"],
        nextdose: DateTime.parse(json["nextdose"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "pet_id": petId,
        "vaccination_id": vaccinationId,
        "vaccination_status": vaccinationStatus,
        "vaccination_date": vaccinationDate,
        "vaccination_certificatee": vaccinationCertificatee,
        "reminder": reminder,
        "at_time": atTime,
        "at_date":
            "${atDate!.year.toString().padLeft(4, '0')}-${atDate!.month.toString().padLeft(2, '0')}-${atDate?.day.toString().padLeft(2, '0')}",
        "dose": dose,
        "nextdose":
            "${nextdose!.year.toString().padLeft(4, '0')}-${nextdose!.month.toString().padLeft(2, '0')}-${nextdose?.day.toString().padLeft(2, '0')}",
      };
}
