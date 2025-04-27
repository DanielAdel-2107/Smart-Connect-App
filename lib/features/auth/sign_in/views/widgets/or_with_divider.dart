import 'package:flutter/material.dart';

class OrWithDivider extends StatelessWidget {
  const OrWithDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Divider()),
        Padding(
          padding: EdgeInsets.symmetric(
              vertical: MediaQuery.sizeOf(context).height * 0.03,
              horizontal: MediaQuery.sizeOf(context).width * 0.02),
          child: Text("OR"),
        ),
        Expanded(child: Divider()),
      ],
    );
  }
}
