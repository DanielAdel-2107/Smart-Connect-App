import 'package:flutter/material.dart';
import 'package:smart_connect/core/utilies/colors/app_colors.dart';
import 'package:smart_connect/core/utilies/extensions/app_extensions.dart';
import 'package:smart_connect/core/utilies/styles/app_text_styles.dart';
import 'package:smart_connect/features/teacher_screens/add_technician_request/models/technician_request_model.dart';

class CustomTechnicianRequestListTile extends StatelessWidget {
  const CustomTechnicianRequestListTile({
    super.key,
    required this.request,
    this.onTap,
  });
  final TechnicianRequestModel request;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: context.height * 0.01),
      child: ListTile(
        onTap: onTap,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: BorderSide(color: AppColors.primaryColor, width: 2)),
        title: Text(request.title),
        subtitle: Text(request.description),
        trailing: Container(
          padding: EdgeInsets.symmetric(
            horizontal: context.width * 0.04,
            vertical: context.height * 0.01,
          ),
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Text(
            request.status,
            style: AppTextStyles.title18White,
          ),
        ),
      ),
    );
  }
}
