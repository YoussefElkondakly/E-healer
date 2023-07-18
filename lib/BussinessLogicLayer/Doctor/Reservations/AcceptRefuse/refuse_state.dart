part of 'refuse_cubit.dart';

@immutable
abstract class RefuseState {}

class RefuseInitial extends RefuseState {}
class RefuseLoading extends RefuseState{

}
class RefuseSuccess extends RefuseState{
  final String id;
  final String message;

  RefuseSuccess({required this.id,required this.message});
}
class RefuseFailed extends RefuseState{
  final String error;
  RefuseFailed({required this.error});
}