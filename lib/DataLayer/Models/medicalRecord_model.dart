class MedicalRecordModel {
  bool? status;
  String? errorNumber;
  String? message;
  UserRecord? user;

  MedicalRecordModel({this.status, this.errorNumber, this.message, this.user});

  MedicalRecordModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    errorNumber = json['errorNumber'];
    message = json['message'];
    user = json['user'] != null ? new UserRecord.fromJson(json['user']) : null;
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

class UserRecord {
  String? bloodType;
  String? pharmaceutical;
  String? chronicDiseases;
  String? notes;
  int? userId;
  String? updatedAt;
  String? createdAt;
  int? id;

  UserRecord(
      {this.bloodType,
        this.pharmaceutical,
        this.chronicDiseases,
        this.notes,
        this.userId,
        this.updatedAt,
        this.createdAt,
        this.id});

  UserRecord.fromJson(Map<String, dynamic> json) {
    bloodType = json['blood_type'];
    pharmaceutical = json['pharmaceutical'];
    chronicDiseases = json['chronic_diseases'];
    notes = json['notes'];
    userId = json['user_id'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['blood_type'] = this.bloodType;
    data['pharmaceutical'] = this.pharmaceutical;
    data['chronic_diseases'] = this.chronicDiseases;
    data['notes'] = this.notes;
    data['user_id'] = this.userId;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}
