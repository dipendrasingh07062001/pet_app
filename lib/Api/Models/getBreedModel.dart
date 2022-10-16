import 'dart:convert';

// import 'package:flutter/foundation.dart';

// List<GetBreedModel> breedModelFromJson(String str) => List<GetBreedModel>.from(
//     json.decode(str).map((x) => GetBreedModel.fromJson(x)));

// String breedModelToJson(GetBreedModel data) => json.encode(data.toJson());

// class GetBreedModel {
//   String? id;
//   String? typeId;
//   String? status;
//   String? name;
//   GetBreedModel({this.id, this.typeId, this.status, this.name});
//   Map<String, dynamic> toJson() =>
//       {"id": id, "name": name, "status": status, "type_id": typeId};

//   GetBreedModel.fromJson(Map<String, dynamic> json) {
//     id = json["id"];
//     name = json["name"];
//     status = json["status"];
//     typeId = json["type_id"];
//   }
// }

// To parse this JSON data, do

//     final getBreedModel = getBreedModelFromJson(jsonString);

List<GetBreedModel> getBreedModelFromJson(String str) =>
    List<GetBreedModel>.from(
        json.decode(str).map((x) => GetBreedModel.fromJson(x)));

String getBreedModelToJson(List<GetBreedModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetBreedModel {
  GetBreedModel({
    this.id,
    this.typeId,
    this.name,
    this.status,
  });

  int? id;
  String? typeId;
  String? name;
  String? status;

  GetBreedModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    status = json["status"];
    typeId = json["type_id"];
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "type_id": typeId,
        "name": name,
        "status": status,
      };
}
