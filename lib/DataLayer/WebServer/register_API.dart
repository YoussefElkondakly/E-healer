import 'dart:developer';

import 'package:dio/dio.dart';

import '../../constants.dart';
class RegisterApi{
  Future<dynamic> register(
      {required Map<String,dynamic> data}) async {
    Dio dio=Dio();
    dio.options.headers={
      "language":"en",
      "Content-Type":"application/json",
    };
    log('data'+data.toString());
    final response = await dio.post("$baseUrl/register",
        data:FormData.fromMap(data));
    log('registerResponse: '+response.toString());
    return response;}}