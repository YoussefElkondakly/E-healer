class UserReservationModel {
  bool? status;
  String? errorNumber;
  String? message;
  List<Userq>? user;

  UserReservationModel(
      {this.status, this.errorNumber, this.message, this.user});

  UserReservationModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    errorNumber = json['errorNumber'];
    message = json['message'];
    if (json['user'] != null) {
      user = <Userq>[];
      json['user'].forEach((v) {
        user!.add(new Userq.fromJson(v));
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

class Userq {
  int? id;
  int? doctorId;
  String? doctorName;
  String? date;
  String? notes;
  String? status;

  Userq(
      {this.id,
        this.doctorId,
        this.doctorName,
        this.date,
        this.notes,
        this.status});

  Userq.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    doctorId = json['doctor_id'];
    doctorName = json['doctor_name'];
    date = json['date'];
    notes = json['notes'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['doctor_id'] = this.doctorId;
    data['doctor_name'] = this.doctorName;
    data['date'] = this.date;
    data['notes'] = this.notes;
    data['status'] = this.status;
    return data;
  }
}
