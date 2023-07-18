import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../DataLayer/Models/medicalRecord_model.dart';
import '../../DataLayer/Repository/mRecord_repo.dart';
import '../../DataLayer/WebServer/medicalRecord_API.dart';

part 'mrecord_state.dart';

class MrecordCubit extends Cubit<MrecordState> {
  MrecordCubit() : super(MrecordInitial());
  static MrecordCubit get(context) => BlocProvider.of(context);
  final MRecordRepo mRecordRepo = MRecordRepo(MRecordApi());
  UserRecord? user;
String? message;
  Future<void> mRecord({
    required String blood_type,
    required String pharmaceutical,
    required String chronic_diseases,
    required String notes,
  }) async {
    emit(MrecordLoading());
    mRecordRepo.mRecord(
      blood_type: blood_type,
      pharmaceutical: pharmaceutical,
      chronic_diseases: chronic_diseases,
      notes: notes,
    ).then((value) {
      user = value!.user;
      message=value!.message;
      emit(MrecordSuccess(user: value.user!,message:value.message!));
    }).catchError((e) {
      emit(MrecordFailed(error: e.toString()));
    });
  }
}
