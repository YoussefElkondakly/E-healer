import 'dart:developer';
import 'package:dio/dio.dart';

import '../../Models/Doctor/ReservationsModel.dart';

import '../../WebServer/Doctor/reservation_API.dart';


class ReservationsRepo{
  final ReservationsApi reservationsApi;
  ReservationsRepo(this.reservationsApi);

  Future<ReservationsModel?> getReservations()async{
    try{
      final Response response = await reservationsApi.getReservations();
      log('statusCode: '+response.statusCode.toString());
      log('response: '+response.data.toString());
      if(response.statusCode == 200) {
        final reservationsModel = ReservationsModel.fromJson(response.data);
        return reservationsModel;
      }else{
        throw(response.data["message"]);
      }
    }
    catch(e){
      throw(e);
    }
  }
}