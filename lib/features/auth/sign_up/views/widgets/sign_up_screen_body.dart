import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_connect/core/components/custom_elevated_button.dart';
import 'package:smart_connect/core/components/custom_text_form_field_with_title.dart';
import 'package:smart_connect/core/helper/show_custom_dialog.dart';
import 'package:smart_connect/core/utilies/colors/app_colors.dart';
import 'package:smart_connect/core/utilies/extensions/app_extensions.dart';
import 'package:smart_connect/features/auth/sign_in/views/widgets/have_account_or_not.dart';
import 'package:smart_connect/features/auth/sign_up/view_models/sign_up_cubit.dart';
import 'package:smart_connect/features/auth/sign_up/views/widgets/custom_title.dart';
import 'package:smart_connect/features/auth/sign_up/views/widgets/phone_number.dart';
import 'package:smart_connect/features/auth/sign_up/views/widgets/slelct_role.dart';

class SignUpScreenBody extends StatelessWidget {
  const SignUpScreenBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.sizeOf(context).width * 0.03,
            vertical: MediaQuery.sizeOf(context).height * 0.02),
        child: SingleChildScrollView(
          child: BlocProvider(
            create: (context) => SignUpCubit(),
            child: BlocConsumer<SignUpCubit, SignUpState>(
              listener: (context, state) {
                if (state is SignUpSuccess) {
                  context
                      .popScreen();
                  showCustomDialog(
                      title: "Success",
                      description: "Sign Up Successfully",
                      dialogType: DialogType.success);
                }
                if (state is SignUpFailure) {
                  showCustomDialog(
                      title: "Failure",
                      description: state.errorMessage,
                      dialogType: DialogType.error);
                }
              },
              builder: (context, state) {
                return Form(
                  key: context.signUpCubit.formKey,
                  child: Column(
                    spacing: context.height * 0.003,
                    children: [
                      CustomTitle(
                        title: "Sign Up",
                      ),
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * 0.01,
                      ),
                      Row(
                        spacing: MediaQuery.sizeOf(context).width * 0.05,
                        children: [
                          Expanded(
                            child: CustomTextFormFieldWithTitle(
                              hintText: "Enter Your Name",
                              title: "Frist Name",
                              controller:
                                  context.signUpCubit.fristNameController,
                            ),
                          ),
                          Expanded(
                            child: CustomTextFormFieldWithTitle(
                              hintText: "Enter Your Name",
                              title: "Last Name",
                              controller:
                                  context.signUpCubit.lastNameController,
                            ),
                          ),
                        ],
                      ),
                      CustomTextFormFieldWithTitle(
                        hintText: "Enter Your Email",
                        title: "Email",
                        controller: context.signUpCubit.emailController,
                      ),
                      PhoneNumber(
                        controller: context.signUpCubit.phoneNumberController,
                      ),
                      SelectRole(
                        controller: context.signUpCubit.roleController,
                      ),
                      CustomTextFormFieldWithTitle(
                        hintText: "Enter Your Password",
                        title: "Password",
                        isPassword: true,
                        controller: context.signUpCubit.passwordController,
                      ),
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * 0.005,
                      ),
                      state is SignUpLoading
                          ? Center(
                              child: CircularProgressIndicator(
                              color: AppColors.primaryColor,
                            ))
                          : CustomElevatedButton(
                              name: "Sign Up",
                              backgroundColor: AppColors.primaryColor,
                              onPressed: () {
                                context.signUpCubit.signUp();
                              }),
                      HaveAccountOrNot(
                        btnName: "Sign In",
                        title: "have an account ?",
                        onPressed: () {
                          Navigator.pop(context);
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
    );
  }
}
