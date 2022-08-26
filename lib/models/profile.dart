/// pic_url : ""
/// title : ""
/// name : ""
/// description : "hey"

class Profile {
  String? picUrl;
  String? title;
  String? name;
  String? description;
  String? cvUrl;

  Profile({
    this.picUrl,
    this.title,
    this.name,
    this.description,
    this.cvUrl,
  });

  Profile.fromJson(dynamic json) {
    picUrl = json['pic_url'];
    title = json['title'];
    name = json['name'];
    description = json['description'];
    cvUrl = json['cv_file'];
  }

}