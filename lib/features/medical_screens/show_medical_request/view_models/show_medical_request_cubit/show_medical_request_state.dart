part of 'show_medical_request_cubit.dart';

sealed class ShowMedicalRequestState {}

final class ShowMedicalRequestInitial extends ShowMedicalRequestState {}

final class ShowMedicalRequestLoading extends ShowMedicalRequestState {}

final class EmptyMedicalRequest extends ShowMedicalRequestState {}

final class ShowMedicalRequestSuccess extends ShowMedicalRequestState {
  final List<MedicalRequestModel> medicalRequestList;

  ShowMedicalRequestSuccess({required this.medicalRequestList});
}

final class ShowMedicalRequestFailed extends ShowMedicalRequestState {
  final String errorMessage;

  ShowMedicalRequestFailed({required this.errorMessage});
}

final class UpdateMedicalRequest extends ShowMedicalRequestState {
   final String message ;

  UpdateMedicalRequest({required this.message});
}

final class DontUpdateMedicalRequest extends ShowMedicalRequestState {
  final String message;

  DontUpdateMedicalRequest({required this.message});
}
final class LoadingMedicalRequestUploaded extends ShowMedicalRequestState {
  LoadingMedicalRequestUploaded();
}
