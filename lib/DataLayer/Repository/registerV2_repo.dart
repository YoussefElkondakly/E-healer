import 'dart:developer';
import 'package:dio/dio.dart';

import '../Models/Register/RegisterV2.dart';
import '../WebServer/registerV2_API.dart';

class RegisterV2Repo {
  final RegisterV2Api registerV2Api;
  RegisterV2Repo(this.registerV2Api);

  Future<RegisterV2Model?> registerV2({
    required String emergency_mobile,
    required String birthdate,
    required String gender,

  }) async {
    final data = {
      'emergency_mobile': emergency_mobile,
      'birthdate': birthdate,
      'gender': gender,
    };
    try {
      final Response response = await registerV2Api.registerV2(data: data);
      log('statusCode: ' + response.statusCode.toString());
      log('response: ' + response.data.toString());
      if (response.statusCode == 200) {
        final registerV2Model = RegisterV2Model.fromJson(response.data);

        return registerV2Model;
      } else {
        throw (response.data["message"]);
      }
    } catch (e) {
      throw (e);
    }
  }
}
