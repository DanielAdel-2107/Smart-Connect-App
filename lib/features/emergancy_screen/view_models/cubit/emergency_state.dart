part of 'emergency_cubit.dart';

abstract class EmergencyState {}

final class EmergencyInitial extends EmergencyState {}

final class EmergencyLoading extends EmergencyState {}

final class EmergencySuccess extends EmergencyState {}

final class EmergencyFailed extends EmergencyState {
  final String errorMessage;

  EmergencyFailed({required this.errorMessage});
}
