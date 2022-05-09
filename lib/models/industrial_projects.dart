import 'app_details.dart';

/// platform : "ios"
/// title : ""
/// description : ""
/// git_repo_url : ""
/// app_url : ""
/// packages : [""]
/// app_details : [{"pic_urls":[""],"description":""}]

class IndustrialProjects {
  String? platform;
  String? title;
  String? description;
  String? gitRepoUrl;
  String? appUrl;
  List<String>? packages;
  List<AppDetails>? appDetails;

  IndustrialProjects({
    this.platform,
    this.title,
    this.description,
    this.gitRepoUrl,
    this.appUrl,
    this.packages,
    this.appDetails,});

  IndustrialProjects.fromJson(dynamic json) {
    platform = json['platform'];
    title = json['title'];
    description = json['description'];
    gitRepoUrl = json['git_repo_url'];
    appUrl = json['app_url'];
    packages = json['packages'] != null ? json['packages'].cast<String>() : [];
    if (json['app_details'] != null) {
      appDetails = [];
      json['app_details'].forEach((v) {
        appDetails?.add(AppDetails.fromJson(v));
      });
    }
  }

}