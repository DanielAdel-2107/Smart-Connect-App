import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_connect/core/helper/show_snack_bar.dart';
import 'package:smart_connect/core/utilies/extensions/app_extensions.dart';
import 'package:smart_connect/features/it_support_screens/view_models/cubit/it_support_cubit.dart';
import 'package:smart_connect/features/it_support_screens/views/widgets/it_support_details_body.dart';
import 'package:smart_connect/features/teacher_screens/add_ticket/models/add_ticket_model.dart';

class ShowItSupportCardDetails extends StatelessWidget {
  const ShowItSupportCardDetails({
    super.key,
    required this.ticket,
  });
  final TicketModel ticket;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: BlocConsumer<ItSupportCubit,
          ItSupportState>(
        listener: (context, state) {
          if (state is TicketUpdateSuccess) {
            context.popScreen();
            showSnackBar(
                title: "Ticket Updated Successfully");
          }
          if (state is TicketUpdateFailed) {
            context.popScreen();
            showSnackBar(title: "No Changes Made");
          }
        },
        builder: (context, state) {
          return ItSupportDetailsBody(ticket: ticket,);
        },
      ),
    );
  }
}
