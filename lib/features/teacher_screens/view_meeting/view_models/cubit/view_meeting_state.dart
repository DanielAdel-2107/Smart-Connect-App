part of 'view_meeting_cubit.dart';

abstract class ViewMeetingState {}

class ViewMeetingLoading extends ViewMeetingState {}

class ViewMeetingSuccess extends ViewMeetingState {}

class ViewMeetingFailed extends ViewMeetingState {
  final String errorMessage;
  ViewMeetingFailed({required this.errorMessage});
}

class ViewMeetingEmpty extends ViewMeetingState {}
