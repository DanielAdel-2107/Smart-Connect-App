import 'package:flutter/material.dart';
import 'package:smart_connect/core/components/custom_text_form_field_with_title.dart';
import 'package:smart_connect/core/utilies/extensions/app_extensions.dart';

class AddTechnicianRequestFormFields extends StatelessWidget {
  const AddTechnicianRequestFormFields({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.addTechnicianRequestCubit.formKey,
      child: Column(
        children:  [
          CustomTextFormFieldWithTitle(
            hintText: "Enter your name",
            title: "Your Name",
            controller: context.addTechnicianRequestCubit.nameController,
          ),
          CustomTextFormFieldWithTitle(
            hintText: "Enter request title",
            title: "Request Title",
            controller: context.addTechnicianRequestCubit.titleController,      
          ),
          CustomTextFormFieldWithTitle(
            hintText: "Enter request description",
            title: "Request Description",
            controller: context.addTechnicianRequestCubit.descriptionController,      
          ),
          CustomTextFormFieldWithTitle(
            hintText: "Enter request type",
            title: "Request Type",
            controller: context.addTechnicianRequestCubit.typeController,      
          ),CustomTextFormFieldWithTitle(
            hintText: "Enter where the issue occurred",
            title: "Room Name",
            controller: context.addTechnicianRequestCubit.roomNameController,      
          ),
          CustomTextFormFieldWithTitle(
            hintText: "Enter More data if available",
            title: "More Data",
            maxLines: 3,
            controller: context.addTechnicianRequestCubit.moreDataController,      
          ),
        ],
      ),
    );
  }
}