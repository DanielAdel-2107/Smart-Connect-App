import 'package:flutter/material.dart';
import 'package:smart_connect/core/utilies/styles/app_text_styles.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    this.onPressed,
    required this.title,
    this.style,
  });
  final Function()? onPressed;
  final String title;
  final TextStyle? style;
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        child: Text(
          title,
          style: style ?? AppTextStyles.title16SecondaryColorW500,
        ));
  }
}
