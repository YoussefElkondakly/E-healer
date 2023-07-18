
import 'dart:developer';

import 'package:dio/dio.dart';

import '../../Models/User/ReservationModel.dart';
import '../../WebServer/user/Reservation_API.dart';

class ReservationRepo{
  final ReservationApi reservationApi;
  ReservationRepo(this.reservationApi);

  Future<ReservationModel?> reservation({
    required String doctor_id,
    required String date,
      required String notes

  }) async {
    final data = {
      'doctor_id': doctor_id,
      'date': date,
        'notes':notes,
    };
    try {
      final Response response = await reservationApi.reservation(data: data);
      log('statusCode: ' + response.statusCode.toString());
      log('response: ' + response.data.toString());
      if (response.statusCode == 200) {
        final reservationModel = ReservationModel.fromJson(response.data);

        return reservationModel;
      } else {
        throw (response.data["message"]);
      }
    } catch (e) {
      throw (e);
    }
  }
}