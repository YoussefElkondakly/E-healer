import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../../../DataLayer/Models/Doctor/Editing/AddReportModel.dart';
import '../../../DataLayer/Repository/Doctor/Editing/AddReportRepo.dart';
import '../../../DataLayer/WebServer/Doctor/Editing/AddReportAPI.dart';
part 'add_report_state.dart';

class AddReportCubit extends Cubit<AddReportState> {
  AddReportCubit() : super(AddReportInitial());

  static AddReportCubit get(context) => BlocProvider.of(context);
  final AddReportRepo addReportRepo = AddReportRepo(AddReportApi());
  Report? report;
  String? message;
  String? error;
  Future<void> addReport({
    required String reservation_id,
    required String notes,
  }) async {
    emit(AddReportLoading());
    addReportRepo
        .addReport(
      reservation_id: reservation_id,
      notes: notes,
    )
        .then((value) {
      report = value!.report;
      message = value.message;
      emit(AddReportSuccess(report: value.report!, message: value.message!));
    }).catchError((e) {
      error = e.error;

      emit(AddReportFailed(error:e.error!));
    });
  }
}
