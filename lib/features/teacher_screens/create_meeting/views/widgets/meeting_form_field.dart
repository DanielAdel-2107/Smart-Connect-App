import 'package:flutter/material.dart';
import 'package:smart_connect/core/components/custom_text_form_field_with_title.dart';
import 'package:smart_connect/core/utilies/extensions/app_extensions.dart';

class MeetingFormFields extends StatelessWidget {
  const MeetingFormFields({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.creatMettingCubit.formKey,
      child: Column(
        children:  [
          CustomTextFormFieldWithTitle(
            hintText: "Enter your name",
            title: "Your Name",
            controller: context.creatMettingCubit.adminController,
          ),
          CustomTextFormFieldWithTitle(
            hintText: "Enter meeting title",
            title: "Meeting Title",
            controller: context.creatMettingCubit.nameController,      
          ),
          CustomTextFormFieldWithTitle(
            hintText: "Enter meeting description",
            title: "Meeting Description",
            controller: context.creatMettingCubit.descriptionController,      
          ),
        ],
      ),
    );
  }
}
