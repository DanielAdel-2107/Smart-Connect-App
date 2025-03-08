import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_connect/core/components/custom_drop_down_button_form_field.dart';
import 'package:smart_connect/core/components/custom_elevated_button.dart';
import 'package:smart_connect/core/helper/show_snack_bar.dart';
import 'package:smart_connect/core/utilies/colors/app_colors.dart';
import 'package:smart_connect/core/utilies/extensions/app_extensions.dart';
import 'package:smart_connect/features/auth/sign_up/views/widgets/custom_title.dart';
import 'package:smart_connect/features/medical_screens/show_medical_request/views/widgets/row_data.dart';
import 'package:smart_connect/features/teacher_screens/add_technician_request/models/technician_request_model.dart';
import 'package:smart_connect/features/technician_screens/view_models/cubit/technician_request_cubit.dart';

class ShowTechnicianRequestDetails extends StatelessWidget {
  const ShowTechnicianRequestDetails({
    super.key,
    required this.request,
  });
  final TechnicianRequestModel request;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TechnicianRequestCubit, TechnicianRequestState>(
      listener: (context, state) {
        if (state is UpdateTechnicianRequestSuccess) {
          context.popScreen();
          showSnackBar(title: "State Updated Successfully");
        }
        if (state is UpdateTechnicianRequestFailed) {
          context.popScreen();
          showSnackBar(title: state.errorMessage);
        }
      },
      builder: (context, state) {
        return SafeArea(
          child: Dialog(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: context.width * 0.05,
                  vertical: context.height * 0.02),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    CustomTitle(title: "Technician request details"),
                    SizedBox(height: context.height * 0.02),
                    RowData(title: "User Name", value: request.admin),
                    RowData(title: "Title", value: request.title),
                    RowData(title: "Description", value: request.description),
                    RowData(title: "Type", value: request.type),
                    RowData(title: "Room Name", value: request.roomName),
                    RowData(title: "More Data", value: request.moreData),
                    CustomDropDownButtonFormField(
                      userRoles: ['Pending', 'In Progress', 'Completed'],
                      hintText: request.status,
                      controller:
                          context.technicianRequestCubit.stateController,
                    ),
                    SizedBox(
                      height: context.height * 0.02,
                    ),
                    state is UpdateTechnicianRequestLoading
                        ? Center(
                            child: CircularProgressIndicator(
                              color: AppColors.primaryColor,
                            ),
                          )
                        : CustomElevatedButton(
                            name: "Save",
                            onPressed: () {
                              context.technicianRequestCubit
                                  .updateTechnicianRequestState(id: request.id);
                            },
                          ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
