class UpdateMedicalRecordModel {
  bool? status;
  String? errorNumber;
  String? message;
  MedicalReport? medicalReport;

  UpdateMedicalRecordModel(
      {this.status, this.errorNumber, this.message, this.medicalReport});

  UpdateMedicalRecordModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    errorNumber = json['errorNumber'];
    message = json['message'];
    medicalReport = json['medical_report'] != null
        ? new MedicalReport.fromJson(json['medical_report'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['errorNumber'] = this.errorNumber;
    data['message'] = this.message;
    if (this.medicalReport != null) {
      data['medical_report'] = this.medicalReport!.toJson();
    }
    return data;
  }
}

class MedicalReport {
  int? id;
  int? userId;
  String? bloodType;
  String? pharmaceutical;
  String? chronicDiseases;
  String? notes;
  int? lastUpdatedBy;
  String? createdAt;
  String? updatedAt;

  MedicalReport(
      {this.id,
        this.userId,
        this.bloodType,
        this.pharmaceutical,
        this.chronicDiseases,
        this.notes,
        this.lastUpdatedBy,
        this.createdAt,
        this.updatedAt});

  MedicalReport.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    bloodType = json['blood_type'];
    pharmaceutical = json['pharmaceutical'];
    chronicDiseases = json['chronic_diseases'];
    notes = json['notes'];
    lastUpdatedBy = json['last_updated_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['blood_type'] = this.bloodType;
    data['pharmaceutical'] = this.pharmaceutical;
    data['chronic_diseases'] = this.chronicDiseases;
    data['notes'] = this.notes;
    data['last_updated_by'] = this.lastUpdatedBy;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
