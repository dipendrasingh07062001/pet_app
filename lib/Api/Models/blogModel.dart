class BlogModel {
  bool? status;
  String? message;
  List<BlogModelList>? blogListdata;

  BlogModel({this.status, this.message, this.blogListdata});

  factory BlogModel.fromjson(Map<String, dynamic> json) => BlogModel(
        status: json["status"],
        message: json["message"],
        blogListdata: List<BlogModelList>.from(
            json["data"].map((x) => BlogModelList.fromjson(x))),
      );
}

class BlogModelList {
  String? name;
  String? image;
  int? id;
  String? description;
  String? status;

  BlogModelList(
      {this.name, this.image, this.id, this.status, this.description});

  factory BlogModelList.fromjson(Map<String, dynamic> json) => BlogModelList(
      name: json["name"] ?? "",
      image: json["image"] ?? "",
      id: json['id'],
      status: json['status'],
      description: json['description']);
}
