import 'dart:developer';

import 'package:dio/dio.dart';


import '../../../constants.dart';
import '../../../main.dart';


class ReservationsApi{

  Future<dynamic> getReservations()
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
    final response = await dio.get("$baseUrl/user/doctor-reservations",
        options: Options(headers: headers));
    log('ReservationsResponse: '+response.toString());
    return response;
  }
}