part of 'creat_metting_cubit.dart';

@immutable
abstract class CreatMettingState {}

class CreatMettingInitial extends CreatMettingState {}
class CreatMettingLoading extends CreatMettingState {}
class CreatMettingSuccess extends CreatMettingState {}
class CreatMettingFailed extends CreatMettingState {
  final String errorMessage;  
  CreatMettingFailed({required this.errorMessage});
}

class SelectDateState extends CreatMettingState {
  final String selectedDateTime;
  SelectDateState({required this.selectedDateTime});
}

class TimeUpdatedState extends CreatMettingState {
}
