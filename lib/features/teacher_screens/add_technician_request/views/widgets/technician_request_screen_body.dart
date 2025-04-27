import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_connect/core/components/custom_elevated_button.dart';
import 'package:smart_connect/core/helper/show_custom_dialog.dart';
import 'package:smart_connect/core/utilies/colors/app_colors.dart';
import 'package:smart_connect/core/utilies/extensions/app_extensions.dart';
import 'package:smart_connect/features/auth/sign_up/views/widgets/custom_title.dart';
import 'package:smart_connect/features/teacher_screens/add_technician_request/view_models/cubit/technician_request_cubit.dart';
import 'package:smart_connect/features/teacher_screens/add_technician_request/views/widgets/add_technician_request_form_fields.dart';

class TechnicianRequestScreenBody extends StatelessWidget {
  const TechnicianRequestScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.width * 0.05, vertical: context.height * 0.02),
        child: SingleChildScrollView(
          child: BlocProvider(
            create: (context) => AddTechnicianRequestCubit(),
            child: BlocConsumer<AddTechnicianRequestCubit, AddTechnicianRequestState>(
              listener: (context, state) {
                if (state is AddTechnicianRequestSuccess) {
                  Navigator.pop(context);
                  showCustomDialog(
                      title: "Success",
                      description: "Technician Request Added Successfully",
                      dialogType: DialogType.success);
                }
                if (state is AddTechnicianRequestFailed) {
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
                    const Center(child: CustomTitle(title: "Technician Request")),
                    SizedBox(height: context.height * 0.03),
                    const AddTechnicianRequestFormFields(),
                    SizedBox(height: context.height * 0.02),
                    state is AddTechnicianRequestLoading
                        ? Center(
                            child: CircularProgressIndicator(
                              color: AppColors.primaryColor,
                            ),
                          )
                        : Center(
                            child: CustomElevatedButton(
                              name: "Add Request",
                              onPressed: () {
                                context.addTechnicianRequestCubit.addTechnicianRequest();
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
