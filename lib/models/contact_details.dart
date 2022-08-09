import 'coding_platform.dart';

/// phone_no : ""
/// email_address: ""
/// home_address: ""
/// coding_platforms : [{"platform_pic":"","platform_name":"","priority":"","platform_url":""}]

class ContactDetails {
  String? phoneNo;
  String? emailAddress;
  String? homeAddress;
  List<CodingPlatform>? codingPlatforms;

  ContactDetails({
    this.phoneNo,
    this.emailAddress,
    this.homeAddress,
    this.codingPlatforms,
  });

  ContactDetails.fromJson(dynamic json) {
    phoneNo = json["phone_no"];
    emailAddress = json["email_address"];
    homeAddress = json["home_address"];
    if (json['coding_platforms'] != null) {
      codingPlatforms = [];
      json['coding_platforms'].forEach((v) {
        codingPlatforms?.add(CodingPlatform.fromJson(v));
      });
    }
  }

}