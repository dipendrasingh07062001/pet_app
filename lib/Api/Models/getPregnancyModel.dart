import 'dart:convert';

GetPregnancyModel getPregnancyModelFromJson(String str) =>
    GetPregnancyModel.fromJson(json.decode(str));

String getPregnancyModelToJson(GetPregnancyModel data) =>
    json.encode(data.toJson());

class GetPregnancyModel {
  GetPregnancyModel({
    this.status,
    this.message,
    this.data,
  });

  bool? status;
  String? message;
  GetPregnancyListData? data;

  factory GetPregnancyModel.fromJson(Map<String, dynamic> json) =>
      GetPregnancyModel(
        status: json["status"],
        message: json["message"],
        data: GetPregnancyListData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data,
      };
}

class GetPregnancyListData {
  GetPregnancyListData({
    this.id,
    this.petId,
    this.sexuallyActive,
    this.pastPregnancy,
    this.previousLitter,
    this.neutered,
    this.reminder,
    this.atTime,
    this.atDate,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  int? petId;
  String? sexuallyActive;
  String? pastPregnancy;
  String? previousLitter;
  String? neutered;
  String? reminder;
  String? atTime;
  String? atDate;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory GetPregnancyListData.fromJson(Map<String, dynamic> json) =>
      GetPregnancyListData(
        id: json["id"],
        petId: json["pet_id"],
        sexuallyActive: json["sexually_active"],
        pastPregnancy: json["past_pregnancy"],
        previousLitter: json["previous_litter"],
        neutered: json["neutered"],
        reminder: json["reminder"],
        atTime: json["at_time"],
        atDate: json["at_date"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "pet_id": petId,
        "sexually_active": sexuallyActive,
        "past_pregnancy": pastPregnancy,
        "previous_litter": previousLitter,
        "neutered": neutered,
        "reminder": reminder,
        "at_time": atTime,
        "at_date": atDate,
        "created_at": createdAt.toString(),
        "updated_at": updatedAt.toString(),
      };
}
