import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../Models/Register/LoginDoc.dart';


class LoginProvider with ChangeNotifier{
  LoginDoc? login;
  String? token;
  Map<String,dynamic>? DataLOG;
  Future<dynamic>lOgIn({
    String? name,
    String? email,
    String? password,
    String? phone,
  } )async{
    Dio dio=Dio();
    dio.options.headers={
      "language":"en",
      "Content-Type":"application/json",
      "Authorization":token,
    };
    DataLOG={
      "name":name,
      "email":email,
      "password":password,
      "phone":phone,
    };
    final response=await dio.post("http://192.168.1.105/DoctorApp/public/api/login",data: DataLOG,);
    login=LoginDoc.fromJson(response.data);
    notifyListeners();
  }
}