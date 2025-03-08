import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_connect/core/di/dependancy_injection.dart';
import 'package:smart_connect/core/helper/open_dialog.dart';
import 'package:smart_connect/core/utilies/colors/app_colors.dart';
import 'package:smart_connect/core/utilies/extensions/app_extensions.dart';
import 'package:smart_connect/core/utilies/styles/app_text_styles.dart';
import 'package:smart_connect/features/medical_screens/show_medical_request/view_models/show_medical_request_cubit/show_medical_request_cubit.dart';
import 'package:smart_connect/features/medical_screens/show_medical_request/views/widgets/review_medical_request.dart';
import 'package:smart_connect/features/teacher_screens/add_medical_request/models/medical_request_model.dart';

class CustomMedicalRequestCard extends StatelessWidget {
  const CustomMedicalRequestCard({
    super.key,
    required this.medicalRequest,
  });

  final MedicalRequestModel medicalRequest;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(color: AppColors.primaryColor, width: 2),
      ),
      child: ListTile(
        title: Text(
          medicalRequest.title,
          style: AppTextStyles.title18PrimaryColorW500,
        ),
        subtitle: Text(
          medicalRequest.description,
          style: AppTextStyles.title16GreyW500,
        ),
        trailing: IconButton(
          onPressed: () {
            openDialog(
              context: context,
              widget: BlocProvider.value(
                value: getIt<ShowMedicalRequestCubit>()..getMedicalRequest(),
                child: SafeArea(
                  child: Dialog(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: context.height * 0.01,
                      ),
                      child: ReviewMedicalRequest(
                        medicalRequest: medicalRequest,
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
          icon: Icon(
            Icons.open_in_browser,
            color: AppColors.primaryColor,
          ),
        ),
      ),
    );
  }
}
