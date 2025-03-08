import 'package:flutter/material.dart';
import 'package:smart_connect/core/utilies/assets/lotties/app_lotties.dart';
import 'package:smart_connect/features/splash/on_boarding_screen/view/widgets/custom_on_boarding_widget.dart';

class FastEfficientCommunication extends StatelessWidget {
  const FastEfficientCommunication({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomOnBoardingWidget(
      image: AppLotties.immediateResponsesLottie,
      title: "Fast & Efficient Communication!",
      description:
          "No more delays! Send maintenance, IT support, and medical assistance requests in seconds and receive immediate responses from the right team.",
    );
  }
}
