import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_connect/core/utilies/extensions/app_extensions.dart';
import 'package:smart_connect/features/teacher_screens/view_meeting/view_models/cubit/view_meeting_cubit.dart';
import 'package:smart_connect/features/teacher_screens/view_meeting/views/widgets/custom_fab_circular_menu_plus.dart';
import 'package:smart_connect/features/teacher_screens/view_meeting/views/widgets/view_meeting_screen_body.dart';

class ViewMeetingScreen extends StatelessWidget {
  const ViewMeetingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ViewMeetingCubit()..streamMeetings(),
      child: Scaffold(
        body: ViewMeetingScreenBody(),
        floatingActionButton: BlocBuilder<ViewMeetingCubit, ViewMeetingState>(
          builder: (context, state) {
            return CustomFabCircularMenuPlus(
              menuItems: context.viewMeetingCubit.menuItems,
            );
          },
        ),
      ),
    );
  }
}
