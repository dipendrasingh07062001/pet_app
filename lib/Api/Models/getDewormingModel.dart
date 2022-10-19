class GetDewomingModel {
  bool? status;
  String? message;
  List<GetDewormingModelList>? getdewormingdata;

  GetDewomingModel({this.status, this.message, this.getdewormingdata});

  factory GetDewomingModel.fromjson(Map<String, dynamic> json) =>
      GetDewomingModel(
        status: json["status"],
        message: json["message"],
        getdewormingdata: List<GetDewormingModelList>.from(
            json["data"].map((x) => GetDewormingModelList.fromjson(x))),
      );
}

class GetDewormingModelList {
  String? id;
  String? petId;
  String? dewormingStatus;
  String? dewormingDuration;
  String? dewormingDate;
  String? reminder;
  String? atDate;
  String? atTime;

  GetDewormingModelList(
      {this.id,
      this.petId,
      this.dewormingStatus,
      this.dewormingDuration,
      this.dewormingDate,
      this.atDate,
      this.atTime,
      this.reminder});

  factory GetDewormingModelList.fromjson(Map<String, dynamic> json) =>
      GetDewormingModelList(
          id: json['id'],
          petId: json['pet_id'],
          dewormingStatus: json['deworming_status'],
          dewormingDuration: json['deworming_duration'],
          dewormingDate: json['deworming_date'],
          reminder: json['reminder'],
          atDate: json['at_date'],
          atTime: json['at_time']);
}
