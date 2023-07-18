part of 'get_user_cubit.dart';

@immutable
abstract class GetUserState {}

class GetUserInitial extends GetUserState {}
class GetUserLoading extends GetUserState {}
class GetUserSuccess extends GetUserState {

}
class GetUserFailed extends GetUserState {
  final String error;
  GetUserFailed({required this.error});
}
