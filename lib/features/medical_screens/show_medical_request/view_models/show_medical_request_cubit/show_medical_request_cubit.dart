import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_connect/core/app_route/route_names.dart';
import 'package:smart_connect/core/di/dependancy_injection.dart';
import 'package:smart_connect/core/network/supabase/database/get_stream_data.dart';
import 'package:smart_connect/features/teacher_screens/add_medical_request/models/medical_request_model.dart';
import 'package:smart_connect/features/teacher_screens/view_meeting/models/fac_circular_menu_plus_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
part 'show_medical_request_state.dart';

class ShowMedicalRequestCubit extends Cubit<ShowMedicalRequestState> {
  ShowMedicalRequestCubit() : super(ShowMedicalRequestInitial());
  StreamSubscription<List<Map<String, dynamic>>>?
      showMedidicalRequestController;
  List<MedicalRequestModel> medicalRequests = [];
  List<FacCircularMenuPlusModel> menuItems = [
    FacCircularMenuPlusModel(
      route: RouteNames.addTicketScreen,
      icon: Icons.receipt,
      label: "Add Ticket",
    ),
    FacCircularMenuPlusModel(
      route: RouteNames.addTechnicianRequestScreen,
      icon: Icons.engineering,
      label: "Add Technician Request",
    ),
    FacCircularMenuPlusModel(
      icon: Icons.chat_bubble,
      route: RouteNames.chatScreen,
      label: "Chat With Geminai",
      args: "medical"
    ),
    FacCircularMenuPlusModel(
      route: RouteNames.signInScreen,
      icon: Icons.logout,
      label: "Sign Out",
    ),
  ];
  final medicalRequestController = TextEditingController();
  final reportController = TextEditingController();

  getMedicalRequest() {
    emit(ShowMedicalRequestLoading());
    showMedidicalRequestController =
        streamData(tableName: "medical_request").listen(
      (data) {
        medicalRequests =
            data.map((e) => MedicalRequestModel.fromJson(e)).toList();
        if (medicalRequests.isNotEmpty) {
          emit(
            ShowMedicalRequestSuccess(medicalRequestList: medicalRequests),
          );
        } else {
          emit(EmptyMedicalRequest());
        }
      },
      onError: (error) {
        emit(ShowMedicalRequestFailed(errorMessage: error.toString()));
      },
    );
  }

  updateMedicalRequestState({required String id}) async {
    if (medicalRequestController.text.isNotEmpty) {
      emit(LoadingMedicalRequestUploaded());
      try {
        await getIt<SupabaseClient>().from("medical_request").update({
          "state": medicalRequestController.text,
          if (reportController.text.isNotEmpty) "report": reportController.text
        }).eq("id", id);
        emit(UpdateMedicalRequest(
            message: 'Update request successfully'));
      } on Exception catch (e) {
        emit(DontUpdateMedicalRequest(message: "Error : $e"));
      }
    } else {
      emit(DontUpdateMedicalRequest(message: 'Nothing changed'));
    }
    medicalRequestController.clear();
  }
}
