import 'dart:convert';

List<GetMedicineNameModel> GetMedicineNameModelFromJson(String str) =>
    List<GetMedicineNameModel>.from(
        json.decode(str).map((x) => GetMedicineNameModel.fromJson(x)));

String GetMedicineNameModelToJson(List<GetMedicineNameModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetMedicineNameModel {
  GetMedicineNameModel({
    this.id,
    this.name,
    this.status,
  });

  int? id;
  String? name;
  String? status;

  GetMedicineNameModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    status = json["status"];
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "status": status,
      };
}
