/// title : ""
/// pic_url : ""

class OfferedBy {
  String? title;
  String? picUrl;

  OfferedBy({
    this.title,
    this.picUrl,});

  OfferedBy.fromJson(dynamic json) {
    title = json['title'];
    picUrl = json['pic_url'];
  }

}