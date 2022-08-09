import 'package:portfolio/models/contact_details.dart';

import 'profile.dart';
import 'qualifications.dart';
import 'skills.dart';
import 'demo_projects.dart';
import 'experience.dart';
import 'industrial_projects.dart';

/// profile : {"pic_url":"","title":"","name":"","description":"hey"}
/// contact_details: {"phone_no": "", "email_address": "", "home_address": "", "coding_platforms":[{"platform_pic": "", "platform_name": "", "priority": "", "platform_url": ""}]}
/// skills : [{"pic_url":"","title":"iOS Dev","description":"","types":["UIKit","SwiftUI"]},{"pic_url":"","title":"Android Dev","description":"","types":["Components","Compose"]},{"pic_url":"","title":"Flutter Dev","description":"","types":["iOS/Android","Web"]}]
/// qualifications : [{"title":"","pic_url":"","description":"","offered_by":[{"title":"","pic_url":""}]}]
/// experience : [{"time_period":"","company_name":"","pic_url":"","description":""}]
/// industrial_projects : [{"platform":"ios","title":"","description":"","git_repo_url":"","app_url":"","packages":[""],"app_details":[{"pic_urls":[""],"description":""}]}]
/// demo_projects : [{"platform":"flutter","title":"","description":"","git_repo_url":"","app_url":"","packages":[""],"app_details":[{"pic_urls":[""],"description":""}]}]

class FirebaseData {
  Profile? profile;
  ContactDetails? contactDetails;
  List<Skills>? skills;
  List<Qualifications>? qualifications;
  List<Experience>? experience;
  List<IndustrialProjects>? industrialProjects;
  List<DemoProjects>? demoProjects;

  FirebaseData({
      this.profile,
      this.contactDetails,
      this.skills, 
      this.qualifications, 
      this.experience, 
      this.industrialProjects, 
      this.demoProjects,});

  FirebaseData.fromJson(dynamic json) {
    profile = json['profile'] != null ? Profile.fromJson(json['profile']) : null;
    if (json['skills'] != null) {
      skills = [];
      json['skills'].forEach((v) {
        skills?.add(Skills.fromJson(v));
      });
    }
    contactDetails = json['contact_details'] != null ? ContactDetails.fromJson(json['contact_details']) : null;
    if (json['qualifications'] != null) {
      qualifications = [];
      json['qualifications'].forEach((v) {
        qualifications?.add(Qualifications.fromJson(v));
      });
    }
    if (json['experience'] != null) {
      experience = [];
      json['experience'].forEach((v) {
        experience?.add(Experience.fromJson(v));
      });
    }
    if (json['industrial_projects'] != null) {
      industrialProjects = [];
      json['industrial_projects'].forEach((v) {
        industrialProjects?.add(IndustrialProjects.fromJson(v));
      });
    }
    if (json['demo_projects'] != null) {
      demoProjects = [];
      json['demo_projects'].forEach((v) {
        demoProjects?.add(DemoProjects.fromJson(v));
      });
    }
  }

}

















