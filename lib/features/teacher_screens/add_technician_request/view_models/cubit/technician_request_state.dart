part of 'technician_request_cubit.dart';

sealed class AddTechnicianRequestState {}

final class AddTechnicianRequestInitial extends AddTechnicianRequestState {}
final class AddTechnicianRequestLoading extends AddTechnicianRequestState {}
final class AddTechnicianRequestSuccess extends AddTechnicianRequestState {}
final class AddTechnicianRequestFailed extends AddTechnicianRequestState {
  final String errorMessage;

  AddTechnicianRequestFailed({required this.errorMessage });
}
