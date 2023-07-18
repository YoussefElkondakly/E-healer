import 'dart:developer';

import 'package:dio/dio.dart';


import '../../constants.dart';

class LoginApi{

  Future<dynamic> login({required Map<String,dynamic> data}) async {
    Dio dio=Dio();
    dio.options.headers={
      "language":"en",
      "Content-Type":"application/json",
    };
    final response = await dio.post("$baseUrl/login",
    data:data);
    log('loginResponse: '+response.toString());
    return response;
  }
}