import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';


import '../../../Models/Doctor/Registeration/UpdateProfile.dart';
import '../../../WebServer/Doctor/Registeration/UpdateProfile_API.dart';


class UpdateProfileDocRepo{
  final UpdateProfileDocApi updateProfileDocApi;
  UpdateProfileDocRepo(this.updateProfileDocApi);

  Future<UpdateProfileDocModel?> update({
    required String name,
    required String email,
    required String address,
    required String mobile,
    required File image,
    required File certificate,
    required String specialization_id,
    required String gender,


  }) async {
    String fileName = image.path.split('/').last;
    String fileNameC = certificate.path.split('/').last;

    final data = {
      'name': name,
      'email': email,
      'address': address,
      'mobile': mobile,
      'image':await MultipartFile.fromFile(
        image.path,
        filename:fileName,
      ),
      'certificate':await MultipartFile.fromFile(
        certificate.path,
        filename:fileNameC,
      ),
      'specialization_id':specialization_id,
      'gender':gender,

    };
    try {
      final Response response = await updateProfileDocApi.update(data: data);
      log('statusCode: ' + response.statusCode.toString());
      log('response: ' + response.data.toString());
      if (response.statusCode == 200) {
        final updateProfileDocModel = UpdateProfileDocModel.fromJson(response.data);

        return updateProfileDocModel;
      } else {
        throw (response.data["message"]);
      }
    } catch (e) {
      throw (e);
    }
  }
}