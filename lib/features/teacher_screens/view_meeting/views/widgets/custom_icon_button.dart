// ignore_for_file: use_build_context_synchronously
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:smart_connect/core/di/dependancy_injection.dart';
import 'package:smart_connect/core/helper/show_custom_dialog.dart';
import 'package:smart_connect/core/utilies/colors/app_colors.dart';
import 'package:smart_connect/core/utilies/extensions/app_extensions.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    required this.iconData,
    required this.route, required this.label,
  });
  final IconData iconData;
  final String route;
  final String label;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      style: IconButton.styleFrom(
        backgroundColor: AppColors.primaryColor,
        foregroundColor: Colors.white,
        padding: EdgeInsets.all(2),
      ),
      icon: Icon(iconData),
      onPressed: () async {
        iconData == Icons.logout
            ? showCustomDialog(
                title: "Logout",
                description: "Are you sure you want to logout?",
                dialogType: DialogType.question,
                btnOkOnPress: () async {
                  await getIt<SupabaseClient>().auth.signOut();
                  context.pushAndRemoveUntilScreen(route);
                },
              )
            : context.pushScreen(route);
      },
    );
  }
}
