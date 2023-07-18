import 'dart:developer';
import 'package:dio/dio.dart';

import '../../Models/Doctor/ReservationsModel.dart';

import '../../Models/User/UserReservationModel.dart';
import '../../Models/User/UserReservationReportModel.dart';
import '../../WebServer/Doctor/reservation_API.dart';
import '../../WebServer/user/UserReservationAPI.dart';
import '../../WebServer/user/UserReservationReportAPI.dart';


class UserReservationReportRepo{
  final UserReservationReportApi userReservationReportApi;
  UserReservationReportRepo(this.userReservationReportApi);

  Future<UserReservationReportModel?> getUserReservationReport()async{
    try{
      final Response response = await userReservationReportApi.getUserReservationReport();
      log('statusCode: '+response.statusCode.toString());
      log('response: '+response.data.toString());
      if(response.statusCode == 200) {
        final userReservationReportModel = UserReservationReportModel.fromJson(response.data);
        return userReservationReportModel;
      }else{
        throw(response.data["message"]);
      }
    }
    catch(e){
      throw(e);
    }
  }
}