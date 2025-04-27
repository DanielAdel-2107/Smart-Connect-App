import 'package:flutter/material.dart';
import 'package:smart_connect/core/components/custom_elevavted_button_with_title.dart';
import 'package:smart_connect/core/utilies/colors/app_colors.dart';
import 'package:smart_connect/core/utilies/styles/app_text_styles.dart';

class TimePickerButton extends StatelessWidget {
  final String title;
  final String? selectedTime;
  final VoidCallback onPressed;

  const TimePickerButton({
    super.key,
    required this.title,
    required this.selectedTime,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title, style: AppTextStyles.title18PrimaryColorW500),
        selectedTime != null
            ? Row(
                children: [
                  Text(selectedTime!, style: AppTextStyles.title16GreyW500),
                  IconButton(
                    onPressed: onPressed,
                    icon: Icon(Icons.edit, color: AppColors.primaryColor),
                  ),
                ],
              )
            : CustomElevatedButtonWithIcon(
                title: "Pick",
                onPressed: onPressed,
                icon: Icons.access_time,
              ),
      ],
    );
  }
}
