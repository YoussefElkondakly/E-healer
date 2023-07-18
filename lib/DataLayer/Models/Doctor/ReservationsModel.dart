class ReservationsModel {
  bool? status;
  String? errorNumber;
  String? message;
  List<Userr>? user;

  ReservationsModel({this.status, this.errorNumber, this.message, this.user});

  ReservationsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    errorNumber = json['errorNumber'];
    message = json['message'];
    if (json['user'] != null) {
      user = <Userr>[];
      json['user'].forEach((v) {
        user!.add(new Userr.fromJson(v));
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

class Userr {
  int? id;
  int? userId;
  String? userName;
  String? date;
  String? notes;
  String? status;

  Userr(
      {this.id,
        this.userId,
        this.userName,
        this.date,
        this.notes,
        this.status});

  Userr.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    userName = json['user_name'];
    date = json['date'];
    notes = json['notes'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['user_name'] = this.userName;
    data['date'] = this.date;
    data['notes'] = this.notes;
    data['status'] = this.status;
    return data;
  }
}
