import 'dart:convert';

List<VModel> vModelFromJson(String str) =>
    List<VModel>.from(json.decode(str).map((x) => VModel.fromJson(x)));

String vModelToJson(VModel data) => json.encode(data.toJson());

class VModel {
  VModel({
    this.id,
    this.name,
    this.status,
  });

  String? id;
  String? name;
  String? status;

  VModel.fromJson(Map<String, dynamic> json) {
    id = json["id"].toString();
    name = json["name"];
    status = json["status"];
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "status": status,
      };
}
