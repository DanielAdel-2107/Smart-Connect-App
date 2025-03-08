import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_connect/core/components/custom_elevated_button.dart';
import 'package:smart_connect/core/helper/show_custom_dialog.dart';
import 'package:smart_connect/core/utilies/colors/app_colors.dart';
import 'package:smart_connect/core/utilies/extensions/app_extensions.dart';
import 'package:smart_connect/features/auth/sign_up/views/widgets/custom_title.dart';
import 'package:smart_connect/features/teacher_screens/add_ticket/view_models/cubit/add_ticket_cubit.dart';
import 'package:smart_connect/features/teacher_screens/add_ticket/views/widgets/ticket_form_fields.dart';

class AddTicketScreenBody extends StatelessWidget {
  const AddTicketScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.width * 0.05, vertical: context.height * 0.05),
        child: SingleChildScrollView(
          child: BlocProvider(
            create: (context) => AddTicketCubit(),
            child: BlocConsumer<AddTicketCubit, AddTicketState>(
              listener: (context, state) {
                if (state is AddTicketSuccess) {
                  Navigator.pop(context);
                  showCustomDialog(
                      title: "Success",
                      description: "Ticket Added Successfully",
                      dialogType: DialogType.success);
                }
                if (state is AddTicketFailed) {
                  showCustomDialog(
                      title: "Error",
                      description: state.errorMessage,
                      dialogType: DialogType.error);
                }
              },
              builder: (context, state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Center(child: CustomTitle(title: "Add Ticket")),
                    SizedBox(height: context.height * 0.05),
                    const TicketFormFields(),
                    SizedBox(height: context.height * 0.05),
                    state is AddTicketLoading
                        ? Center(
                            child: CircularProgressIndicator(
                              color: AppColors.primaryColor,
                            ),
                          )
                        : Center(
                            child: CustomElevatedButton(
                              name: "Add Ticket",
                              onPressed: () {
                                context.addTicketCubit.addticket();
                              },
                            ),
                          ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
