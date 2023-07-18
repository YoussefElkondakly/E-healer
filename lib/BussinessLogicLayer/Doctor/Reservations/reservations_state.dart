part of 'reservations_cubit.dart';

@immutable
abstract class ReservationsState {}

class ReservationsInitial extends ReservationsState {}
class ReservationsLoading extends ReservationsState {}
class ReservationsSuccess extends ReservationsState {
List<Userr>user;
ReservationsSuccess({required this.user});
}
class ReservationsFailed extends ReservationsState {
  final String error;
  ReservationsFailed({required this.error});
}

