import 'package:pet_app/Api/Models/v_model.dart';

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
  List<String>? vaccinationcertificate;
  VModel? vaccinationid;
  List<String>? vaccinationdate;
  String? reminder;
  String? vaccinationstatus;
  String? atdate;
  String? attime;
  String? dose;

  VaccinationMaodelList({
    this.id,
    this.vaccinationcertificate = const [],
    this.vaccinationid,
    this.vaccinationdate = const [],
    this.reminder,
    this.vaccinationstatus,
    this.atdate,
    this.attime,
    this.dose,
  });

  factory VaccinationMaodelList.fromjson(Map<String, dynamic> json) =>
      VaccinationMaodelList(
        id: json["id"] ?? "",
        dose: json["dose"] ?? "",
        vaccinationcertificate: json["vaccination_certificatee"] == null
            ? []
            : List<String>.from(
                json["vaccination_certificatee"]!.map((x) => x)),
        vaccinationid: VModel.fromJson(json["vaccination_id"]),
        vaccinationdate: json["vaccination_date"] == null
            ? []
            : List<String>.from(json["vaccination_date"]!.map((x) => x)),
        reminder: json['reminder'],
        vaccinationstatus: json['vaccination_status'],
        atdate: json['at_date'],
        attime: json['at_time'],
      );
}
