import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_connect/core/app_route/route_names.dart';
import 'package:smart_connect/core/network/supabase/database/get_stream_data.dart';
import 'package:smart_connect/features/teacher_screens/view_meeting/models/fac_circular_menu_plus_model.dart';
import 'package:smart_connect/features/teacher_screens/view_meeting/models/meeting_model.dart';
part 'view_meeting_state.dart';

class ViewMeetingCubit extends Cubit<ViewMeetingState> {
  ViewMeetingCubit() : super(ViewMeetingLoading());
  List<FacCircularMenuPlusModel> menuItems = [
    FacCircularMenuPlusModel(
      icon: Icons.meeting_room,
      route: RouteNames.createMeetingScreen,
      label: "Create Meeting",
    ),
    FacCircularMenuPlusModel(
      icon: Icons.receipt,
      route: RouteNames.addTicketScreen,
      label: "Add Ticket",
    ),
    FacCircularMenuPlusModel(
      icon: Icons.engineering,
      route: RouteNames.addTechnicianRequestScreen,
      label: "Add Technician Request",
    ),
    FacCircularMenuPlusModel(
      icon: Icons.medical_services_outlined,
      route: RouteNames.addMedicalRequestScreen,
      label: "Medical Requests",
    ),
    FacCircularMenuPlusModel(
      icon: Icons.chat_bubble,
      route: RouteNames.chatScreen,
      label: "Chat With Geminai",
      args: "teacher"
    ),
    FacCircularMenuPlusModel(
      icon: Icons.logout,
      route: RouteNames.signInScreen,
      label: "Logout",
    ),
  ];
  List<MeetingModel> meetings = [];
  StreamSubscription<List<Map<String, dynamic>>>? _meetingSubscription;
  void streamMeetings() {
    emit(ViewMeetingLoading());
    _meetingSubscription = streamData(tableName: "meetings").listen(
      (data) {
        meetings = data.map((e) => MeetingModel.fromJson(e)).toList();
        if (meetings.isEmpty) {
          emit(ViewMeetingEmpty());
        } else {
          emit(ViewMeetingSuccess());
        }
      },
      onError: (error) {
        emit(ViewMeetingFailed(errorMessage: error.toString()));
      },
    );
  }

  @override
  Future<void> close() {
    _meetingSubscription?.cancel();
    return super.close();
  }
}
