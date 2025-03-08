import 'package:flutter/material.dart';
import 'package:smart_connect/core/utilies/colors/app_colors.dart';
import 'package:smart_connect/core/utilies/extensions/app_extensions.dart';
import 'package:smart_connect/core/utilies/styles/app_text_styles.dart';

class OnBoardingElevatedButton extends StatelessWidget {
  const OnBoardingElevatedButton({
    super.key,
    required this.title,
    this.onPressed,
    required this.active,
  });
  final String title;
  final Function()? onPressed;
  final bool active;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor:
            active ? AppColors.primaryColor : Colors.grey.withOpacity(0.7),
        padding: EdgeInsets.symmetric(horizontal: context.width * 0.01, vertical: context.height * 0.01),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      onPressed: active ? onPressed : () {},
      child: Text(
        title,
        style: AppTextStyles.title18White,
      ),
    );
  }
}
