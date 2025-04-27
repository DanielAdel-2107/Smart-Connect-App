import 'package:flutter/material.dart';
import 'package:smart_connect/app/my_app.dart';

showSnackBar({required String title}) {
  return ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
    SnackBar(
      content: Text(
        title,
      ),
    ),
  );
}
