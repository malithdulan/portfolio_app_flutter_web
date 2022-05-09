/// pic_urls : [""]
/// description : ""

class AppDetails {
  List<String>? picUrls;
  String? description;

  AppDetails({
    this.picUrls,
    this.description,});

  AppDetails.fromJson(dynamic json) {
    picUrls = json['pic_urls'] != null ? json['pic_urls'].cast<String>() : [];
    description = json['description'];
  }
}