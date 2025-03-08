// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:smart_connect/core/di/dependancy_injection.dart';
import 'package:smart_connect/features/splash/splash_screen/view_models/get_user_home_screen.dart';
import 'package:smart_connect/features/splash/splash_screen/view_models/go_to_on_boarding_screen.dart';
import 'package:smart_connect/features/splash/splash_screen/views/widgets/splash_screen_body.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    if (getIt<SupabaseClient>().auth.currentUser != null) {
      getUserHomeScreen(context: context);
    } else {
      goToOnBoardingScreen(context: context);
    }
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SplashScreenBody(),
    );
  }
}
