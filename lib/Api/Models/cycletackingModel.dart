// To parse this JSON data, do
//
//     final getCycleModel = getCycleModelFromJson(jsonString);

import 'dart:convert';

GetCycleModel getCycleModelFromJson(String str) =>
    GetCycleModel.fromJson(json.decode(str));

String getCycleModelToJson(GetCycleModel data) => json.encode(data.toJson());

class GetCycleModel {
  GetCycleModel({
    this.id,
    this.petId,
    this.lastPeriodDate,
    this.lastPeriodDays,
    this.lastLongPeriodDays,
    this.currentlyPet,
    this.predictions,
    this.periodNotification,
  });

  final int? id;
  final int? petId;
  final DateTime? lastPeriodDate;
  final String? lastPeriodDays;
  final String? lastLongPeriodDays;
  final String? currentlyPet;
  final String? predictions;
  final String? periodNotification;

  factory GetCycleModel.fromJson(Map<String, dynamic> json) => GetCycleModel(
        id: json["id"],
        petId: json["pet_id"],
        lastPeriodDate: DateTime.parse(json["last_period_date"]),
        lastPeriodDays: json["last_period_days"],
        lastLongPeriodDays: json["last_long_period_days"],
        currentlyPet: json["currently_pet"],
        predictions: json["predictions"],
        periodNotification: json["period_notification"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "pet_id": petId,
        "last_period_date": lastPeriodDate!.toIso8601String(),
        "last_period_days": lastPeriodDays,
        "last_long_period_days": lastLongPeriodDays,
        "currently_pet": currentlyPet,
        "predictions": predictions,
        "period_notification": periodNotification,
      };
}
