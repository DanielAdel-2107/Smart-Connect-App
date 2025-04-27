import 'package:flutter/material.dart';
import 'package:flutter_easy_faq/flutter_easy_faq.dart';
import 'package:smart_connect/core/utilies/colors/app_colors.dart';
import 'package:smart_connect/core/utilies/extensions/app_extensions.dart';
import 'package:smart_connect/core/utilies/styles/app_text_styles.dart';

class RowData extends StatelessWidget {
  const RowData({
    super.key,
    required this.title,
    required this.value,
  });
  final String title;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: context.height * 0.01,
      ),
      child: EasyFaq(
        question: title,
        answer: value,
        questionTextStyle: AppTextStyles.title18PrimaryColorW500,
        anserTextStyle: AppTextStyles.title16GreyW500,
        expandedIcon: Icon(
          Icons.arrow_drop_up,
          color: AppColors.primaryColor,
          size: context.width * 0.08,
        ),
        collapsedIcon: Icon(Icons.arrow_drop_down,
            color: AppColors.primaryColor, size: context.width * 0.08),
      ),
    );
  }
}
