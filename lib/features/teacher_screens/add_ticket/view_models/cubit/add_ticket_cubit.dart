import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:smart_connect/core/di/dependancy_injection.dart';
import 'package:smart_connect/core/network/supabase/database/add_data.dart';
import 'package:smart_connect/core/notifications/fcm_notification.dart';
import 'package:smart_connect/core/utilies/constants/app_strings.dart';
part 'add_ticket_state.dart';

class AddTicketCubit extends Cubit<AddTicketState> {
  AddTicketCubit() : super(AddTicketInitial());
  final nameController = TextEditingController();
  final adminController = TextEditingController();
  final descriptionController = TextEditingController();
  final roomNameController = TextEditingController();
  final moreDataController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  addticket() async {
    try {
      if (formKey.currentState!.validate()) {
        emit(AddTicketLoading());
        await addData(
          tableName: "tickets",
          data: {
            "title": nameController.text,
            "admin": adminController.text,
            "description": descriptionController.text,
            "room_name": roomNameController.text,
            "more_data": moreDataController.text,
          },
        );
        emit(AddTicketSuccess());
        await getIt<NotificationsHelper>().sendNotifications(
          title: nameController.text,
          body: descriptionController.text,
          topic: AppStrings.itTopic,
        );
        log(AppStrings.itTopic);
      }
    } catch (e) {
      emit(AddTicketFailed(errorMessage: e.toString()));
    }
  }
}
