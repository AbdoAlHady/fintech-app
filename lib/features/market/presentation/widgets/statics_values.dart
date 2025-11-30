import 'package:fintech_app/core/helpers/spacing.dart';
import 'package:fintech_app/core/theme/app_colors.dart';
import 'package:fintech_app/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class StaticsValues extends StatelessWidget {
  const StaticsValues({
    super.key,
    required this.label,
    required this.value,
  });

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        space(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label,
                style:  AppTextStyles.regular12.copyWith(color: AppColors.grey)
                ),
            Text(value,
                style: AppTextStyles.bold16.copyWith
                (
                color: AppColors.darkPrimaryColor,
            )),
          ],
        ),
        space(height: 10),
        Divider(color: AppColors.grey200),
      ],
    );
  }
}
