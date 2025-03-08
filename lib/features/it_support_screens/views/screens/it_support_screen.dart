import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_connect/core/di/dependancy_injection.dart';
import 'package:smart_connect/core/utilies/extensions/app_extensions.dart';
import 'package:smart_connect/features/it_support_screens/view_models/cubit/it_support_cubit.dart';
import 'package:smart_connect/features/it_support_screens/views/widgets/it_support_screen_body.dart';
import 'package:smart_connect/features/teacher_screens/view_meeting/views/widgets/custom_fab_circular_menu_plus.dart';

class ItSupportScreen extends StatelessWidget {
  const ItSupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ItSupportCubit>()..streamTickets(),
      child: Scaffold(
        body: ItSupportScreenBody(),
        floatingActionButton: BlocBuilder<ItSupportCubit, ItSupportState>(
          builder: (context, state) {
            return CustomFabCircularMenuPlus(
              menuItems: context.itSupportCubit.menuItems,
            );
          },
        ),
      ),
    );
  }
}
