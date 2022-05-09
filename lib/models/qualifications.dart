import 'offered_by.dart';

/// title : ""
/// pic_url : ""
/// description : ""
/// offered_by : [{"title":"","pic_url":""}]

class Qualifications {
  String? title;
  String? picUrl;
  String? description;
  List<OfferedBy>? offeredBy;

  Qualifications({
    this.title,
    this.picUrl,
    this.description,
    this.offeredBy,});

  Qualifications.fromJson(dynamic json) {
    title = json['title'];
    picUrl = json['pic_url'];
    description = json['description'];
    if (json['offered_by'] != null) {
      offeredBy = [];
      json['offered_by'].forEach((v) {
        offeredBy?.add(OfferedBy.fromJson(v));
      });
    }
  }

}