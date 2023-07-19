import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../DataLayer/Models/Register/LoginDoc.dart';
import '../../DataLayer/Repository/login_repo.dart';
import '../../DataLayer/WebServer/login_api.dart';
import '../../main.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  static LoginCubit get(context) => BlocProvider.of(context);

  final LoginRepo loginRepo = LoginRepo(LoginApi());
  User? user;
  Future<void> login({
    required String email,
    required String password,
  }) async {
    emit(LoginLoading());
    loginRepo
        .login(
      email: email,
      password: password,
    )
        .then((value) {

      prefs.setString('token', value?.user?.apiToken ?? '');
      user = value!.user;
      emit(LoginSuccess(user: value.user!));
      log('cached token: ${prefs.get('token')}');
    }).catchError((e) {
      emit(LoginFailed(error: e.toString()));
    });
  }
}
