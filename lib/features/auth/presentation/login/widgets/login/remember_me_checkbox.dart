import 'package:fintech_app/core/helpers/extensions.dart';
import 'package:fintech_app/core/helpers/spacing.dart';
import 'package:fintech_app/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RememberMeCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?> onChanged;
  const RememberMeCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 24.h,
          width: 24.w,
          child: Checkbox(
            value: value,
            onChanged: onChanged,
            activeColor: context.customColors.primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4.r),
            ),
            side: BorderSide(color: context.customColors.primaryColor),
          ),
        ),
        space(width: 8.w),
        Text(
          'Remember me',
          style: AppTextStyles.semiBold14.copyWith(
            color: context.customColors.primaryColor,
          ),
        ),
      ],
    );
  }
}
