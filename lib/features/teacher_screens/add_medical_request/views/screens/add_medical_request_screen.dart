import 'package:flutter/material.dart';
import 'package:smart_connect/features/teacher_screens/add_medical_request/views/widgets/add_medical_screen_body.dart';

class AddMedicalRequestScreen extends StatelessWidget {
  const AddMedicalRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:AddMedicalRequestScreenBody() ,   
    );
  }
}
