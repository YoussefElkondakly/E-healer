part of 'update_profile_doc_cubit.dart';

@immutable
abstract class UpdateProfileDocState {}

class UpdateProfileDocInitial extends UpdateProfileDocState {}
class UpdateProfileDocLoading extends UpdateProfileDocState{}
class UpdateProfileDocSuccess extends UpdateProfileDocState{
  final User user;
  UpdateProfileDocSuccess({required this.user});
}
class UpdateProfileDocFailed extends UpdateProfileDocState{
  final String error;
  UpdateProfileDocFailed({required this.error});
}
