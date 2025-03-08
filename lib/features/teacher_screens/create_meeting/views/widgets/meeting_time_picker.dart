import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_connect/core/utilies/colors/app_colors.dart';
import 'package:smart_connect/core/utilies/extensions/app_extensions.dart';
import 'package:smart_connect/features/teacher_screens/create_meeting/view_models/creat_metting_cubit.dart';
import 'package:smart_connect/features/teacher_screens/create_meeting/views/widgets/time_picker_button.dart';

class MeetingTimePicker extends StatelessWidget {
  const MeetingTimePicker({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreatMettingCubit, CreatMettingState>(
      builder: (context, state) {
        final cubit = context.read<CreatMettingCubit>();
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TimePickerButton(
              title: "Start Time",
              selectedTime:cubit. selectedStartTime,
              onPressed: () {
                context.creatMettingCubit.pickTime(timeCycle: "start");
              },
            ),
            Icon(Icons.change_circle,
                color: AppColors.primaryColor, size: context.width * 0.1),
            TimePickerButton(
              title: "End Time",
              selectedTime:cubit.selectedEndTime,
              onPressed: () {
                context.creatMettingCubit.pickTime(timeCycle: "end");
              },
            ),
          ],
        );
      },
    );
  }
}
