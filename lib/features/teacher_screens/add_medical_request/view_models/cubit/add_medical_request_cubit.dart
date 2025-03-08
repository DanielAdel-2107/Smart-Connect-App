import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:smart_connect/core/di/dependancy_injection.dart';
import 'package:smart_connect/core/network/supabase/database/add_data.dart';
import 'package:smart_connect/core/notifications/fcm_notification.dart';
import 'package:smart_connect/core/utilies/constants/app_strings.dart';
part 'add_medical_request_state.dart';

class AddMedicalRequestCubit extends Cubit<AddMedicalRequestState> {
  AddMedicalRequestCubit() : super(AddMedicalRequestInitial()) {
    requestLocationPermission();
  }

  final nameController = TextEditingController();
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final moreDataController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  bool hasLocationPermission = false;

  Future<void> requestLocationPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    if (permission == LocationPermission.whileInUse ||
        permission == LocationPermission.always) {
      hasLocationPermission = true;
    } else {
      hasLocationPermission = false;
    }
  }

  Future<void> addMedicalRequest() async {
    if (!hasLocationPermission) {
      emit(AddMedicalRequestFailed(
          errorMessage: "Location permission is required!"));
      requestLocationPermission();
      return;
    }
    try {
      if (moreDataController.text.isEmpty) {
        moreDataController.text = "No More Data";
      }
      if (formKey.currentState!.validate()) {
        emit(AddMedicalRequestLoading());
        Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high,
        );
        await addData(
          tableName: "medical_request",
          data: {
            "name": nameController.text,
            "title": titleController.text,
            "description": descriptionController.text,
            "more_data": moreDataController.text,
            "latitude": position.latitude.toString(),
            "longtude": position.longitude.toString(),
          },
        );
        emit(AddMedicalRequestSuccess());
        await getIt<NotificationsHelper>().sendNotifications(
          title: titleController.text,
          body: descriptionController.text,
          topic: AppStrings.doctorTopic,
        );
        log(AppStrings.doctorTopic);
      }
    } catch (e) {
      emit(AddMedicalRequestFailed(errorMessage: e.toString()));
    }
  }
}
