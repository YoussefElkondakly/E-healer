
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../DataLayer/Repository/Doctor/Accept_Repo.dart';
import '../../../../DataLayer/WebServer/Doctor/accept_API.dart';

part 'accept_state.dart';

class AcceptCubit extends Cubit<AcceptState> {
  AcceptCubit() : super(AcceptInitial());

  static AcceptCubit get(context) => BlocProvider.of(context);


  final AcceptRepo acceptRepo = AcceptRepo(AcceptApi());
  String? message;
  // User? user;
  Future<void> getAccept({required String id}) async {
    emit(AcceptLoading());
    acceptRepo.getAccept(id: id,).then((value) {
      message=value?.message;
      emit(AcceptSuccess(id: id,message: value!.message!));
      log('Id فالCubit : ${id}');
    }).catchError((e) {
      emit(AcceptFailed(error: e.toString()));
    });
  }
}
