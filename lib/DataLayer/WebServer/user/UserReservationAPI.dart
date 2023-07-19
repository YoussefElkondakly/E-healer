import 'dart:developer';

import 'package:dio/dio.dart';


import '../../../constants.dart';
import '../../../main.dart';


class UserReservationApi{

  Future<dynamic> getUserReservation()
  async {
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
    final response = await dio.get("$baseUrl/user/user-reservations",
        options: Options(headers: headers));
    log('UserReservationResponse: '+response.toString());
    return response;
  }
}