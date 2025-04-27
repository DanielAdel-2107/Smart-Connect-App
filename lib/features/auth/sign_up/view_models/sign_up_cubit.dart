import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_connect/core/di/dependancy_injection.dart';
import 'package:smart_connect/core/network/supabase/auth/sign_up_with_password.dart';
import 'package:smart_connect/core/network/supabase/database/add_data.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());
  final formKey = GlobalKey<FormState>();
  final fristNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final roleController = TextEditingController();
  final passwordController = TextEditingController();

  List<String> userRoles = [
    "Teacher",
    "IT",
    "Medical Staff",
    "Technician",
    "Emergency Staff"
  ];
  Future<void> signUp() async {
    if (formKey.currentState!.validate()) {
      try {
        emit(SignUpLoading());
        await signUpWithPassword(
          email: emailController.text, password: passwordController.text);
        await addData(tableName: "users", data: {
              "id":getIt<SupabaseClient>().auth.currentUser!.id,
              "name":"${fristNameController.text} ${lastNameController.text}",
              "email": emailController.text,
              "phone": "0${phoneNumberController.text}",
              "role": roleController.text,              
            });
        emit(SignUpSuccess());
      } on Exception catch (e) {
        emit(SignUpFailure(errorMessage: e.toString()));
      }
    }
  }
}
