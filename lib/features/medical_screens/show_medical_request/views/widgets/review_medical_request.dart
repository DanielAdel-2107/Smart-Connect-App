import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_connect/core/components/custom_drop_down_button_form_field.dart';
import 'package:smart_connect/core/components/custom_elevated_button.dart';
import 'package:smart_connect/core/components/custom_text_form_field_with_title.dart';
import 'package:smart_connect/core/helper/show_snack_bar.dart';
import 'package:smart_connect/core/utilies/colors/app_colors.dart';
import 'package:smart_connect/core/utilies/extensions/app_extensions.dart';
import 'package:smart_connect/core/utilies/styles/app_text_styles.dart';
import 'package:smart_connect/features/medical_screens/show_medical_request/view_models/show_medical_request_cubit/show_medical_request_cubit.dart';
import 'package:smart_connect/features/medical_screens/show_medical_request/views/widgets/row_data.dart';
import 'package:smart_connect/features/teacher_screens/add_medical_request/models/medical_request_model.dart';

class ReviewMedicalRequest extends StatelessWidget {
  const ReviewMedicalRequest({
    super.key,
    required this.medicalRequest,
  });
  final MedicalRequestModel medicalRequest;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShowMedicalRequestCubit, ShowMedicalRequestState>(
      listener: (context, state) {
        if (state is DontUpdateMedicalRequest) {
          context.popScreen();
          showSnackBar(title: state.message);
        }
        if (state is UpdateMedicalRequest) {
          context.popScreen();
          showSnackBar(title: state.message);
        }
      },
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.width * 0.02,
            vertical: context.height * 0.01,
          ),
          child: SingleChildScrollView(
            child: Column(
              spacing: context.height * 0.01,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    margin: EdgeInsets.symmetric(
                      vertical: context.height * 0.01,
                      horizontal: context.width * 0.02,
                    ),
                    decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(16)),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: context.width * 0.02,
                        vertical: context.height * 0.01,
                      ),
                      child: Text(
                        "Review Medical Request",
                        style: AppTextStyles.title18White,
                      ),
                    ),
                  ),
                ),
                RowData(title: "Title", value: medicalRequest.title),
                RowData(
                    title: "Description", value: medicalRequest.description),
                RowData(title: "User Name", value: medicalRequest.admin),
                RowData(title: "More Data", value: medicalRequest.moreData),
                RowData(
                  title: "Location",
                  value:
                      "${medicalRequest.longitude},${medicalRequest.latitude}",
                ),
                Text(
                  "Request Status",
                  style: AppTextStyles.title18PrimaryColorW500,
                ),
                CustomDropDownButtonFormField(
                        userRoles: ["Pending", "Approved", "Rejected"],
                        controller: context
                            .showMedicalRequestCubit.medicalRequestController,
                        hintText: medicalRequest.state,
                      ),
                CustomTextFormFieldWithTitle(
                  hintText: "add your report",
                  title: "Report",
                  controller: context.showMedicalRequestCubit.reportController,
                ),
               state is LoadingMedicalRequestUploaded
                    ? Center(
                        child: CircularProgressIndicator(
                        color: AppColors.primaryColor,
                      ))
                    :  CustomElevatedButton(
                  name: "Save",
                  onPressed: () {
                    context.showMedicalRequestCubit.updateMedicalRequestState(
                      id: medicalRequest.id,
                    );
                  },
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
