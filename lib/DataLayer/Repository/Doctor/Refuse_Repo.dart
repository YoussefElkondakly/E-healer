import 'dart:developer';
import 'package:dio/dio.dart';



import '../../Models/Doctor/AcceptRefuse/RefuseModel.dart';
import '../../WebServer/Doctor/refuse_API.dart';



class RefuseRepo{
  final RefuseApi refuseApi;
  RefuseRepo(this.refuseApi);

  Future<RefuseModel?> getRefuse({required String id})async{
    final data={
      'id':id
    };
    try{
      final Response response = await refuseApi.getRefuse(data: data, );
      log('statusCode: '+response.statusCode.toString());
      log('response: '+response.data.toString());
      if(response.statusCode == 200) {
        final refuseModel = RefuseModel.fromJson(response.data);
        return refuseModel;
      }else{
        throw(response.data["message"]);
      }
    }
    catch(e){
      throw(e);
    }
  }
}