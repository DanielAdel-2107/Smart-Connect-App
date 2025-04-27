import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:smart_connect/core/utilies/assets/images/app_images.dart';

class SplashScreenBody extends StatelessWidget {
  const SplashScreenBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(AppImages.logo)
              .animate()
              .fadeIn(duration: 600.ms)
              .then(delay: 200.ms)
              .slide(),
        ],
      ),
    );
  }
}
