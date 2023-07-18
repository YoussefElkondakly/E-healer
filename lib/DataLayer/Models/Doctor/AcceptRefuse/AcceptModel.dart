class AcceptModel {
  bool? status;
  String? errorNumber;
  String? message;

  AcceptModel({this.status, this.errorNumber, this.message});

  AcceptModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    errorNumber = json['errorNumber'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['errorNumber'] = this.errorNumber;
    data['message'] = this.message;
    return data;
  }
}
