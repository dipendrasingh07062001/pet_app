import 'getBreedModel.dart';

List<MypetListdata> mypetmoellist = [];

class MyPetModel {
  bool? status;
  String? message;
  List<MypetListdata>? mypetdata;
  MyPetModel({this.status, this.message, this.mypetdata});
  factory MyPetModel.fromjson(Map<String, dynamic> json) => MyPetModel(
        status: json["status"],
        message: json["message"],
        mypetdata: List<MypetListdata>.from(
            json["data"].map((x) => MypetListdata.fromjson(x))),
      );
}

class MypetListdata {
  String? name;
  List<String> image = [];
  int? id;
  String? type;
  String? parentname;
  GetBreedModel? breed;
  String? gendar;
  String? weight;
  String? dob;
  String? uploaddocument;
  String? cycle_tracking_status;

  MypetListdata({
    this.name,
    this.image = const [],
    this.id,
    this.type,
    this.parentname,
    this.breed,
    this.gendar,
    this.weight,
    this.uploaddocument,
    this.dob,
    this.cycle_tracking_status,
  });
  factory MypetListdata.fromjson(Map<String, dynamic> json) => MypetListdata(
      name: json["name"] ?? "",
      image: json["image"] == null
          ? []
          : List<String>.from(
              json["image"].map((x) => x)), // json["image"] ?? [],
      cycle_tracking_status: json["cycle_tracking_status"] ?? "",
      id: json['id'],
      type: json['type'],
      parentname: json['parent_name'],
      breed: json["my_breed"] == null || json["my_breed"] == ""
          ? null
          : GetBreedModel.fromJson(json["my_breed"]),
      gendar: json['gendar'],
      weight: json['weight'],
      dob: json['dob'],
      uploaddocument: json['upload_document']);
}
