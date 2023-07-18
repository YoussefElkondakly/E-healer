part of 'mrecord_cubit.dart';

@immutable
abstract class MrecordState {}

class MrecordInitial extends MrecordState {}
class MrecordLoading extends MrecordState{}
class MrecordSuccess extends MrecordState{
  final UserRecord user;
String message;
  MrecordSuccess({required this.user,required this.message});
}
class MrecordFailed extends MrecordState{
  final String error;

  MrecordFailed({required this.error});
}