// ignore_for_file: use_build_context_synchronously
import 'dart:developer';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:smart_connect/app/my_app.dart';
import 'package:smart_connect/core/di/dependancy_injection.dart';
import 'package:smart_connect/core/helper/show_custom_dialog.dart';
import 'package:smart_connect/core/network/supabase/database/add_data.dart';
import 'package:smart_connect/core/notifications/fcm_notification.dart';
import 'package:smart_connect/core/utilies/constants/app_strings.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
part 'creat_metting_state.dart';

class CreatMettingCubit extends Cubit<CreatMettingState> {
  CreatMettingCubit() : super(CreatMettingInitial());

  DateTime initialDate = DateTime.now();
  String? selectedStartTime;
  String? selectedEndTime;
  String? formatSelectedDate;
  final nameController = TextEditingController();
  final adminController = TextEditingController();
  final descriptionController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  Future<void> pickDate() async {
    DateTime? newDate = await showDatePicker(
      context: navigatorKey.currentState!.context,
      firstDate: DateTime.now(),
      initialDate: initialDate,
      lastDate: DateTime(2100),
    );
    if (newDate != null) {
      formatSelectedDate = DateFormat('dd/MM/yyyy').format(newDate);
      emit(SelectDateState(selectedDateTime: formatSelectedDate!));
    }
  }

  Future<void> pickTime({required String timeCycle}) async {
    TimeOfDay? newTime = await showTimePicker(
      context: navigatorKey.currentState!.context,
      initialTime: TimeOfDay.now(),
    );
    if (newTime != null) {
      final DateTime selectedTime = DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day,
        newTime.hour,
        newTime.minute,
      );
      String formattedTime = DateFormat('hh:mm a').format(selectedTime);
      if (timeCycle == "start") {
        selectedStartTime = formattedTime;
      } else if (timeCycle == "end") {
        selectedEndTime = formattedTime;
      }
      emit(TimeUpdatedState());
    }
  }

  addMeeting() async {
    try {
      if (formKey.currentState!.validate()) {
        if (selectedStartTime != null &&
            selectedEndTime != null &&
            formatSelectedDate != null) {
          if (selectedStartTime != null && selectedEndTime != null) {
            if (isEndTimeValid(selectedStartTime!, selectedEndTime!)) {
              emit(CreatMettingLoading());
              addData(
                tableName: "meetings",
                data: {
                  "name": nameController.text,
                  "admin": adminController.text,
                  "description": descriptionController.text,
                  "date": formatSelectedDate,
                  "start_time": selectedStartTime,
                  "end_time": selectedEndTime,
                },
              );
              getIt<NotificationsHelper>().sendNotifications(
                  title: nameController.text,
                  body: descriptionController.text,
                  topic: "viewMeetingScreen",
                  type: "Meeting Created",
                  userId: getIt<SupabaseClient>().auth.currentUser!.id);
              emit(CreatMettingSuccess());
              await getIt<NotificationsHelper>().sendNotifications(
                title: nameController.text,
                body: descriptionController.text,
                topic: AppStrings.teacherTopic,
              );
              log(AppStrings.teacherTopic);
            } else {
              showCustomDialog(
                  title: "Error",
                  description: "End time must be after start time.",
                  dialogType: DialogType.error);
            }
          }
        } else {
          showCustomDialog(
            description: "Please select date and time for the meeting.",
            dialogType: DialogType.error,
            title: "Error",
          );
        }
      }
    } catch (e) {
      emit(CreatMettingFailed(errorMessage: e.toString()));
    }
  }

  bool isEndTimeValid(String startTime, String endTime) {
    DateFormat format = DateFormat('hh:mm a');
    DateTime start = format.parse(startTime);
    DateTime end = format.parse(endTime);
    return end.isAfter(start);
  }
}
