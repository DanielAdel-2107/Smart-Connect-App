import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_connect/core/utilies/colors/app_colors.dart';
import 'package:smart_connect/core/utilies/extensions/app_extensions.dart';
import 'package:smart_connect/core/utilies/styles/app_text_styles.dart';
import 'package:smart_connect/features/auth/sign_up/views/widgets/custom_title.dart';
import 'package:smart_connect/features/teacher_screens/view_meeting/view_models/cubit/view_meeting_cubit.dart';
import 'package:smart_connect/features/teacher_screens/view_meeting/views/widgets/meeting_list_tile.dart';

class ViewMeetingScreenBody extends StatelessWidget {
  const ViewMeetingScreenBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.width * 0.05, vertical: context.height * 0.05),
        child: Column(
          children: [
            CustomTitle(title: "View Meetings"),
            SizedBox(
              height: context.height * 0.02,
            ),
            Expanded(
              child: BlocBuilder<ViewMeetingCubit, ViewMeetingState>(
                builder: (context, state) {
                  if (state is ViewMeetingLoading) {
                    return Center(
                        child: CircularProgressIndicator(
                      color: AppColors.primaryColor,
                    ));
                  } else if (state is ViewMeetingEmpty) {
                    return Center(child: Text("No meetings available!", style: AppTextStyles.title20PrimaryColorW500));
                  } else if (state is ViewMeetingFailed) {
                    return Center(child: Text("Error: ${state.errorMessage}"));
                  } else if (state is ViewMeetingSuccess) {
                    final cubit = context.viewMeetingCubit;
                    return ListView.builder(
                      itemCount: cubit.meetings.length,
                      itemBuilder: (context, index) => MeetingListTile(
                        meetingModel: cubit.meetings[index],
                      ),
                    );
                  }
                  return SizedBox();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
