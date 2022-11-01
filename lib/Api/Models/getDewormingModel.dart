import 'dart:convert';

GetdewormingModelList getdewormingModelListFromJson(String str) =>
    GetdewormingModelList.fromJson(json.decode(str));

String getdewormingModelListToJson(GetdewormingModelList data) =>
    json.encode(data.toJson());

class GetdewormingModelList {
  GetdewormingModelList({
    this.status,
    this.message,
    this.data,
  });

  bool? status;
  String? message;
  Data? data;

  factory GetdewormingModelList.fromJson(Map<String, dynamic> json) =>
      GetdewormingModelList(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data!.toJson(),
      };
}

class Data {
  Data({
    this.id,
    this.petId,
    this.dewormingStatus,
    this.dewormingDuration,
    this.dewormingDate,
    this.reminder,
    this.atDate,
    this.atTime,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  int? petId;
  String? dewormingStatus;
  String? dewormingDuration;
  DateTime? dewormingDate;
  String? reminder;
  DateTime? atDate;
  String? atTime;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        petId: json["pet_id"],
        dewormingStatus: json["deworming_status"],
        dewormingDuration: json["deworming_duration"],
        dewormingDate: DateTime.parse(json["deworming_date"]),
        reminder: json["reminder"],
        atDate: DateTime.parse(json["at_date"]),
        atTime: json["at_time"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "pet_id": petId,
        "deworming_status": dewormingStatus,
        "deworming_duration": dewormingDuration,
        "deworming_date": dewormingDate.toString(),
        "reminder": reminder,
        "at_date": atDate.toString(),
        "at_time": atTime,
        "created_at": createdAt.toString(),
        "updated_at": updatedAt.toString(),
      };
}
