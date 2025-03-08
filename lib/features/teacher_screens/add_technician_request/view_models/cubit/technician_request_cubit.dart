import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_connect/core/di/dependancy_injection.dart';
import 'package:smart_connect/core/network/supabase/database/add_data.dart';
import 'package:smart_connect/core/notifications/fcm_notification.dart';
import 'package:smart_connect/core/utilies/constants/app_strings.dart';
part 'technician_request_state.dart';

class AddTechnicianRequestCubit extends Cubit<AddTechnicianRequestState> {
  AddTechnicianRequestCubit() : super(AddTechnicianRequestInitial());
  final nameController = TextEditingController();
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final moreDataController = TextEditingController();
  final typeController = TextEditingController();
  final roomNameController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  Future<void> addTechnicianRequest() async {
    try {
      if (moreDataController.text.isEmpty) {
        moreDataController.text = "No More Data";
      }
      if (formKey.currentState!.validate()) {
        emit(AddTechnicianRequestLoading());
        await addData(
          tableName: "technician_request",
          data: {
            "name": nameController.text,
            "title": titleController.text,
            "description": descriptionController.text,
            "type": titleController.text,
            "room_name": roomNameController.text,
            "more_data": moreDataController.text,
          },
        );
        emit(AddTechnicianRequestSuccess());
        await getIt<NotificationsHelper>().sendNotifications(
          title: titleController.text,
          body: descriptionController.text,
          topic: AppStrings.technicianTopic,
        );
        log(AppStrings.technicianTopic);
      }
    } catch (e) {
      emit(AddTechnicianRequestFailed(errorMessage: e.toString()));
    }
  }
}
