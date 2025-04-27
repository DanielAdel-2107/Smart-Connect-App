import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_connect/features/auth/forget_password/view_models/forget_password_cubit.dart';
import 'package:smart_connect/features/auth/sign_in/view_models/sign_in_cubit.dart';
import 'package:smart_connect/features/auth/sign_up/view_models/sign_up_cubit.dart';
import 'package:smart_connect/features/emergancy_screen/view_models/cubit/emergency_cubit.dart';
import 'package:smart_connect/features/it_support_screens/view_models/cubit/it_support_cubit.dart';
import 'package:smart_connect/features/medical_screens/show_medical_request/view_models/show_medical_request_cubit/show_medical_request_cubit.dart';
import 'package:smart_connect/features/teacher_screens/add_medical_request/view_models/cubit/add_medical_request_cubit.dart';
import 'package:smart_connect/features/teacher_screens/add_ticket/view_models/cubit/add_ticket_cubit.dart';
import 'package:smart_connect/features/teacher_screens/create_meeting/view_models/creat_metting_cubit.dart';
import 'package:smart_connect/features/teacher_screens/add_technician_request/view_models/cubit/technician_request_cubit.dart';
import 'package:smart_connect/features/teacher_screens/view_meeting/view_models/cubit/view_meeting_cubit.dart';
import 'package:smart_connect/features/technician_screens/view_models/cubit/technician_request_cubit.dart';

extension AppExtensions on BuildContext {
  //features/media query
  double get height => MediaQuery.of(this).size.height;
  double get width => MediaQuery.of(this).size.width;
  //features/auth/cubit
  SignUpCubit get signUpCubit => read<SignUpCubit>();
  SignInCubit get signInCubit => read<SignInCubit>();
  ForgetPasswordCubit get forgetPasswordCubit => read<ForgetPasswordCubit>();

  //features/teacher/cubit
  CreatMettingCubit get creatMettingCubit => read<CreatMettingCubit>();
  ViewMeetingCubit get viewMeetingCubit => read<ViewMeetingCubit>();
  AddTicketCubit get addTicketCubit => read<AddTicketCubit>();
  AddMedicalRequestCubit get addMedicalRequestCubit =>
      read<AddMedicalRequestCubit>();
  AddTechnicianRequestCubit get addTechnicianRequestCubit =>
      read<AddTechnicianRequestCubit>();
  //features/it suppoet
  ItSupportCubit get itSupportCubit => read<ItSupportCubit>();
  //features/medical request
  ShowMedicalRequestCubit get showMedicalRequestCubit =>
      read<ShowMedicalRequestCubit>();
  // features/emergancy
  EmergencyCubit get emergencyCubit => read<EmergencyCubit>();
  // features/Technician Request
  TechnicianRequestCubit get technicianRequestCubit =>
      read<TechnicianRequestCubit>();

  // navigation
  void pushScreen(String routeName, {Object? arguments}) {
    Navigator.of(this).pushNamed(
      routeName,
      arguments: arguments,
    );
  }

  void pushReplacementScreen(String routeName) {
    Navigator.of(this).pushReplacementNamed(routeName);
  }

  void pushAndRemoveUntilScreen(String routeName) {
    Navigator.of(this).pushNamedAndRemoveUntil(
      routeName,
      (route) => false,
    );
  }

  void popScreen() {
    if (Navigator.of(this).canPop()) {
      Navigator.of(this).pop();
    }
  }

  void popWithResult<T>(T result) {
    if (Navigator.of(this).canPop()) {
      Navigator.of(this).pop(result);
    }
  }

  bool canPopScreen() {
    return Navigator.of(this).canPop();
  }
}
