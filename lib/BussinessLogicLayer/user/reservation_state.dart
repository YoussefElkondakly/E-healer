part of 'reservation_cubit.dart';

@immutable
abstract class ReservationState {}

class ReservationInitial extends ReservationState {}
class ReservationLoading extends ReservationState {}
class ReservationSuccess extends ReservationState {
  final User user;
  final String message;
  ReservationSuccess({required this.user,required this.message});
}
class ReservationFailed extends ReservationState {
  final String error;
  ReservationFailed({required this.error});
}