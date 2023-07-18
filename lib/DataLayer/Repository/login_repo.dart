import 'dart:developer';
import 'package:dio/dio.dart';
import '../Models/Register/LoginDoc.dart';
import '../WebServer/login_api.dart';

class LoginRepo{
  final LoginApi loginApi;
  LoginRepo(this.loginApi);

  Future<LoginDoc?> login({required String email,required String password})async{
    final data = {
      'email':email,
      'password':password
    };
    try{
      final Response response = await loginApi.login(data: data);
      log('statusCode: '+response.statusCode.toString());
      log('response: '+response.data.toString());
      if(response.statusCode == 200) {
        final loginModel = LoginDoc.fromJson(response.data);

        return loginModel;
      }else{
        throw(response.data["message"]);
      }
    }
    catch(e){
      throw(e);
    }
  }
}