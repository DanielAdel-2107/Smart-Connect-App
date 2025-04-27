import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_connect/core/components/custom_elevated_button.dart';
import 'package:smart_connect/core/components/custom_text_form_field_with_title.dart';
import 'package:smart_connect/core/helper/show_custom_dialog.dart';
import 'package:smart_connect/core/utilies/extensions/app_extensions.dart';
import 'package:smart_connect/features/auth/forget_password/view_models/forget_password_cubit.dart';

class ForgetPasswordScreenBody extends StatelessWidget {
  const ForgetPasswordScreenBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.sizeOf(context).width * 0.03,
          ),
          child: BlocProvider(
            create: (context) => ForgetPasswordCubit(),
            child: BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
              listener: (context, state) {
                if (state is ForgetPasswordSuccess) {
                  context.popScreen();
                  showCustomDialog(
                    title: "Password Reset",
                    description: "Check your email to reset your password",
                    dialogType: DialogType.success,
                  );
                }
                if (state is ForgetPasswordFailure) {
                  showCustomDialog(
                    title: "Failure",
                    description: state.errorMessage,
                    dialogType: DialogType.error,
                  );
                }
              },
              builder: (context, state) {
                return Form(
                  key: context.forgetPasswordCubit.formKey,
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * 0.05,
                      ),
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * 0.02,
                      ),
                      CustomTextFormFieldWithTitle(
                        hintText: "Enter Your Email",
                        title: "Email",
                        isPassword: true,
                        controller: context.forgetPasswordCubit.emailController,
                      ),
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * 0.05,
                      ),
                      CustomElevatedButton(
                        name: "Confirm",
                        onPressed: () {
                          context.forgetPasswordCubit.resetPassword();
                        },
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
