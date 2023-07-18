part of 'user_reservation_report_cubit.dart';

@immutable
abstract class UserReservationReportState {}

class UserReservationReportInitial extends UserReservationReportState {}
class UserReservationReportLoading extends UserReservationReportState {}
class UserReservationReportSuccess extends UserReservationReportState {

}
class UserReservationReportFailed extends UserReservationReportState {
  final String error;
  UserReservationReportFailed({required this.error});
}
