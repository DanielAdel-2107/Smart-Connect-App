import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class CustomPhoneNumerTextFormField extends StatelessWidget {
  const CustomPhoneNumerTextFormField({
    super.key,
    required this.controller,
  });
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: MediaQuery.sizeOf(context).height * 0.008),
      child: IntlPhoneField(
        controller: controller,
        validator: (p0) {
          if (p0 == null || p0.number.isEmpty) {
            return "Please enter a valid phone number";
          }
          return null;
        },
        decoration: InputDecoration(
          labelText: 'Enter Phone Number',
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10),
          ),
          filled: true,
          fillColor: Colors.grey.withOpacity(0.2),
        ),
      ),
    );
  }
}
