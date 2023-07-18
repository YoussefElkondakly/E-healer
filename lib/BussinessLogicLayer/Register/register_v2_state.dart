part of 'register_v2_cubit.dart';

@immutable
abstract class RegisterV2State {}

class RegisterV2Initial extends RegisterV2State {}
class RegisterV2Loading extends RegisterV2State {}
class RegisterV2Success extends RegisterV2State {
  final User user;

  RegisterV2Success({required this.user});
}
class RegisterV2Failed extends RegisterV2State {
  final String error;

  RegisterV2Failed({required this.error});
}