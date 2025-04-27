import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_connect/core/di/dependancy_injection.dart';
import 'package:smart_connect/core/utilies/extensions/app_extensions.dart';
import 'package:smart_connect/features/medical_screens/show_medical_request/view_models/show_medical_request_cubit/show_medical_request_cubit.dart';
import 'package:smart_connect/features/medical_screens/show_medical_request/views/widgets/show_medical_request_body.dart';
import 'package:smart_connect/features/teacher_screens/view_meeting/views/widgets/custom_fab_circular_menu_plus.dart';

class ShowMedicalRequestScreen extends StatelessWidget {
  const ShowMedicalRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<ShowMedicalRequestCubit>()..getMedicalRequest(),
      child: Scaffold(
        body: ShowMedicalRequestScreenBody(),
        floatingActionButton:
            BlocBuilder<ShowMedicalRequestCubit, ShowMedicalRequestState>(
          builder: (context, state) {
            return CustomFabCircularMenuPlus(
              menuItems: context.showMedicalRequestCubit.menuItems,
            );
          },
        ),
      ),
    );
  }
}
