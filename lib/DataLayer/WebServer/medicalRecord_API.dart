import 'dart:developer';

import 'package:dio/dio.dart';


import '../../constants.dart';
import '../../main.dart';

class MRecordApi{

  Future<dynamic> mRecord(
      {required Map<String,dynamic> data}) async {
Dio dio=Dio();
final token = await prefs.get('token');
log('token: $token');
final headers ={
"language":"en",
"Content-Type":"application/json",
"api_password":"123456",
"Authorization":"Bearer $token",
};
log('data: ${data.toString()}');

final response = await dio.post("$baseUrl/user/save-medical-report",
data:data,options: Options(headers: headers));
log('mRecordResponse: '+response.toString());
return response;
}
}