part of 'accept_cubit.dart';

@immutable
abstract class AcceptState {}

class AcceptInitial extends AcceptState {}
class AcceptLoading extends AcceptState{
  // final String Id;
  // AcceptLoading({required this.Id});
}
class AcceptSuccess extends AcceptState{
  final String id;
  final String message;

  AcceptSuccess({required this.id,required this.message});
}
class AcceptFailed extends AcceptState{
  final String error;
  AcceptFailed({required this.error});
}