import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../../../DataLayer/Models/Doctor/Editing/UpdateMedicalRecordModel.dart';
import '../../../DataLayer/Repository/Doctor/Editing/UpdateMedicalRecordRepo.dart';
import '../../../DataLayer/WebServer/Doctor/Editing/UpdateMedicalRecordAPI.dart';
part 'update_medical_record_state.dart';
class UpdateMedicalRecordCubit extends Cubit<UpdateMedicalRecordState> {
  UpdateMedicalRecordCubit() : super(UpdateMedicalRecordInitial());
  static UpdateMedicalRecordCubit get(context) => BlocProvider.of(context);
  final UpdateMedicalRecordRepo updateMedicalRecordRepo = UpdateMedicalRecordRepo(UpdateMedicalRecordApi());
  MedicalReport? medicalReport;
  String? message;
  String? error;
  Future<void> updateMedicalRecord({
    required String id,
    required String blood_type,
    required String pharmaceutical,
    required String chronic_diseases,
    required String notes,
  }) async {
    emit(UpdateMedicalRecordLoading());
    updateMedicalRecordRepo.updateMedicalRecord(
      id: id,
      blood_type: blood_type,
      pharmaceutical: pharmaceutical,
      chronic_diseases: chronic_diseases,
      notes: notes,
    ).then((value) {
      medicalReport = value!.medicalReport;
      message=value.message;
      emit(UpdateMedicalRecordSuccess(medicalReport: value.medicalReport!,message: value.message!));
    }).catchError((e) {
      error=e.error;
      emit(UpdateMedicalRecordFailed(error: e.error!));
    });
  }
}

