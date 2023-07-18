import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:new_windows/DataLayer/WebServer/UpdateProfile_API.dart';

import '../Models/Register/UpdateProfile.dart';

class UpdateProfileRepo{
  final UpdateProfileApi updateProfileApi;
  UpdateProfileRepo(this.updateProfileApi);

  Future<UpdateProfileModel?> update({
    required String name,
    required String email,
    required String mobile,
    required String password,
    required String address,
    required File image,
    required String emergency_mobile,
    required String birthdate,
    required String gender,

  }) async {
    String fileName = image.path.split('/').last;
    final data = {
      'name': name,
      'email': email,
      'mobile': mobile,
      'password': password,
      'address': address,
      'emergency_mobile': emergency_mobile,
      'birthdate': birthdate,
      'gender': gender,
      'image':await MultipartFile.fromFile(
        image.path,
        filename:fileName,
      ),
    };
    try {
      final Response response = await updateProfileApi.update(data: data);
      log('statusCode: ' + response.statusCode.toString());
      log('response: ' + response.data.toString());
      if (response.statusCode == 200) {
        final updateProfileModel = UpdateProfileModel.fromJson(response.data);

        return updateProfileModel;
      } else {
        throw (response.data["message"]);
      }
    } catch (e) {
      throw (e);
    }
  }
}