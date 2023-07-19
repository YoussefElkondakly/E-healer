import 'dart:developer';
import 'package:dio/dio.dart';
import '../../constants.dart';
import '../../main.dart';
class HomeApi {
  Future<dynamic> getHome() async {
    Dio dio = Dio();
    final password=await pass.get('pass');
    log('the password cached is : $password');
    dio.options.headers = { "api_password":password,
      "language": "en",
      "Content-Type": "application/json",
    };
    final response = await dio.get(
      "$baseUrl/home",
    );
    log('HomeResponse: ' + response.toString());
    return response;
  }
}
