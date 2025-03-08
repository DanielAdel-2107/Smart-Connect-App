part of 'add_ticket_cubit.dart';

@immutable
sealed class AddTicketState {}

final class AddTicketInitial extends AddTicketState {}
final class AddTicketLoading extends AddTicketState {}
final class AddTicketSuccess extends AddTicketState {}
final class AddTicketFailed extends AddTicketState {
  final String errorMessage;
  AddTicketFailed({required this.errorMessage });
}
