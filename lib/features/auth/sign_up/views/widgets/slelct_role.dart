import 'package:flutter/widgets.dart';
import 'package:smart_connect/core/components/custom_drop_down_button_form_field.dart';
import 'package:smart_connect/core/utilies/extensions/app_extensions.dart';
import 'package:smart_connect/core/utilies/styles/app_text_styles.dart';

class SelectRole extends StatelessWidget {
  const SelectRole({
    super.key,
    required this.controller,
  });
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: context.height * 0.001,
      children: [
        Text("Selct Role", style: AppTextStyles.title16PrimaryColorW500),
        CustomDropDownButtonFormField(
          controller: controller,
          userRoles: context.signUpCubit.userRoles,
        ),
      ],
    );
  }
}
