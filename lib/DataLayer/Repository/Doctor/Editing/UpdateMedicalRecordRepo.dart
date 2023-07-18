import 'dart:developer';
import 'package:dio/dio.dart';
import '../../../Models/Doctor/Editing/UpdateMedicalRecordModel.dart';
import '../../../WebServer/Doctor/Editing/UpdateMedicalRecordAPI.dart';

class UpdateMedicalRecordRepo {
  final UpdateMedicalRecordApi updateMedicalRecordApi;
  UpdateMedicalRecordRepo(this.updateMedicalRecordApi);

  Future<UpdateMedicalRecordModel?> updateMedicalRecord({
    required String id,
    required String blood_type,
    required String pharmaceutical,
    required String chronic_diseases,
    required String notes,
  }) async {
    final data = {
      'id': id,
      'blood_type': blood_type,
      'pharmaceutical': pharmaceutical,
      'chronic_diseases': chronic_diseases,
      'notes': notes,
    };
    try {
      final Response response =
          await updateMedicalRecordApi.updateMedicalRecord(data: data);
      log('statusCode: ' + response.statusCode.toString());
      log('response: ' + response.data.toString());
      if (response.statusCode == 200) {
        final updateMedicalRecordModel =
            UpdateMedicalRecordModel.fromJson(response.data);

        return updateMedicalRecordModel;
      } else {
        throw (response.data["message"]);
      }
    } catch (e) {
      throw (e);
    }
  }
}
