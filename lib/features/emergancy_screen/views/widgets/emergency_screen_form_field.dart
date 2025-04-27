import 'package:flutter/material.dart';
import 'package:smart_connect/core/components/custom_drop_down_button_form_field.dart';
import 'package:smart_connect/core/components/custom_text_form_field_with_title.dart';
import 'package:smart_connect/core/utilies/extensions/app_extensions.dart';
import 'package:smart_connect/core/utilies/styles/app_text_styles.dart';
import 'package:smart_connect/features/emergancy_screen/view_models/cubit/emergency_cubit.dart';

class EmergencyScreenFormField extends StatelessWidget {
  const EmergencyScreenFormField({
    super.key,
    required this.cubit,
  });
  final EmergencyCubit cubit;
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: context.height * 0.01,
      children: [
        CustomTextFormFieldWithTitle(
          hintText: "enter emergency title",
          title: "Emergency Title",
          controller: cubit.titleController,
        ),
        CustomTextFormFieldWithTitle(
          hintText: "enter emergency description",
          title: "Emergency Description",
          controller: cubit.description,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Emergency Type",
              style: AppTextStyles.title18PrimaryColorW500,
            ),
            CustomDropDownButtonFormField(
              userRoles: ["Fire", "Lockdown"],
              controller: cubit.emergencyType,
            ),
          ],
        ),
        CustomTextFormFieldWithTitle(
          hintText: "enter Location",
          title: "Location",
          controller: cubit.locationController,
        ),
        CustomTextFormFieldWithTitle(
          hintText: "enter more data if available",
          title: "More Data (optional)",
          controller: cubit.moreDataController,
        ),
        SizedBox(
          height: context.height * 0.02,
        ),
      ],
    );
  }
}
