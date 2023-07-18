part of 'update_medical_record_cubit.dart';
@immutable
abstract class UpdateMedicalRecordState {}
class UpdateMedicalRecordInitial extends UpdateMedicalRecordState {}
class UpdateMedicalRecordLoading extends UpdateMedicalRecordState {}
class UpdateMedicalRecordSuccess extends UpdateMedicalRecordState {
  final MedicalReport medicalReport;
  final String message;
  UpdateMedicalRecordSuccess({required this.medicalReport,required this.message});
}
class UpdateMedicalRecordFailed  extends UpdateMedicalRecordState {
  final String error;

  UpdateMedicalRecordFailed({required this.error});

}
