// Cycle model
// class CycleTrackingModel {
//   CycleTrackingModel({
//     this.id,
//     this.lastPeriodDate,
//     this.lastPeriodDays,
//     this.lastLongPeriodDays,
//     this.currentlyPet,
//     this.predictions,
//     this.periodNotification,
//   });

//   int? id;
//   DateTime? lastPeriodDate;
//   String? lastPeriodDays;
//   String? lastLongPeriodDays;
//   String? currentlyPet;
//   String? predictions;
//   String? periodNotification;

//   factory CycleTrackingModel.fromJson(Map<String, dynamic> json) =>
//       CycleTrackingModel(
//         id: json["id"],
//         lastPeriodDate: DateTime.parse(json["last_period_date"]),
//         lastPeriodDays: json["last_period_days"],
//         lastLongPeriodDays: json["last_long_period_days"],
//         currentlyPet: json["currently_pet"],
//         predictions: json["predictions"],
//         periodNotification: json["period_notification"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "last_period_date": lastPeriodDate,
//         "last_period_days": lastPeriodDays,
//         "last_long_period_days": lastLongPeriodDays,
//         "currently_pet": currentlyPet,
//         "predictions": predictions,
//         "period_notification": periodNotification,
//       };
// }

class CycleModel {
  CycleModel({
    this.date,
    this.id = "",
    this.is_add = 0,
    this.iscycle = false,
    this.period = "",
    this.spotting = "",
    this.symptoms = "",
  });
  DateTime? date = DateTime.now();
  bool iscycle = false;
  String period = "";
  String id = "";
  String symptoms = "";
  String spotting = "";
  int is_add = 0;
}
