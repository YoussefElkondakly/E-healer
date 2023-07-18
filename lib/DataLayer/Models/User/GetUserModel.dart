class GetUserModel {
  bool? status;
  String? errorNumber;
  String? message;
  Userg? user;

  GetUserModel({this.status, this.errorNumber, this.message, this.user});

  GetUserModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    errorNumber = json['errorNumber'];
    message = json['message'];
    user = json['user'] != null ? new Userg.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['errorNumber'] = this.errorNumber;
    data['message'] = this.message;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class Userg {
  int? id;
  String? name;
  String? email;
  String? address;
  String? mobile;
  String? image;
  String? userType;
  String? emergencyMobile;
  String? birthdate;
  int? age;
  int? verified;
  int? status;
  String? completedProfile;
  String? haveMedicalReport;

  Userg(
      {this.id,
        this.name,
        this.email,
        this.address,
        this.mobile,
        this.image,
        this.userType,
        this.emergencyMobile,
        this.birthdate,
        this.age,
        this.verified,
        this.status,
        this.completedProfile,
        this.haveMedicalReport});

  Userg.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    address = json['address'];
    mobile = json['mobile'];
    image = json['image'];
    userType = json['user_type'];
    emergencyMobile = json['emergency_mobile'];
    birthdate = json['birthdate'];
    age = json['age'];
    verified = json['verified'];
    status = json['status'];
    completedProfile = json['completed_profile'];
    haveMedicalReport = json['have_medical_report'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['address'] = this.address;
    data['mobile'] = this.mobile;
    data['image'] = this.image;
    data['user_type'] = this.userType;
    data['emergency_mobile'] = this.emergencyMobile;
    data['birthdate'] = this.birthdate;
    data['age'] = this.age;
    data['verified'] = this.verified;
    data['status'] = this.status;
    data['completed_profile'] = this.completedProfile;
    data['have_medical_report'] = this.haveMedicalReport;
    return data;
  }
}
