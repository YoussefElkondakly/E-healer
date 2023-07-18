import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import '../Models/Register/Register.dart';
import '../WebServer/register_API.dart';
class RegisterRepo {
  final RegisterApi registerApi;
  RegisterRepo(this.registerApi);
  Future<RegisterModel?> register({
    required String namee,
    required String email,
    required String mobile,
    required String password,
    required String password_confirmation,
    required String user_type,
    required String address,
    required File image,
  }) async {
    String fileName = image.path.split('/').last;
    final data = {
      'name': namee,
      'email': email,
      'mobile': mobile,
      'password': password,
      'password_confirmation': password_confirmation,
      'user_type': user_type,
      'address': address,
      'image': await MultipartFile.fromFile(
        image.path,
        filename:fileName,
      ),
    };
    try {
      final Response response = await registerApi.register(data: data);
      log('statusCode: ' + response.statusCode.toString());
      log('response: ' + response.data.toString());
      if (response.statusCode == 200) {
        final registerModel = RegisterModel.fromJson(response.data);

        return registerModel;
      } else {
        throw (response.data["message"]);
      }
    } catch (e) {
      throw (e);
    }}}
