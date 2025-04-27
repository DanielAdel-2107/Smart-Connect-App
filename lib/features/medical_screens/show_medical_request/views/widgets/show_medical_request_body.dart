import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_connect/core/utilies/colors/app_colors.dart';
import 'package:smart_connect/core/utilies/extensions/app_extensions.dart';
import 'package:smart_connect/core/utilies/styles/app_text_styles.dart';
import 'package:smart_connect/features/auth/sign_up/views/widgets/custom_title.dart';
import 'package:smart_connect/features/medical_screens/show_medical_request/view_models/show_medical_request_cubit/show_medical_request_cubit.dart';
import 'package:smart_connect/features/medical_screens/show_medical_request/views/widgets/custom_medical_request_card.dart';

class ShowMedicalRequestScreenBody extends StatelessWidget {
  const ShowMedicalRequestScreenBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: context.width * 0.08,
          vertical: context.height * 0.03,
        ),
        child: Column(
          children: [
            CustomTitle(title: "Medical Request"),
            BlocConsumer<ShowMedicalRequestCubit,
                ShowMedicalRequestState>(
              listener: (context, state) {
              },
              builder: (context, state) {
                if (state is ShowMedicalRequestLoading) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primaryColor,
                    ),
                  );
                }
                if (state is ShowMedicalRequestFailed) {
                  return Center(
                    child: Text(state.errorMessage),
                  );
                }
                if (state is EmptyMedicalRequest) {
                  return Center(
                    child: Text(
                      "No medical request found.",
                      style: AppTextStyles.title20PrimaryColorW500,
                    ),
                  );
                }
                return Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.symmetric(
                      vertical: context.height * 0.02,
                    ),
                    itemCount: context
                        .showMedicalRequestCubit.medicalRequests.length,
                    itemBuilder: (context, index) {
                      var medicalRequest = context
                          .showMedicalRequestCubit.medicalRequests[index];
                      return CustomMedicalRequestCard(
                        medicalRequest: medicalRequest,
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
