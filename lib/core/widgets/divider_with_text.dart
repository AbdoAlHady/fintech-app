import 'package:fintech_app/core/helpers/extensions.dart';
import 'package:fintech_app/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class DividerWithText extends StatelessWidget {
  const DividerWithText({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: context.customColors.secondaryCardColor,
            thickness: 1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            text,
            style: AppTextStyles.regular12.copyWith(
              color: context.customColors.primaryColor,
            ),
          ),
        ),
        Expanded(
          child: Divider(
            color: context.customColors.secondaryCardColor,
            thickness: 1,
          ),
        ),
      ],
    );
  }
}
