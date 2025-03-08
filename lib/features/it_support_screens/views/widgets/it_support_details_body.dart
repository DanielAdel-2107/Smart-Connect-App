import 'package:flutter/material.dart';
import 'package:smart_connect/core/components/custom_drop_down_button_form_field.dart';
import 'package:smart_connect/core/components/custom_elevated_button.dart';
import 'package:smart_connect/core/utilies/colors/app_colors.dart';
import 'package:smart_connect/core/utilies/extensions/app_extensions.dart';
import 'package:smart_connect/core/utilies/styles/app_text_styles.dart';
import 'package:smart_connect/features/medical_screens/show_medical_request/views/widgets/row_data.dart';
import 'package:smart_connect/features/teacher_screens/add_ticket/models/add_ticket_model.dart';

class ItSupportDetailsBody extends StatelessWidget {
  const ItSupportDetailsBody({
    super.key,
    required this.ticket,
  });

  final TicketModel ticket;

  @override
  Widget build(BuildContext context) {
    var cubit = context.itSupportCubit;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: context.width * 0.03,
        vertical: context.height * 0.01,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              vertical: context.height * 0.015,
              horizontal: context.width * 0.02,
            ),
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Text(
              "Issue Details",
              style: AppTextStyles.title20WhiteBold,
            ),
          ),
          RowData(title: "User", value: ticket.admin),
          RowData(title: "Title", value: ticket.title),
          RowData(title: "Description", value: ticket.description),
          RowData(title: "Room Name", value: ticket.roomName),
          RowData(title: "More Data", value: ticket.moreData),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Status",
                style: AppTextStyles.title20PrimaryColorW500,
              ),
              CustomDropDownButtonFormField(
                hintText: ticket.status,
                userRoles: ["Pending", "Solved", "Rejected"],
                controller: cubit.stateController,
              ),
            ],
          ),
          SizedBox(
            height: context.height * 0.02,
          ),
          CustomElevatedButton(
            name: "Save",
            onPressed: () {
              cubit.updateTicketStatus(id: ticket.id);
            },
          )
        ],
      ),
    );
  }
}
