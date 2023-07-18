class ReservationModel {
  bool? status;
  String? errorNumber;
  String? message;
  User? user;

  ReservationModel({this.status, this.errorNumber, this.message, this.user});

  ReservationModel.fromJson(Map<String, dynamic> json) {
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
  String? doctorId;
  String? date;
  String? notes;
  int? userId;
  String? status;
  String? updatedAt;
  String? createdAt;
  int? id;

  User(
      {this.doctorId,
        this.date,
        this.notes,
        this.userId,
        this.status,
        this.updatedAt,
        this.createdAt,
        this.id});

  User.fromJson(Map<String, dynamic> json) {
    doctorId = json['doctor_id'];
    date = json['date'];
    notes = json['notes'];
    userId = json['user_id'];
    status = json['status'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['doctor_id'] = this.doctorId;
    data['date'] = this.date;
    data['notes'] = this.notes;
    data['user_id'] = this.userId;
    data['status'] = this.status;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}
