import 'app_details.dart';

/// platform : "flutter"
/// title : ""
/// description : ""
/// app_icon_url: ""
/// git_repo_url : ""
/// app_url : ""
/// app_video_url: ""
/// app_file: ""
/// packages : [""]
/// app_details : [{"pic_urls":[""],"description":""}]

class DemoProjects {
  String? platform;
  String? title;
  String? description;
  String? appIconUrl;
  String? gitRepoUrl;
  String? appUrl;
  String? appVideoUrl;
  String? appFile;
  List<String>? packages;
  List<AppDetails>? appDetails;

  DemoProjects({
    this.platform,
    this.title,
    this.description,
    this.appIconUrl,
    this.gitRepoUrl,
    this.appUrl,
    this.appVideoUrl,
    this.appFile,
    this.packages,
    this.appDetails,});

  DemoProjects.fromJson(dynamic json) {
    platform = json['platform'];
    title = json['title'];
    description = json['description'];
    appIconUrl = json['app_icon_url'];
    gitRepoUrl = json['git_repo_url'];
    appUrl = json['app_url'];
    appVideoUrl = json['app_video_url'];
    appFile = json['app_file'];
    packages = json['packages'] != null ? json['packages'].cast<String>() : [];
    if (json['app_details'] != null) {
      appDetails = [];
      json['app_details'].forEach((v) {
        appDetails?.add(AppDetails.fromJson(v));
      });
    }
  }

}