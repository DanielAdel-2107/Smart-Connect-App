import 'package:flutter/material.dart';
import 'package:smart_connect/core/utilies/assets/lotties/app_lotties.dart';
import 'package:smart_connect/features/splash/on_boarding_screen/view/widgets/custom_on_boarding_widget.dart';

class ReadyForEmergencies extends StatelessWidget {
  const ReadyForEmergencies({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomOnBoardingWidget(
        image: AppLotties.emergenciesLottie,
        title: "Ready for Emergencies!",
        description:
            "In critical situations, every second matters! Smart Connect ensures instant alerts to the right teams, enabling quick actions to keep everyone safe.",
      ),
    );
  }
}
