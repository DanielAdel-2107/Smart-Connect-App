import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_connect/core/components/custom_elevavted_button_with_title.dart';
import 'package:smart_connect/core/utilies/extensions/app_extensions.dart';
import 'package:smart_connect/core/utilies/styles/app_text_styles.dart';
import 'package:smart_connect/features/teacher_screens/create_meeting/view_models/creat_metting_cubit.dart';

class MeetingDatePicker extends StatelessWidget {
  const MeetingDatePicker({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreatMettingCubit, CreatMettingState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Meeting Date", style: AppTextStyles.title18PrimaryColorW500),
            state is SelectDateState
                ? Text(
                    state.selectedDateTime,
                    style: AppTextStyles.title16GreyW500,
                  )
                : CustomElevatedButtonWithIcon(
                    title: "Select Date",
                    onPressed: () {
                      context.creatMettingCubit.pickDate();
                    },
                    icon: Icons.calendar_month_outlined,
                  ),
          ],
        );
      },
    );
  }
}
