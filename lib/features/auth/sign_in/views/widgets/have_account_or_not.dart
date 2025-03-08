import 'package:flutter/material.dart';
import 'package:smart_connect/core/components/custom_text_button.dart';
import 'package:smart_connect/core/utilies/styles/app_text_styles.dart';

class HaveAccountOrNot extends StatelessWidget {
  const HaveAccountOrNot({
    super.key,
    required this.title,
    required this.btnName,
    this.onPressed,
  });
  final String title;
  final String btnName;
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: AppTextStyles.title16Black500,
        ),
        CustomTextButton(onPressed: onPressed, title: btnName)
      ],
    );
  }
}
