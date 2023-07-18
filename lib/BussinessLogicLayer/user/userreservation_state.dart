part of 'userreservation_cubit.dart';

@immutable
abstract class UserReservationState {}

class UserReservationInitial extends UserReservationState {}
class UserReservationLoading extends UserReservationState {}
class UserReservationSuccess extends UserReservationState {

}
class UserReservationFailed extends UserReservationState {
  final String error;
  UserReservationFailed({required this.error});
}
