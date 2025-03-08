import 'package:flutter/material.dart';
import 'package:smart_connect/core/components/custom_text_form_field_with_title.dart';
import 'package:smart_connect/core/utilies/extensions/app_extensions.dart';

class TicketFormFields extends StatelessWidget {
  const TicketFormFields({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.addTicketCubit.formKey,
      child: Column(
        children:  [
          CustomTextFormFieldWithTitle(
            hintText: "Enter your name",
            title: "Your Name",
            controller: context.addTicketCubit.adminController,
          ),
          CustomTextFormFieldWithTitle(
            hintText: "Enter issue title",
            title: "Issue Title",
            controller: context.addTicketCubit.nameController,      
          ),
          CustomTextFormFieldWithTitle(
            hintText: "Enter Issue description",
            title: "Issue Description",
            controller: context.addTicketCubit.descriptionController,      
          ),
          CustomTextFormFieldWithTitle(
            hintText: "Enter where the issue occurred",
            title: "Room Name",
            controller: context.addTicketCubit.roomNameController,      
          ),
          CustomTextFormFieldWithTitle(
            hintText: "Enter More data if available",
            title: "More Data",
            maxLines: 3,
            controller: context.addTicketCubit.moreDataController,      
          ),
        ],
      ),
    );

  }
}