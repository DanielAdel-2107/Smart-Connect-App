import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_connect/core/components/custom_elevated_button.dart';
import 'package:smart_connect/core/helper/show_custom_dialog.dart';
import 'package:smart_connect/core/utilies/colors/app_colors.dart';
import 'package:smart_connect/core/utilies/extensions/app_extensions.dart';
import 'package:smart_connect/features/auth/sign_up/views/widgets/custom_title.dart';
import 'package:smart_connect/features/teacher_screens/create_meeting/view_models/creat_metting_cubit.dart';
import 'package:smart_connect/features/teacher_screens/create_meeting/views/widgets/meeting_date_picker.dart';
import 'package:smart_connect/features/teacher_screens/create_meeting/views/widgets/meeting_form_field.dart';
import 'package:smart_connect/features/teacher_screens/create_meeting/views/widgets/meeting_time_picker.dart';

class CreateMeetingScreenBody extends StatelessWidget {
  const CreateMeetingScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreatMettingCubit(),
      child: BlocConsumer<CreatMettingCubit, CreatMettingState>(
        listener: (context, state) {
          if (state is CreatMettingSuccess) {
            context.popScreen();
            showCustomDialog(
                title: "Success",
                description: "Meeting Created Successfully",
                dialogType: DialogType.success);
          }
          if (state is CreatMettingFailed) {
            showCustomDialog(
                title: "Error",
                description: state.errorMessage,
                dialogType: DialogType.error);
          }
        },
        builder: (context, state) {
          return SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: context.width * 0.05, vertical: context.height * 0.05),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Center(child: CustomTitle(title: "Create Meeting")),
                    SizedBox(height: context.height * 0.03),
                    const MeetingFormFields(),
                    SizedBox(height: context.height * 0.02),
                    const MeetingDatePicker(),
                    SizedBox(height: context.height * 0.02),
                    const MeetingTimePicker(),
                    SizedBox(height: context.height * 0.02),
                    state is CreatMettingLoading
                        ? Center(
                            child: CircularProgressIndicator(
                            color: AppColors.primaryColor,
                          ))
                        : Center(
                            child: CustomElevatedButton(
                                name: "Add Meeting",
                                onPressed: () {
                                  context.creatMettingCubit.addMeeting();
                                }),
                          ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
