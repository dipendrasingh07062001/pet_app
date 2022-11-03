class GetMedicineModel {
  bool? status;
  String? message;
  List<GetMidecineModelList>? getMedicinemodelListdata;

  GetMedicineModel({this.status, this.message, this.getMedicinemodelListdata});

  factory GetMedicineModel.fromjson(Map<String, dynamic> json) =>
      GetMedicineModel(
        status: json["status"],
        message: json["message"],
        getMedicinemodelListdata: List<GetMidecineModelList>.from(
            json["data"].map((x) => GetMidecineModelList.fromjson(x))),
      );
}

class GetMidecineModelList {
  int? id;
  String? name;
  String? duration;
  String? does;
  String? startDate;
  String? endDate;
  String? reminder;
  String? atTime;

  GetMidecineModelList(
      {this.id,
      this.name,
      this.duration,
      this.does,
      this.startDate,
      this.endDate,
      this.atTime,
      this.reminder});

  factory GetMidecineModelList.fromjson(Map<String, dynamic> json) =>
      GetMidecineModelList(
          name: json["medicine_name"] ?? "",
          id: json["id"] ?? "",
          duration: json['duration'],
          does: json['does'],
          startDate: json['course_start_date'],
          endDate: json['course_end_date'],
          atTime: json['at_time'],
          reminder: json['reminder']);
}
