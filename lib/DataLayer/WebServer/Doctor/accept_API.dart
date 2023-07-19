import 'dart:developer';

import 'package:dio/dio.dart';
import '../../../constants.dart';
import '../../../main.dart';


class AcceptApi{

  Future<dynamic> getAccept({required Map<String,dynamic> data})
  async {
    Dio dio=Dio();
    final token = await prefs.get('token');
    log('token: $token');
    log('IdKey: $data');
    final password=await pass.get('pass');
    log('the password cached is : $password');
    final headers ={

      "language":"en",
      "Content-Type":"application/json",
      "api_password":password,
      "Authorization":"Bearer $token",
    };
    final response = await dio.get("$baseUrl/user/accept-reservation/${data.values.single}",
        options: Options(headers: headers));
    log('$baseUrl ${data.values.single}');
    log('AcceptResponse: '+response.toString());
    return response;
  }
}