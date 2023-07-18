part of 'signup_cubit.dart';
@immutable
abstract class SignupState {}
class SignupInitial extends SignupState {}
class RegisterLoading extends SignupState{}
class RegisterSuccess extends SignupState{
  final User user;
  final String message;
  RegisterSuccess({required this.user,required this.message});
}
class RegisterFailed extends SignupState{
  final String error;
  RegisterFailed({required this.error});
}