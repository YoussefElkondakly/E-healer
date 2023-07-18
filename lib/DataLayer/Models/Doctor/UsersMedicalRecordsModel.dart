class UsersMedicalRecordsModel {
  bool? status;
  String? errorNumber;
  String? message;
  List<User>? user;

  UsersMedicalRecordsModel(
      {this.status, this.errorNumber, this.message, this.user});

  UsersMedicalRecordsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    errorNumber = json['errorNumber'];
    message = json['message'];
    if (json['user'] != null) {
      user = <User>[];
      json['user'].forEach((v) {
        user!.add(new User.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['errorNumber'] = this.errorNumber;
    data['message'] = this.message;
    if (this.user != null) {
      data['user'] = this.user!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class User {
  int? id;
  String? bloodType;
  String? pharmaceutical;
  String? chronicDiseases;
  String? notes;

  User(
      {this.id,
        this.bloodType,
        this.pharmaceutical,
        this.chronicDiseases,
        this.notes});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bloodType = json['blood_type'];
    pharmaceutical = json['pharmaceutical'];
    chronicDiseases = json['chronic_diseases'];
    notes = json['notes'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['blood_type'] = this.bloodType;
    data['pharmaceutical'] = this.pharmaceutical;
    data['chronic_diseases'] = this.chronicDiseases;
    data['notes'] = this.notes;
    return data;
  }
}
