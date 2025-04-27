import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

showToast({required String body, required String title, required String type}) {
  log(type.toString());
  Fluttertoast.showToast(
    msg: "$title\n$body",
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 2,
    backgroundColor: type == "Fire"
        ? Colors.red
        : type == "Lockdown"
            ? Colors.black
            : Colors.grey,
    textColor: Colors.white,
    fontSize: 18.0,
  );
}
