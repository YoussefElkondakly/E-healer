import 'dart:developer';
import 'package:dio/dio.dart';
import '../../constants.dart';
import '../../main.dart';

class UpdateProfileApi{

  Future<dynamic> update(
      {required Map<String,dynamic> data}) async {
    Dio dio=Dio();
    final token = await prefs.get('token');
    log('token: $token');
    final password=await pass.get('pass');
    log('the password cached is : $password');
    final headers ={

      "language":"en",
      "Content-Type":"application/json",
      "api_password":password,
      "Authorization":"Bearer $token",
    };
    log('data: ${data.toString()}');

    final response = await dio.post("$baseUrl/update-profile",
        data:FormData.fromMap(data),options: Options(headers: headers));
    log('Update Response: '+response.toString());
    return response;
  }
}