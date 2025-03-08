part of 'technician_request_cubit.dart';

sealed class TechnicianRequestState {}

final class TechnicianRequestInitial extends TechnicianRequestState {}

final class TechnicianRequestSuccess extends TechnicianRequestState {
  final List<TechnicianRequestModel> technicianRequests;

  TechnicianRequestSuccess({required this.technicianRequests});
}

final class EmptyTechnicianRequest extends TechnicianRequestState {}

final class TechnicianRequestLoading extends TechnicianRequestState {}

final class TechnicianRequestFailed extends TechnicianRequestState {
  final String errorMessage;

  TechnicianRequestFailed({required this.errorMessage});
}

final class UpdateTechnicianRequestSuccess extends TechnicianRequestState {}

final class UpdateTechnicianRequestLoading extends TechnicianRequestState {}

final class UpdateTechnicianRequestFailed extends TechnicianRequestState {
  final String errorMessage;

  UpdateTechnicianRequestFailed({required this.errorMessage});
}
