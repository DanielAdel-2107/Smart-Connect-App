import 'package:flutter/material.dart';
import 'package:smart_connect/features/splash/on_boarding_screen/view/widgets/on_borading_screen_elevated_button.dart';

class NextAndSkipButton extends StatelessWidget {
  const NextAndSkipButton({
    super.key,
    required this.backActive,
    this.onPressedNext,
    this.onPressedBack,
  });
  final bool backActive;
  final Function()? onPressedNext, onPressedBack;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        OnBoardingElevatedButton(
          title: 'Back',
          onPressed: onPressedBack,
          active: backActive,
        ),
        OnBoardingElevatedButton(
          title: 'Next',
          active: true,
          onPressed: onPressedNext,
        ),
      ],
    );
  }
}
