class RegisterV2Model {
  bool? status;
  String? errorNumber;
  String? message;
  User? user;

  RegisterV2Model({this.status, this.errorNumber, this.message, this.user});

  RegisterV2Model.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    errorNumber = json['errorNumber'];
    message = json['message'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
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

class User {
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
  String? certificate;
  Null? specializationId;
  Null? gender;
  Null? deviceToken;
  int? verified;
  int? status;
  Null? emailVerifiedAt;
  String? createdAt;
  String? updatedAt;
  String? completedProfile;
  String? haveMedicalReport;

  User(
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
        this.certificate,
        this.specializationId,
        this.gender,
        this.deviceToken,
        this.verified,
        this.status,
        this.emailVerifiedAt,
        this.createdAt,
        this.updatedAt,
        this.completedProfile,
        this.haveMedicalReport});

  User.fromJson(Map<String, dynamic> json) {
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
    certificate = json['certificate'];
    specializationId = json['specialization_id'];
    gender = json['gender'];
    deviceToken = json['device_token'];
    verified = json['verified'];
    status = json['status'];
    emailVerifiedAt = json['email_verified_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
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
    data['certificate'] = this.certificate;
    data['specialization_id'] = this.specializationId;
    data['gender'] = this.gender;
    data['device_token'] = this.deviceToken;
    data['verified'] = this.verified;
    data['status'] = this.status;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['completed_profile'] = this.completedProfile;
    data['have_medical_report'] = this.haveMedicalReport;
    return data;
  }
}
