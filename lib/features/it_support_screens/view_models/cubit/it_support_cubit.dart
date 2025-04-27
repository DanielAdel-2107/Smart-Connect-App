// ignore_for_file: unused_field

import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_connect/core/app_route/route_names.dart';
import 'package:smart_connect/core/di/dependancy_injection.dart';
import 'package:smart_connect/core/network/supabase/database/get_stream_data.dart';
import 'package:smart_connect/features/teacher_screens/add_ticket/models/add_ticket_model.dart';
import 'package:smart_connect/features/teacher_screens/view_meeting/models/fac_circular_menu_plus_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
part 'it_support_state.dart';

class ItSupportCubit extends Cubit<ItSupportState> {
  ItSupportCubit() : super(ItSupportInitial());
  StreamSubscription<List<Map<String, dynamic>>>? _ticketSubscription;
  List<TicketModel> tickets = [];
  final stateController = TextEditingController();
  List<FacCircularMenuPlusModel> menuItems = [
    FacCircularMenuPlusModel(
        label: 'Medical request',
        icon: Icons.medical_services,
        route: RouteNames.addMedicalRequestScreen),
    FacCircularMenuPlusModel(
        label: 'Technical support',
        icon: Icons.engineering,
        route: RouteNames.addTechnicianRequestScreen),
        FacCircularMenuPlusModel(
      icon: Icons.chat_bubble,
      route: RouteNames.chatScreen,
      label: "Chat With Geminai",
      args: "it"
    ),
    FacCircularMenuPlusModel(
        label: 'Logout', icon: Icons.logout, route: RouteNames.signInScreen),
  ];
  ///////////////////////////
  void streamTickets() {
    emit(ItSupportLoading());
    _ticketSubscription = streamData(tableName: "tickets").listen(
      (data) {
        tickets = data.map((e) => TicketModel.fromJson(e)).toList();
        if (tickets.isNotEmpty) {
          emit(ItSupportSuccess());
        } else {
          emit(ItSupportEmpty());
        }
      },
      onError: (error) {
        emit(ItSupportFailed(errorMessage: error.toString()));
      },
    );
  }

  ///////////////////
  Future<void> updateTicketStatus({required String id}) async {
    if (stateController.text.isNotEmpty) {
      try {
        emit(TicketUpdateLoading());
        await getIt<SupabaseClient>().from('tickets').update({
          "status": stateController.text,
        }).eq("id", id);
        emit(TicketUpdateSuccess());
      } on Exception catch (e) {
        log(e.toString());
        emit(TicketUpdateFailed(errorMessage: e.toString()));
      }
    } else {
      emit(TicketUpdateFailed(errorMessage: "No Changes Made"));
    }
    stateController.clear();
  }
}
