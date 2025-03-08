import 'package:flutter/material.dart';
import 'package:smart_connect/core/app_route/route_names.dart';

Future<Null> goToOnBoardingScreen({required BuildContext context}) {
  return Future.delayed(const Duration(seconds: 3), () {
    Navigator.pushReplacementNamed(context, RouteNames.onBoardingScreen);
  });
}
