import 'dart:developer';
import 'package:dio/dio.dart';
import '../../../constants.dart';
import '../../../main.dart';
class GetUserApi{

  Future<dynamic> getGetUser()
  async {
    Dio dio=Dio();
    final token = await prefs.get('token');
    log('token: $token');
    final headers ={
      "language":"en",
      "Content-Type":"application/json",
      "api_password":"123456",
      "Authorization":"Bearer $token",
    };
    final response = await dio.get("$baseUrl/user/get-user",
        options: Options(headers: headers));
    log('GetUserResponse: '+response.toString());
    return response;
  }
}