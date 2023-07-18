part of 'updateprofile_cubit.dart';

@immutable
abstract class UpdateProfileState {}

class UpdateProfileInitial extends UpdateProfileState {}
class UpdateProfileLoading extends UpdateProfileState {}
class UpdateProfileSuccess extends UpdateProfileState {
  final User user;
  UpdateProfileSuccess({required this.user});

}
class UpdateProfileFailed extends UpdateProfileState {
  final String error;
  UpdateProfileFailed({required this.error});
}