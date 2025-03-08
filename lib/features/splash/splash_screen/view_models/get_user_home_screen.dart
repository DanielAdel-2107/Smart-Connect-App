  import 'package:flutter/material.dart';
import 'package:smart_connect/core/app_route/route_names.dart';
import 'package:smart_connect/core/di/dependancy_injection.dart';
import 'package:smart_connect/core/helper/show_toast.dart';
import 'package:smart_connect/core/utilies/extensions/app_extensions.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

  Future<void> getUserHomeScreen({required BuildContext context}) async {
    try {
      String route = '';
      final supabase = getIt<SupabaseClient>();
      final response = await supabase
          .from("users")
          .select()
          .eq("id", supabase.auth.currentUser!.id)
          .single();
      switch (response["role"]) {
        case "Teacher":
          route = RouteNames.viewMeetingScreen;
          break;
        case "IT":
          route = RouteNames.itSuppoetScreen;
          break;
        case "Medical Staff":
          route = RouteNames.showMedicalRequestScreen;
        case "Technician":
          route = RouteNames.showTechnicianRequestScreen;
          break;
        case "Emergency Staff":
          route = RouteNames.emergencyScreen;
      }
      context.pushReplacementScreen(route);
    } on Exception catch (e) {
      showToast(body: e.toString(), title: "Error", type: '');
    }
  }
