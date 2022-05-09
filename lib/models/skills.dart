/// pic_url : ""
/// title : "iOS Dev"
/// description : ""
/// types : ["UIKit","SwiftUI"]

class Skills {
  String? picUrl;
  String? title;
  String? description;
  List<String>? types;

  Skills({
    this.picUrl,
    this.title,
    this.description,
    this.types,});

  Skills.fromJson(dynamic json) {
    picUrl = json['pic_url'];
    title = json['title'];
    description = json['description'];
    types = json['types'] != null ? json['types'].cast<String>() : [];
  }

}