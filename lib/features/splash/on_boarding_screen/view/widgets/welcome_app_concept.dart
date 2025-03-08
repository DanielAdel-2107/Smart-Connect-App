import 'package:flutter/material.dart';
import 'package:smart_connect/core/utilies/assets/lotties/app_lotties.dart';
import 'package:smart_connect/features/splash/on_boarding_screen/view/widgets/custom_on_boarding_widget.dart';

class WelcomeAppConcept extends StatelessWidget {
  const WelcomeAppConcept({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomOnBoardingWidget(
      image: AppLotties.welcomeLottie,
      title: "Welcome to Smart Connect!",
      description:
          "A smart application that connects teachers, IT staff, medical teams, and technicians to ensure fast and seamless response to all requests within the educational institution.",
    );
  }
}
