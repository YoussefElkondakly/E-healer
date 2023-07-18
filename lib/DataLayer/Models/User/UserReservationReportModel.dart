class UserReservationReportModel {
  bool? status;
  String? errorNumber;
  String? message;
  List<User>? user;

  UserReservationReportModel(
      {this.status, this.errorNumber, this.message, this.user});

  UserReservationReportModel.fromJson(Map<String, dynamic> json) {
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
  int? doctorId;
  String? doctorName;
  String? notes;

  User({this.id, this.doctorId, this.doctorName, this.notes});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    doctorId = json['doctor_id'];
    doctorName = json['doctor_name'];
    notes = json['notes'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['doctor_id'] = this.doctorId;
    data['doctor_name'] = this.doctorName;
    data['notes'] = this.notes;
    return data;
  }
}
