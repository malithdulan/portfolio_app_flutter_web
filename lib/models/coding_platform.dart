/// platform_pic : ""
/// platform_name : ""
/// priority : ""
/// platform_url: ""

class CodingPlatform {
  String? platformPic;
  String? platformName;
  String? priority;
  String? platformUrl;

  CodingPlatform({
    this.platformPic,
    this.platformName,
    this.priority,
    this.platformUrl,
  });

  CodingPlatform.fromJson(dynamic json) {
    platformPic = json['platform_pic'];
    platformName = json['platform_name'];
    priority = json['priority'];
    platformUrl = json['platform_url'];
  }

}