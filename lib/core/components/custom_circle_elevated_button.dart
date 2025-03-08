import 'package:flutter/material.dart';
import 'package:smart_connect/core/utilies/colors/app_colors.dart';
import 'package:smart_connect/core/utilies/extensions/app_extensions.dart';

class CustomCircleElevatedButton extends StatelessWidget {
  const CustomCircleElevatedButton({
    super.key, required this.icon, this.onPressed,
  });
  final IconData icon;
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: context.width * 0.05),
        backgroundColor: AppColors.primaryColor,
        shape: CircleBorder(),
      ),
      child: Icon(
        icon,
        size: context.width * 0.05,
        color: Colors.white,
      ),
    );
  }
}
