import 'dart:developer';
import 'package:dio/dio.dart';

import '../../Models/Doctor/ReservationsModel.dart';

import '../../Models/User/UserReservationModel.dart';
import '../../WebServer/Doctor/reservation_API.dart';
import '../../WebServer/user/UserReservationAPI.dart';


class UserReservationRepo{
  final UserReservationApi userReservationApi;
  UserReservationRepo(this.userReservationApi);

  Future<UserReservationModel?> getUserReservation()async{
    try{
      final Response response = await userReservationApi.getUserReservation();
      log('statusCode: '+response.statusCode.toString());
      log('response: '+response.data.toString());
      if(response.statusCode == 200) {
        final userReservationModel = UserReservationModel.fromJson(response.data);
        return userReservationModel;
      }else{
        throw(response.data["message"]);
      }
    }
    catch(e){
      throw(e);
    }
  }
}