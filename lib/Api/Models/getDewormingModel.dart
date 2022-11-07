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
  });

  int? id;
  int? petId;
  String? dewormingStatus;
  String? dewormingDuration;
  String? dewormingDate;
  String? reminder;
  String? atDate;
  String? atTime;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        petId: json["pet_id"],
        dewormingStatus: json["deworming_status"],
        dewormingDuration: json["deworming_duration"],
        dewormingDate: json["deworming_date"],
        reminder: json["reminder"],
        atDate: json["at_date"],
        atTime: json["at_time"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "pet_id": petId,
        "deworming_status": dewormingStatus,
        "deworming_duration": dewormingDuration,
        "deworming_date": dewormingDate,
        "reminder": reminder.toString(),
        "at_date": atDate.toString(),
        "at_time": atTime,
      };
}
