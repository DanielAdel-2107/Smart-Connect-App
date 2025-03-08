import 'package:flutter/material.dart';
import 'package:smart_connect/features/teacher_screens/create_meeting/views/widgets/create_metting_screen_body.dart';

class CreateMeetingScreen extends StatelessWidget {
  const CreateMeetingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CreateMeetingScreenBody(),
    );
  }
}
