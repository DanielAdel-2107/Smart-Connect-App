import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_connect/core/app_route/route_names.dart';
import 'package:smart_connect/core/di/dependancy_injection.dart';
import 'package:smart_connect/core/network/supabase/database/get_stream_data.dart';
import 'package:smart_connect/features/teacher_screens/add_technician_request/models/technician_request_model.dart';
import 'package:smart_connect/features/teacher_screens/view_meeting/models/fac_circular_menu_plus_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
part 'technician_request_state.dart';

class TechnicianRequestCubit extends Cubit<TechnicianRequestState> {
  TechnicianRequestCubit() : super(TechnicianRequestInitial());
  StreamSubscription? _streamSubscription;
  List<FacCircularMenuPlusModel> menuItems = [
    FacCircularMenuPlusModel(
      route: RouteNames.addTicketScreen,
      icon: Icons.receipt,
      label: "Add Ticket",
    ),
    FacCircularMenuPlusModel(
      route: RouteNames.addMedicalRequestScreen,
      icon: Icons.medical_information,
      label: "Add Medical Request",
    ),
    FacCircularMenuPlusModel(
        icon: Icons.chat_bubble,
        route: RouteNames.chatScreen,
        label: "Chat With Geminai",
        args: "technician"),
    FacCircularMenuPlusModel(
      route: RouteNames.signInScreen,
      icon: Icons.logout,
      label: "Sign Out",
    ),
  ];

  List<TechnicianRequestModel> technicianRequests = [];
  getTechnicianRequest() {
    _streamSubscription = streamData(tableName: "technician_request").listen(
      (data) {
        technicianRequests =
            data.map((e) => TechnicianRequestModel.fromJson(e)).toList();
        if (technicianRequests.isNotEmpty) {
          emit(
            TechnicianRequestSuccess(technicianRequests: technicianRequests),
          );
        } else {
          emit(EmptyTechnicianRequest());
        }
      },
      onError: (e) {
        emit(TechnicianRequestFailed(errorMessage: e.toString()));
      },
    );
  }

  ///////////////////////
  final stateController = TextEditingController();
  updateTechnicianRequestState({required String id}) async {
    if (stateController.text.isNotEmpty) {
      try {
        emit(UpdateTechnicianRequestLoading());
        await getIt<SupabaseClient>().from("technician_request").update({
          "status": stateController.text,
        }).eq("id", id);
        emit(UpdateTechnicianRequestSuccess());
      } on Exception catch (e) {
        emit(UpdateTechnicianRequestFailed(errorMessage: e.toString()));
      }
      stateController.clear();
    } else {
      emit(UpdateTechnicianRequestFailed(errorMessage: "No Changes made!"));
    }
  }
}
