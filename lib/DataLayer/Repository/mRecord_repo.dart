import 'dart:developer';
import 'package:dio/dio.dart';
import '../Models/medicalRecord_model.dart';
import '../WebServer/medicalRecord_API.dart';

class MRecordRepo {
  final MRecordApi mRecordApi;
  MRecordRepo(this.mRecordApi);

  Future<MedicalRecordModel?> mRecord({
    required String blood_type,
    required String pharmaceutical,
    required String chronic_diseases,
    required String notes,
  }) async {
    final data = {
      'blood_type': blood_type,
      'pharmaceutical': pharmaceutical,
      'chronic_diseases': chronic_diseases,
      'notes': notes,
    };
    try {
      final Response response = await mRecordApi.mRecord(data: data);
      log('statusCode: ' + response.statusCode.toString());
      log('response: ' + response.data.toString());
      if (response.statusCode == 200) {
        final mRecordModel = MedicalRecordModel.fromJson(response.data);

        return mRecordModel;
      } else {
        throw (response.data["message"]);
      }
    } catch (e) {
      log(e.toString());
      throw (e);
    }
  }
}
