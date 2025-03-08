import 'package:flutter/material.dart';
import 'package:smart_connect/core/app_route/route_names.dart';
import 'package:smart_connect/core/di/dependancy_injection.dart';
import 'package:smart_connect/core/utilies/colors/app_colors.dart';
import 'package:smart_connect/core/utilies/extensions/app_extensions.dart';
import 'package:smart_connect/features/emergancy_screen/views/widgets/emergency_screen_body.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class EmergencyScreen extends StatelessWidget {
  const EmergencyScreen({super.key});

  @override
  Widget build(BuildContext context) {    
    return Scaffold(
      body: EmergencyScreenbody(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primaryColor,
        onPressed: () async {
          await getIt<SupabaseClient>().auth.signOut();
          context.pushAndRemoveUntilScreen(RouteNames.signInScreen);
        },
        child: Icon(
          Icons.logout,
          color: Colors.white,
        ),
      ),
    );
  }
}
