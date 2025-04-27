// ignore_for_file: use_build_context_synchronously

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_connect/core/app_route/route_names.dart';
import 'package:smart_connect/core/components/custom_elevated_button.dart';
import 'package:smart_connect/core/components/custom_text_form_field_with_title.dart';
import 'package:smart_connect/core/di/dependancy_injection.dart';
import 'package:smart_connect/core/helper/show_custom_dialog.dart';
import 'package:smart_connect/core/notifications/fcm_notification.dart';
import 'package:smart_connect/core/utilies/colors/app_colors.dart';
import 'package:smart_connect/core/utilies/constants/app_strings.dart';
import 'package:smart_connect/core/utilies/extensions/app_extensions.dart';
import 'package:smart_connect/features/auth/sign_in/view_models/sign_in_cubit.dart';
import 'package:smart_connect/features/auth/sign_in/views/widgets/forget_password.dart';
import 'package:smart_connect/features/auth/sign_in/views/widgets/have_account_or_not.dart';
import 'package:smart_connect/features/auth/sign_up/views/widgets/custom_title.dart';

class SignInScreenBody extends StatelessWidget {
  const SignInScreenBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.sizeOf(context).width * 0.03,
            vertical: MediaQuery.sizeOf(context).height * 0.03),
        child: Center(
          child: SingleChildScrollView(
            child: BlocProvider(
              create: (context) => SignInCubit(),
              child: BlocConsumer<SignInCubit, SignInState>(
                listener: (context, state) async {
                  if (state is SignInSuccess) {
                    await getIt<NotificationsHelper>()
                        .subscribeToTopic(topic: state.topic);
                    await getIt<NotificationsHelper>()
                        .subscribeToTopic(topic: AppStrings.emergancyTopic);
                    context.pushAndRemoveUntilScreen(state.routeName);
                    showCustomDialog(
                        title: "Success",
                        description: "Sign In Successfully",
                        dialogType: DialogType.success);
                  }
                  if (state is SignInFailure) {
                    showCustomDialog(
                        title: "Failure",
                        description: state.errorMessage,
                        dialogType: DialogType.error);
                  }
                },
                builder: (context, state) {
                  return Form(
                    key: context.signInCubit.formKey,
                    child: Column(
                      children: [
                        CustomTitle(title: "Sign In"),
                        SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.07,
                        ),
                        CustomTextFormFieldWithTitle(
                          hintText: "Enter Your Email",
                          title: "Email",
                          controller: context.signInCubit.emailController,
                        ),
                        SizedBox(height: 10),
                        CustomTextFormFieldWithTitle(
                          hintText: "Enter Your Password",
                          title: "Password",
                          isPassword: true,
                          controller: context.signInCubit.passwordController,
                        ),
                        ForgetPassword(
                          onPressed: () {
                            context.pushScreen(RouteNames.forgetPasswordScreen);
                          },
                        ),
                        state is SignInLoading
                            ? Center(
                                child: CircularProgressIndicator(
                                color: AppColors.primaryColor,
                              ))
                            : CustomElevatedButton(
                                name: "Sign In",
                                onPressed: () {
                                  context.signInCubit.signIn();
                                },
                                backgroundColor: AppColors.primaryColor,
                              ),
                        SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.02,
                        ),
                        HaveAccountOrNot(
                          btnName: "Sign Up",
                          title: "Don't have an account ?",
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              RouteNames.signUpScreen,
                            );
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
