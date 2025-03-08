import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_connect/core/di/dependancy_injection.dart';
import 'package:smart_connect/core/network/supabase/database/add_data.dart';
import 'package:smart_connect/core/notifications/fcm_notification.dart';
import 'package:smart_connect/core/utilies/constants/app_strings.dart';
part 'emergency_state.dart';

class EmergencyCubit extends Cubit<EmergencyState> {
  EmergencyCubit() : super(EmergencyInitial());
  final emergencyType = TextEditingController();
  final titleController = TextEditingController();
  final description = TextEditingController();
  final locationController = TextEditingController();
  final moreDataController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  addEmergency() async {
    if (moreDataController.text.isEmpty) {
      moreDataController.text = "No more data";
    }
    if (formKey.currentState!.validate()) {
      try {
        emit(EmergencyLoading());
        await addData(tableName: "emergency", data: {
          "title": titleController.text,
          "description": description.text,
          "location": locationController.text,
          "type": emergencyType.text,
          "more_data": moreDataController.text
        });
        await getIt<NotificationsHelper>().sendNotifications(
          body: description.text,
          title: titleController.text,
          type: emergencyType.text,
          topic: AppStrings.emergancyTopic,
        );
        titleController.clear();
        description.clear();
        locationController.clear();
        moreDataController.clear();
        emergencyType.clear();
        emit(EmergencySuccess());
      } on Exception catch (e) {
        emit(EmergencyFailed(errorMessage: e.toString()));
      }
    }
  }
}
