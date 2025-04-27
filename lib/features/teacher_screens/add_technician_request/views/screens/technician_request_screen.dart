import 'package:flutter/material.dart';
import 'package:smart_connect/features/teacher_screens/add_technician_request/views/widgets/technician_request_screen_body.dart';

class TechnicianRequestScreen extends StatelessWidget {
  const TechnicianRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:TechnicianRequestScreenBody() ,   
    );
  }
}
