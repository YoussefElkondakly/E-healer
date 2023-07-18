class HomeModel {
  bool? status;
  String? errorNumber;
  String? message;
  HomeData? data;
  HomeModel({this.status, this.errorNumber, this.message, this.data});
  HomeModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    errorNumber = json['errorNumber'];
    message = json['message'];
    data = json['data'] != null ? new HomeData.fromJson(json['data']) : null;
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['errorNumber'] = this.errorNumber;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}
class HomeData {
  List<Specializations>? specializations;
  List<Doctors>? doctors;
  HomeData({this.specializations, this.doctors});
  HomeData.fromJson(Map<String, dynamic> json) {
    if (json['specializations'] != null) {
      specializations = <Specializations>[];
      json['specializations'].forEach((v) {
        specializations!.add(new Specializations.fromJson(v));
      });
    }
    if (json['doctors'] != null) {
      doctors = <Doctors>[];
      json['doctors'].forEach((v) {
        doctors!.add(new Doctors.fromJson(v));
      });
    }
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.specializations != null) {
      data['specializations'] =
          this.specializations!.map((v) => v.toJson()).toList();
    }
    if (this.doctors != null) {
      data['doctors'] = this.doctors!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
class Specializations {
  int? id;
  String? title;
  Specializations({this.id, this.title});
  Specializations.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    return data;
  }
}
class Doctors {
  int? id;
  String? name;
  String? gender;
  String? certificate;
  int? specializationId;
  String? specializationName;
  Doctors(
      {this.id,
      this.name,
      this.gender,
      this.certificate,
      this.specializationId,
      this.specializationName});
  Doctors.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    gender = json['gender'];
    certificate = json['certificate'];
    specializationId = json['specialization_id'];
    specializationName = json['specialization_name'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['gender'] = this.gender;
    data['certificate'] = this.certificate;
    data['specialization_id'] = this.specializationId;
    data['specialization_name'] = this.specializationName;
    return data;
  }
}
