import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:smart_connect/core/utilies/colors/app_colors.dart';
import 'package:smart_connect/core/utilies/extensions/app_extensions.dart';
import 'package:smart_connect/core/utilies/styles/app_text_styles.dart';
import 'package:smart_connect/features/teacher_screens/view_meeting/views/widgets/meeting_cycle.dart';

class MeetingTime extends StatelessWidget {
  const MeetingTime({
    super.key, required this.startTime, required this.endTime,
  });
  final String startTime;
  final String endTime;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        MeetingCycle(
          title: "Start",
          value: startTime,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: context.width * 0.04, vertical: context.height * 0.005),
          decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(16)), 
          child: Text(
            calculateMeetingDuration(startTime: startTime, endTime: endTime)+" h",
            style: AppTextStyles.title18White,
          ),
        ),
        MeetingCycle(
          title: "End",
          value: endTime,
        ),
      ],
    );
  }

  String calculateMeetingDuration({
    required String startTime,
    required String endTime,
  }) {
    DateFormat format = DateFormat('hh:mm a');
    DateTime time1 = format.parse(startTime);
    DateTime time2 = format.parse(endTime);
    Duration difference = time2.difference(time1);
    int hours = difference.inHours;
    int minutes = difference.inMinutes.remainder(60);
    return '$hours:$minutes';
  }
}
