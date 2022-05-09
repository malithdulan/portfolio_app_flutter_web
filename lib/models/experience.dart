/// time_period : ""
/// company_name : ""
/// pic_url : ""
/// description : ""

class Experience {
  String? timePeriod;
  String? companyName;
  String? picUrl;
  String? description;

  Experience({
    this.timePeriod,
    this.companyName,
    this.picUrl,
    this.description,});

  Experience.fromJson(dynamic json) {
    timePeriod = json['time_period'];
    companyName = json['company_name'];
    picUrl = json['pic_url'];
    description = json['description'];
  }
}