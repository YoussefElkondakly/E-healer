import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:new_windows/DataLayer/Models/User/UserReservationReportModel.dart';
import '../../DataLayer/Repository/user/UserReservationReportRepo.dart';
import '../../DataLayer/WebServer/user/UserReservationReportAPI.dart';

part 'user_reservation_report_state.dart';

class UserReservationReportCubit extends Cubit<UserReservationReportState> {
  UserReservationReportCubit() : super(UserReservationReportInitial());
  static UserReservationReportCubit get(context) => BlocProvider.of(context);

  final UserReservationReportRepo userReservationReportRepo = UserReservationReportRepo(UserReservationReportApi());
  List<User>? user;
  Future<void> getUserReservationsReport() async {
    emit(UserReservationReportLoading());
    userReservationReportRepo.getUserReservationReport().then((value) {
      user = value!.user;
      emit(UserReservationReportSuccess());
    }).catchError((e) {
      emit(UserReservationReportFailed(error: e.toString()));
    });
  }

}

