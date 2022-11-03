import 'dart:convert';

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
