import 'package:flutter/material.dart';
import 'package:smart_connect/core/utilies/colors/app_colors.dart';
import 'package:smart_connect/core/utilies/extensions/app_extensions.dart';
import 'package:smart_connect/core/utilies/styles/app_text_styles.dart';
import 'package:smart_connect/features/teacher_screens/add_ticket/models/add_ticket_model.dart';

class ItSupportCard extends StatelessWidget {
  const ItSupportCard({super.key, required this.ticketModel, this.onTap});
  final TicketModel ticketModel;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(color: AppColors.primaryColor, width: 2)),
      child: ListTile(
        onTap: onTap,
        title: Text(
          ticketModel.title,
          style: AppTextStyles.title20PrimaryColorW500,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
        subtitle: Text(
          ticketModel.description,
          style: AppTextStyles.title16GreyW500,
        ),
        trailing: Container(
          padding: EdgeInsets.symmetric(
              horizontal: context.width * 0.04,
              vertical: context.height * 0.01),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: AppColors.primaryColor),
          child: Text(
            ticketModel.status,
            style: AppTextStyles.title16White500,
          ),
        ),
      ),
    );
  }
}
