import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_connect/core/network/supabase/auth/change_password.dart';

part 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit() : super(ForgetPasswordInitial());
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  Future<void> resetPassword() async {
    if (formKey.currentState!.validate()) {
      try {
        emit(ForgetPasswordLoading());
        await forgetPassword(emailController.text);
        emit(ForgetPasswordSuccess());
      } on Exception catch (e) {
        emit(ForgetPasswordFailure(errorMessage: e.toString()));
      }
    }
  }
}
