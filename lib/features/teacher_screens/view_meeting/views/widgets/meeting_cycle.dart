import 'package:flutter/material.dart';
import 'package:smart_connect/core/utilies/styles/app_text_styles.dart';

class MeetingCycle extends StatelessWidget {
  const MeetingCycle({
    super.key,
    required this.title,
    required this.value,
  });
  final String title;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: AppTextStyles.title16PrimaryColorW500,
        ),
        Text(
          value,
          style: AppTextStyles.title16GreyW500,
        ),
      ],
    );
  }
}
