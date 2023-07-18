import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:new_windows/DataLayer/Models/User/ReservationModel.dart';

import '../../DataLayer/Repository/user/Reservation_repos.dart';
import '../../DataLayer/WebServer/user/Reservation_API.dart';

part 'reservation_state.dart';

class ReservationCubit extends Cubit<ReservationState> {
  ReservationCubit() : super(ReservationInitial());
  static ReservationCubit get(context)=>BlocProvider.of(context);
  final ReservationRepo reservationRepo=ReservationRepo(ReservationApi());
  User? user;
  String? message;
  Future<void> reservation({
    required String doctor_id,
    required String date,
    required String notes
  })async{
    emit(ReservationLoading());
    reservationRepo.reservation(doctor_id: doctor_id, date: date,notes:notes).then((value) {
      user=value!.user;
      message=value.message;
      emit(ReservationSuccess(user: value.user!,message: value.message!));
    }).catchError((e){
      emit(ReservationFailed(error: e.toString()));
    });
  }





}
