import 'package:flutter/material.dart';
import 'package:smart_connect/features/teacher_screens/add_ticket/views/widgets/add_ticket_screen_body.dart';

class AddTicketScreen extends StatelessWidget {
  const AddTicketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AddTicketScreenBody(),
    );
  }
}
