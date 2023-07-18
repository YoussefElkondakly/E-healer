class AddReportModel {
  bool? status;
  String? errorNumber;
  String? message;
  Report? report;
  AddReportModel({this.status, this.errorNumber, this.message,this.report});

  AddReportModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    errorNumber = json['errorNumber'];
    message = json['message'];
    report = json['report'] != null
        ? new Report.fromJson(json['report'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['errorNumber'] = this.errorNumber;
    data['message'] = this.message;
    if (this.report != null) {
      data['report'] = this.report!.toJson();
    }
    return data;
  }
}
class Report {
  int? userId;
  String? notes;

  Report(
      {
        this.userId,
        this.notes,
        });

  Report.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    notes = json['notes'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['notes'] = this.notes;
    return data;
  }
}