import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../DataLayer/Repository/Doctor/Refuse_Repo.dart';
import '../../../../DataLayer/WebServer/Doctor/refuse_API.dart';

part 'refuse_state.dart';

class RefuseCubit extends Cubit<RefuseState> {
  RefuseCubit() : super(RefuseInitial());

  static RefuseCubit get(context) => BlocProvider.of(context);


  final RefuseRepo refuseRepo = RefuseRepo(RefuseApi());
  String? message;
  // User? user;
  Future<void> getRefuse({required String id}) async {
    emit(RefuseLoading());
    refuseRepo.getRefuse(id: id,).then((value) {
      message=value?.message;
      emit(RefuseSuccess(id: id,message: value!.message!));
      log('Id فالCubit : ${id}');
    }).catchError((e) {
      emit(RefuseFailed(error: e.toString()));
    });
  }
}
