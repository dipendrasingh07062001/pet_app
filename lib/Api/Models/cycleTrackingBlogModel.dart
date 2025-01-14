import '../../Screens/CycleTrackingPageViewBuilder/cycleTrackingBlog.dart';
import 'blogModel.dart';

class CycleTackingBlogModel {
  bool? status;
  String? message;
  List<BlogModelList>? cycleTrackingblogListdata;

  CycleTackingBlogModel(
      {this.status, this.message, this.cycleTrackingblogListdata});

  factory CycleTackingBlogModel.fromjson(Map<String, dynamic> json) =>
      CycleTackingBlogModel(
        status: json["status"],
        message: json["message"],
        cycleTrackingblogListdata: List<BlogModelList>.from(
            json["data"].map((x) => BlogModelList.fromjson(x))),
      );
}

// class CycleTrackingBlogModelList {
//   String? name;
//   String? image;
//   int? id;
//   String? description;
//   String? status;

//   CycleTrackingBlogModelList(
//       {this.name, this.image, this.id, this.status, this.description});

//   factory CycleTrackingBlogModelList.fromjson(Map<String, dynamic> json) =>
//       CycleTrackingBlogModelList(
//           name: json["name"] ?? "",
//           image: json["image"] ?? "",
//           id: json['id'],
//           status: json['status'],
//           description: json['description']);
// }
