import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../../DataLayer/Models/Register/Register.dart';
import '../../DataLayer/Repository/register_repo.dart';
import '../../DataLayer/WebServer/register_API.dart';
part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupInitial());
  static SignupCubit get(context) => BlocProvider.of(context);

  final RegisterRepo registerRepo = RegisterRepo(RegisterApi());
  User? user;
  String? message;
  String? error;

  Future<void> register({
    required String name,
    required String email,
    required String mobile,
    required String password,
    required String password_confirmation,
    required String user_type,
    required String address,
    required File image,
  }) async {
    emit(RegisterLoading());
    registerRepo.register(
            namee: name,
            email: email,
            mobile: mobile,
            password: password,
            password_confirmation: password_confirmation,
            user_type: user_type,
            address: address,
            image: image)
        .then((value) {
      user = value!.user;
      message=value.message;
      emit(RegisterSuccess(user: value.user!,message:value.message!,));
    }).catchError((e) {
      error=e.error;
      emit(RegisterFailed(error:e.error!,));
    });
  }
}
