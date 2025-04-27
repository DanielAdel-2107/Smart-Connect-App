import 'package:flutter/material.dart';
import 'package:smart_connect/core/components/custom_text_form_field_with_title.dart';
import 'package:smart_connect/core/utilies/extensions/app_extensions.dart';

class MedicalRequestFormFields extends StatelessWidget {
  const MedicalRequestFormFields({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.addMedicalRequestCubit.formKey,
      child: Column(
        children:  [
          CustomTextFormFieldWithTitle(
            hintText: "Enter your name",
            title: "Your Name",
            controller: context.addMedicalRequestCubit.nameController,
          ),
          CustomTextFormFieldWithTitle(
            hintText: "Enter request title",
            title: "Request Title",
            controller: context.addMedicalRequestCubit.titleController,      
          ),
          CustomTextFormFieldWithTitle(
            hintText: "Enter request description",
            title: "Request Description",
            controller: context.addMedicalRequestCubit.descriptionController,      
          ),
          CustomTextFormFieldWithTitle(
            hintText: "Enter More data if available",
            title: "More Data",
            maxLines: 3,
            controller: context.addMedicalRequestCubit.moreDataController,      
          ),
        ],
      ),
    );
  }
}