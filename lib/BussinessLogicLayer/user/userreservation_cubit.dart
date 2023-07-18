import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:new_windows/DataLayer/Models/User/UserReservationModel.dart';

import '../../DataLayer/Repository/user/UserReservationRepo.dart';
import '../../DataLayer/WebServer/user/UserReservationAPI.dart';

part 'userreservation_state.dart';

class UserReservationCubit extends Cubit<UserReservationState> {
  UserReservationCubit() : super(UserReservationInitial());
  static UserReservationCubit get(context) => BlocProvider.of(context);

  final UserReservationRepo userReservationRepo = UserReservationRepo(UserReservationApi());
  List<Userq>? user;
  Future<void> getUserReservations() async {
    emit(UserReservationLoading());
    userReservationRepo.getUserReservation().then((value) {
      user = value!.user;
      emit(UserReservationSuccess());
    }).catchError((e) {
      emit(UserReservationFailed(error: e.toString()));
    });
  }

}

