import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:smart_connect/core/utilies/extensions/app_extensions.dart';
import 'package:smart_connect/core/utilies/styles/app_text_styles.dart';

class CustomOnBoardingWidget extends StatelessWidget {
  const CustomOnBoardingWidget({
    super.key,
    required this.title,
    required this.description,
    required this.image,
  });
  final String title;
  final String description;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: context.height * 0.02,
      children: [
        Lottie.asset(image,
            width: context.width * 0.6, height: context.width * 0.6),
        Text(
          title,
          style: AppTextStyles.title24PrimaryColorW500,
          textAlign: TextAlign.center,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.width * 0.08,
          ),
          child: Text(
            description,
            style: AppTextStyles.title18GreyW500,
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }
}
