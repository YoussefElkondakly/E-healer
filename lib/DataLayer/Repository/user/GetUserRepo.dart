import 'dart:developer';
import 'package:dio/dio.dart';
import '../../Models/User/GetUserModel.dart';
import '../../WebServer/user/GetUserAPI.dart';


class GetUserRepo{
  final GetUserApi getUserApi;
  GetUserRepo(this.getUserApi);

  Future<GetUserModel?> getGetUser()async{
    try{
      final Response response = await getUserApi.getGetUser();
      log('statusCode: '+response.statusCode.toString());
      log('response: '+response.data.toString());
      if(response.statusCode == 200) {
        final getUserModel = GetUserModel.fromJson(response.data);
        return getUserModel;
      }else{
        throw(response.data["message"]);
      }
    }
    catch(e){
      throw(e);
    }
  }
}