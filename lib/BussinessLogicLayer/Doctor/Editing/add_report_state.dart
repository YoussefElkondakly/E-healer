part of 'add_report_cubit.dart';

@immutable
abstract class AddReportState {}

class AddReportInitial extends AddReportState {}
class AddReportLoading extends AddReportState {}
class AddReportSuccess extends AddReportState {
  final Report? report;
  final String message;
  AddReportSuccess({required this.report,required this.message});
}
class AddReportFailed  extends AddReportState {
  final String error;

  AddReportFailed({required this.error});

}