import 'package:flutter/widgets.dart';
import 'package:smart_connect/core/utilies/extensions/app_extensions.dart';
import 'package:smart_connect/core/utilies/styles/app_text_styles.dart';
import 'package:smart_connect/features/auth/sign_up/views/widgets/custom_phone_number_text_form_field.dart';

class PhoneNumber extends StatelessWidget {
  const PhoneNumber({
    super.key,
    required this.controller,
  });
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: context.height * 0.005,
      children: [
        Text("Phone Number", style: AppTextStyles.title18PrimaryColorW500),
        CustomPhoneNumerTextFormField(
          controller: controller,
        ),
      ],
    );
  }
}
