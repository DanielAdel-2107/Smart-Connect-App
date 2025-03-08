import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_connect/core/components/custom_elevated_button.dart';
import 'package:smart_connect/core/utilies/colors/app_colors.dart';
import 'package:smart_connect/core/utilies/extensions/app_extensions.dart';
import 'package:smart_connect/features/auth/sign_up/views/widgets/custom_title.dart';
import 'package:smart_connect/features/emergancy_screen/view_models/cubit/emergency_cubit.dart';
import 'package:smart_connect/features/emergancy_screen/views/widgets/emergency_screen_form_field.dart';

class EmergencyScreenbody extends StatelessWidget {
  const EmergencyScreenbody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EmergencyCubit(),
      child: BlocConsumer<EmergencyCubit, EmergencyState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var cubit = context.emergencyCubit;
          return SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: context.width * 0.05,
                vertical: context.height * 0.02,
              ),
              child: Form(
                key: cubit.formKey,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      CustomTitle(title: "Create Emergency"),
                      SizedBox(
                        height: context.height * 0.03,
                      ),
                      EmergencyScreenFormField(cubit: cubit),
                      state is EmergencyLoading
                          ? Center(
                              child: CircularProgressIndicator(
                                color: AppColors.primaryColor,
                              ),
                            )
                          : CustomElevatedButton(
                              name: "Add",
                              onPressed: () {
                                cubit.addEmergency();
                              },
                            )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
