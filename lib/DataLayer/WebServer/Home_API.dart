import 'dart:developer';
import 'package:dio/dio.dart';
import '../../constants.dart';
class HomeApi {
  Future<dynamic> getHome() async {
    Dio dio = Dio();
    dio.options.headers = {
      "language": "en",
      "api_password":"123456",
      "Content-Type": "application/json",
    };
    final response = await dio.get(
      "$baseUrl/home",
    );
    log('HomeResponse: ' + response.toString());
    return response;
  }
}
