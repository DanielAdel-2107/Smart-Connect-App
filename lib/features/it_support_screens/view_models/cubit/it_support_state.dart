part of 'it_support_cubit.dart';

sealed class ItSupportState {}

final class ItSupportInitial extends ItSupportState {}
final class ItSupportEmpty extends ItSupportState {}
final class ItSupportSuccess extends ItSupportState {}
final class ItSupportLoading extends ItSupportState {}
final class ItSupportFailed extends ItSupportState {
  final String errorMessage;

  ItSupportFailed({required this.errorMessage});
}
final class TicketUpdateSuccess extends ItSupportState {}
final class TicketUpdateLoading extends ItSupportState {}
final class TicketUpdateFailed extends ItSupportState {
  final String errorMessage;

  TicketUpdateFailed({required this.errorMessage});
}
