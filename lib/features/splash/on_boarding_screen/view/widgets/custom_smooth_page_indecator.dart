import 'package:flutter/material.dart';
import 'package:smart_connect/core/utilies/colors/app_colors.dart';
import 'package:smart_connect/core/utilies/extensions/app_extensions.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CustomSmoothPageIndicator extends StatelessWidget {
  const CustomSmoothPageIndicator({
    super.key,
    required this.controller,
    this.onDotClicked,
  });

  final PageController controller;
  final Function(int)? onDotClicked;
  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: controller,
      count: 3,
      onDotClicked: onDotClicked,
      effect: JumpingDotEffect(
        dotColor: Colors.grey.withOpacity(0.5),
        activeDotColor: AppColors.primaryColor,
        jumpScale: 2,
        verticalOffset: context.height * 0.05,
      ),
    );
  }
}
