class VaccinationMaodel {
  bool? status;
  String? message;
  List<VaccinationMaodelList>? vaccinationModeldata;

  VaccinationMaodel({this.status, this.message, this.vaccinationModeldata});

  factory VaccinationMaodel.fromjson(Map<String, dynamic> json) =>
      VaccinationMaodel(
        status: json["status"],
        message: json["message"],
        vaccinationModeldata: List<VaccinationMaodelList>.from(
            json["data"].map((x) => VaccinationMaodelList.fromjson(x))),
      );
}

class VaccinationMaodelList {
  int? id;
  String? vaccinationcertificate;
  String? vaccinationid;
  String? vaccinationdate;
  String? reminder;
  String? vaccinationstatus;
  String? atdate;
  String? attime;

  VaccinationMaodelList({
    this.id,
    this.vaccinationcertificate,
    this.vaccinationid,
    this.vaccinationdate,
    this.reminder,
    this.vaccinationstatus,
    this.atdate,
    this.attime,
  });

  factory VaccinationMaodelList.fromjson(Map<String, dynamic> json) =>
      VaccinationMaodelList(
          id: json["id"] ?? "",
          vaccinationcertificate: json['vaccination_certificatee'],
          vaccinationid: json["vaccination_id"] ?? "",
          vaccinationdate: json['vaccination_date'],
          reminder: json['reminder'],
          vaccinationstatus: json['vaccination_status'],
          atdate: json['at_date'],
          attime: json['at_time']);
}
