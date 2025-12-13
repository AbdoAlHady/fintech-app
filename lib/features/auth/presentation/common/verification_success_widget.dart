import 'package:fintech_app/core/helpers/extensions.dart';
import 'package:fintech_app/core/helpers/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fintech_app/core/theme/app_text_styles.dart';

class VerificationSuccessWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget? icon;

  const VerificationSuccessWidget({
    super.key,
    required this.title,
    required this.subtitle,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (icon != null) ...[icon!, SizedBox(height: 40.h)],
        Text(
          title,
          style: AppTextStyles.semiBold26.copyWith(
            color: context.customColors.primaryColor,
          ),
        ),
        space(height: 20.h),
        Text(
          subtitle,
          textAlign: TextAlign.center,
          style: AppTextStyles.regular18.copyWith(
            color: context.customColors.textColor,
          ),
        ),
      ],
    );
  }
}
