import 'package:flutter/material.dart';

class CustomDropDownButtonFormField extends StatelessWidget {
  const CustomDropDownButtonFormField({
    super.key,
    required this.userRoles,
    this.controller, this.hintText ="Select Your Role",
  });
  final List<String> userRoles;
  final TextEditingController? controller;
  final String? hintText;
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      items: userRoles
          .map((e) => DropdownMenuItem(
                value: e,
                child: Text(e),
              ))
          .toList(),
      onChanged: (value) {
        controller!.text = value.toString();
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10),
        ),
        hintText: hintText,
        filled: true,
        fillColor: Colors.grey.withOpacity(0.2),
      ),
    );
  }
}
