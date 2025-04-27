import 'package:flutter/material.dart';
import 'package:smart_connect/core/components/custom_circle_elevated_button.dart';
import 'package:smart_connect/core/utilies/colors/app_colors.dart';
import 'package:smart_connect/core/utilies/extensions/app_extensions.dart';
import 'package:smart_connect/core/utilies/styles/app_text_styles.dart';
import 'package:smart_connect/features/teacher_screens/view_meeting/models/meeting_model.dart';
import 'package:smart_connect/features/teacher_screens/view_meeting/views/widgets/meeting_time.dart';

class MeetingListTile extends StatelessWidget {
  const MeetingListTile({
    super.key, required this.meetingModel,
  });
  final MeetingModel meetingModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: context.height * 0.04),
      child: ListTile(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: BorderSide(color: AppColors.primaryColor, width: 2)),
        title: Text(
          meetingModel.meetingName,
          style: AppTextStyles.title20PrimaryColorW500,
        ),
        subtitle: Padding(
          padding: EdgeInsets.symmetric(vertical: context.height * 0.01, horizontal: context.width * 0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: context.height * 0.02,
            children: [
              MeetingTime(
                endTime: meetingModel.endTime,
                startTime: meetingModel.startTime,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    spacing: context.height * 0.005,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        meetingModel.date,
                        style: AppTextStyles.title16Black500,
                      ),
                      Text(
                        meetingModel.meetingdescription,
                        style: AppTextStyles.title16Black500,
                      ),
                      Text(
                        "Created By ${meetingModel.adminName}",
                        style: AppTextStyles.title16Black500,
                      ),
                    ],
                  ),
                  CustomCircleElevatedButton(
                    icon: Icons.info,
                    onPressed: () {}
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

