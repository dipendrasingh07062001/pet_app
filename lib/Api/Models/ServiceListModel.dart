class ServiceModel {
  bool? status;
  String? message;
  List<ServiceListModel>? serviceListdata;

  ServiceModel({this.status, this.message, this.serviceListdata});

  factory ServiceModel.fromjson(Map<String, dynamic> json) => ServiceModel(
        status: json["status"],
        message: json["message"],
        serviceListdata: List<ServiceListModel>.from(
            json["data"].map((x) => ServiceListModel.fromjson(x))),
      );
}

class ServiceListModel {
  String? name;
  String? image;
  int? id;
  int? status;
  List<SubServiceListModel>? subserviceListdata;
  ServiceListModel({
    this.name,
    this.image,
    this.id,
    this.status,
    this.subserviceListdata,
  });

  factory ServiceListModel.fromjson(Map<String, dynamic> json) =>
      ServiceListModel(
        name: json["name"] ?? "",
        image: json["image"] ?? "",
        id: json['id'],
        status: json['status'],
        subserviceListdata: List<SubServiceListModel>.from(
            json["item"].map((x) => SubServiceListModel.fromjson(x))),
      );
}

class SubServiceListModel {
  String? name;
  String? image;
  int? id;
  int? status;
  int? servive_id;
  SubServiceListModel(
      {this.name, this.image, this.id, this.status, this.servive_id});

  factory SubServiceListModel.fromjson(Map<String, dynamic> json) =>
      SubServiceListModel(
          name: json["name"] ?? "",
          image: json["image"] ?? "",
          id: json['id'] ?? "",
          status: json['status'] ?? "",
          servive_id: json['service_id']);
}
