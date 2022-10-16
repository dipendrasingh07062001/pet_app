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
  String? image;
  int? id;
  String? type;
  String? parentname;
  String? breed;
  String? gendar;
  String? weight;
  String? dob;
  String? uploaddocument;

  MypetListdata(
      {this.name,
      this.image,
      this.id,
      this.type,
      this.parentname,
      this.breed,
      this.gendar,
      this.weight,
      this.uploaddocument,
      this.dob});
  factory MypetListdata.fromjson(Map<String, dynamic> json) => MypetListdata(
      name: json["name"] ?? "",
      image: json["image"] ?? "",
      id: json['id'],
      type: json['type'],
      parentname: json['parent_name'],
      breed: json['breed'],
      gendar: json['gendar'],
      weight: json['weight'],
      dob: json['dob'],
      uploaddocument: json['upload_document']);
}
