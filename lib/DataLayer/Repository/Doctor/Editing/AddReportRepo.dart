import 'dart:developer';
import 'package:dio/dio.dart';
import '../../../Models/Doctor/Editing/AddReportModel.dart';
import '../../../WebServer/Doctor/Editing/AddReportAPI.dart';

class AddReportRepo {
  final AddReportApi addReportApi;
  AddReportRepo(this.addReportApi);

  Future<AddReportModel?> addReport({
    required String reservation_id,
    required String notes,
  }) async {
    final data = {
      'reservation_id': reservation_id,
      'notes': notes,
    };
    try {
      final Response response =
      await addReportApi.addReport(data: data);
      log('statusCode: ' + response.statusCode.toString());
      log('response: ' + response.data.toString());
      if (response.statusCode == 200) {
        final addReportModel =
        AddReportModel.fromJson(response.data);

        return addReportModel;
      } else {
        throw (response.data["message"]);
      }
    } catch (e) {
      throw (e);
    }
  }
}
