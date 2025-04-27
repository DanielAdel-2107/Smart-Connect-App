part of 'add_medical_request_cubit.dart';

sealed class AddMedicalRequestState {}

final class AddMedicalRequestInitial extends AddMedicalRequestState {}
final class AddMedicalRequestLoading extends AddMedicalRequestState {}
final class AddMedicalRequestSuccess extends AddMedicalRequestState {}
final class AddMedicalRequestFailed extends AddMedicalRequestState {
  final String errorMessage;

   AddMedicalRequestFailed({required this.errorMessage });
}
