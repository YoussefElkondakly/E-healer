import 'dart:developer';
import 'package:dio/dio.dart';

import '../../Models/Doctor/AcceptRefuse/AcceptModel.dart';
import '../../Models/Doctor/ReservationsModel.dart';

import '../../WebServer/Doctor/accept_API.dart';
import '../../WebServer/Doctor/reservation_API.dart';


class AcceptRepo{
  final AcceptApi acceptApi;
  AcceptRepo(this.acceptApi);

  Future<AcceptModel?> getAccept({required String id})async{
    final data={
      'id':id
    };
    try{
      final Response response = await acceptApi.getAccept(data: data, );
      log('statusCode: '+response.statusCode.toString());
      log('response: '+response.data.toString());
      if(response.statusCode == 200) {
        final acceptModel = AcceptModel.fromJson(response.data);
        return acceptModel;
      }else{
        throw(response.data["message"]);
      }
    }
    catch(e){
      throw(e);
    }
  }
}