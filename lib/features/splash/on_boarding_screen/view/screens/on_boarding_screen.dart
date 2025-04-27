import 'package:flutter/material.dart';
import 'package:smart_connect/core/app_route/route_names.dart';
import 'package:smart_connect/core/utilies/extensions/app_extensions.dart';
import 'package:smart_connect/features/splash/on_boarding_screen/view/widgets/custom_smooth_page_indecator.dart';
import 'package:smart_connect/features/splash/on_boarding_screen/view/widgets/fast_efficient_communication.dart';
import 'package:smart_connect/features/splash/on_boarding_screen/view/widgets/next_and_skip_button.dart';
import 'package:smart_connect/features/splash/on_boarding_screen/view/widgets/ready_for_emergencies.dart';
import 'package:smart_connect/features/splash/on_boarding_screen/view/widgets/welcome_app_concept.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final controller = PageController();
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: context.width * 0.05,
              vertical: context.height * 0.01),
          child: Column(
            children: [
              Expanded(
                child: PageView(
                  onPageChanged: (index) {
                    setState(() {
                      currentPage = index;
                    });
                  },
                  controller: controller,
                  children: [
                    WelcomeAppConcept(),
                    FastEfficientCommunication(),
                    ReadyForEmergencies(),
                  ],
                ),
              ),
              CustomSmoothPageIndicator(
                  controller: controller,
                  onDotClicked: (index) => controller.animateToPage(index,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOutCirc)),
              NextAndSkipButton(
                backActive: currentPage != 0,
                onPressedBack: () => controller.previousPage(
                  curve: Curves.ease,
                  duration: const Duration(seconds: 1),
                ),
                onPressedNext: () {
                  if (currentPage != 2) {
                    controller.nextPage(
                      curve: Curves.ease,
                      duration: const Duration(milliseconds: 500),
                    );
                  } else {
                    context.pushReplacementScreen(RouteNames.signInScreen);
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
