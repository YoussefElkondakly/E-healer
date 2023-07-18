import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../DataLayer/Models/Doctor/ReservationsModel.dart';
import '../../../DataLayer/Repository/Doctor/reservations_repo.dart';
import '../../../DataLayer/WebServer/Doctor/reservation_API.dart';

part 'reservations_state.dart';

class ReservationsCubit extends Cubit<ReservationsState> {
  ReservationsCubit() : super(ReservationsInitial());

  static ReservationsCubit get(context) => BlocProvider.of(context);

  final ReservationsRepo reservationsRepo = ReservationsRepo(ReservationsApi());
  List<Userr> allUsers = [];
  List<Userr> accept = [];
  List<Userr> hold=[];
  List<Userr> refuse=[];
  Future<void> getReservations() async {
    emit(ReservationsLoading());
    reservationsRepo.getReservations().then((value) {
      allUsers = List.from(value!.user??[]);
      allUsers.forEach((element) {
        switch (element.status){
          case 'refuse':
            refuse.add(element);
            break;
          case 'accept':
            accept.add(element);
            break;
          case 'hold':
            hold.add(element);
            break;
        }
      });
      emit(ReservationsSuccess(user: value.user!));
    }).catchError((e) {
      emit(ReservationsFailed(error: e.toString()));
    });
  }

}
