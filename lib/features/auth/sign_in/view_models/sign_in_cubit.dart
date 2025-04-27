import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_connect/core/app_route/route_names.dart';
import 'package:smart_connect/core/di/dependancy_injection.dart';
import 'package:smart_connect/core/network/supabase/auth/sign_in_with_password.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit() : super(SignInInitial());
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final supabase = getIt<SupabaseClient>();
  String route = "";
  Future<void> signIn() async {
    if (formKey.currentState!.validate()) {
      try {
        emit(SignInLoading());
        await signInWithPassword(
            email: emailController.text, password: passwordController.text);
        await getHomeScreen();
        emit(SignInSuccess(routeName: route, topic: route));
      } on Exception catch (e) {
        emit(SignInFailure(errorMessage: e.toString()));
      }
    }
  }

  Future<void> getHomeScreen() async {
    try {
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
    } on Exception catch (e) {
      log(e.toString());
    }
  }
}
