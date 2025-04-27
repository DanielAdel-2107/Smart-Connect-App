import 'package:flutter/material.dart';
import 'package:smart_connect/core/app_route/route_names.dart';
import 'package:smart_connect/features/auth/forget_password/views/screens/forget_password_screen.dart.dart';
import 'package:smart_connect/features/auth/sign_in/views/screens/sign_in_screen.dart';
import 'package:smart_connect/features/auth/sign_up/views/screens/sign_up_screen.dart';
import 'package:smart_connect/features/emergancy_screen/views/screens/emergency_screen.dart';
import 'package:smart_connect/features/it_support_screens/views/screens/it_support_screen.dart';
import 'package:smart_connect/features/medical_screens/show_medical_request/views/screens/show_medical_request_screen.dart';
import 'package:smart_connect/features/splash/on_boarding_screen/view/screens/on_boarding_screen.dart';
import 'package:smart_connect/features/splash/splash_screen/views/screens/splash_screen.dart';
import 'package:smart_connect/features/teacher_screens/add_medical_request/views/screens/add_medical_request_screen.dart';
import 'package:smart_connect/features/teacher_screens/add_technician_request/views/screens/technician_request_screen.dart';
import 'package:smart_connect/features/teacher_screens/add_ticket/views/screens/add_ticket_screen.dart';
import 'package:smart_connect/features/teacher_screens/chat/views/screens/chat_screen.dart';
import 'package:smart_connect/features/teacher_screens/create_meeting/views/screens/create_metting_screen.dart';
import 'package:smart_connect/features/teacher_screens/view_meeting/views/screens/view_meeting_screen.dart';
import 'package:smart_connect/features/technician_screens/views/screens/show_technician_request_screen.dart';

class AppRoutes {
  static Map<String, Widget Function(BuildContext)> routes =
      <String, WidgetBuilder>{
    RouteNames.splashScreen: (context) => const SplashScreen(),
    RouteNames.onBoardingScreen: (context) => const OnBoardingScreen(),
    RouteNames.signInScreen: (context) => const SignInScreen(),
    RouteNames.signUpScreen: (context) => const SignUpScreen(),
    RouteNames.forgetPasswordScreen: (context) => const ForgetPasswordScrren(),
    RouteNames.viewMeetingScreen: (context) => const ViewMeetingScreen(),
    RouteNames.createMeetingScreen: (context) => const CreateMeetingScreen(),
    RouteNames.addTicketScreen: (context) => const AddTicketScreen(),
    RouteNames.addMedicalRequestScreen: (context) =>
        const AddMedicalRequestScreen(),
    RouteNames.itSuppoetScreen: (context) => const ItSupportScreen(),
    RouteNames.showMedicalRequestScreen: (context) =>
        const ShowMedicalRequestScreen(),
    RouteNames.addTechnicianRequestScreen: (context) =>
        const TechnicianRequestScreen(),
    RouteNames.emergencyScreen: (context) => const EmergencyScreen(),
    RouteNames.showTechnicianRequestScreen: (context) =>
        const ShowTechnicianRequestScreen(),
    RouteNames.chatScreen: (context) =>
         ChatScreen(),

  };
}
