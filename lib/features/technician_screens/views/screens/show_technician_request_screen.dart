import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_connect/core/di/dependancy_injection.dart';
import 'package:smart_connect/core/utilies/extensions/app_extensions.dart';
import 'package:smart_connect/features/teacher_screens/view_meeting/views/widgets/custom_fab_circular_menu_plus.dart';
import 'package:smart_connect/features/technician_screens/view_models/cubit/technician_request_cubit.dart';
import 'package:smart_connect/features/technician_screens/views/widgets/show_technician_request_screen_body.dart';

class ShowTechnicianRequestScreen extends StatelessWidget {
  const ShowTechnicianRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<TechnicianRequestCubit>()..getTechnicianRequest(),
      child: Scaffold(
        body: ShowTechnicianRequestScreenBody(),
        floatingActionButton:
            BlocBuilder<TechnicianRequestCubit, TechnicianRequestState>(
          builder: (context, state) {
            return CustomFabCircularMenuPlus(
              menuItems: context.technicianRequestCubit.menuItems,
            );
          },
        ),
      ),
    );
  }
}
