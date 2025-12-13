import 'package:fintech_app/core/helpers/extensions.dart';
import 'package:fintech_app/core/helpers/spacing.dart';
import 'package:fintech_app/core/theme/app_text_styles.dart';
import 'package:fintech_app/features/auth/presentation/common/decorative_circle_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterHeader extends StatelessWidget {
  const RegisterHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250.h,
      width: double.infinity,
      child: Stack(
        children: [
          DecorativeCircleBackground(
            color: context.customColors.secondaryCardColor,
            top: -130.h,
            left: 150.w,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Create Your Account',
                  style: AppTextStyles.bold26.copyWith(
                    color: context.customColors.primaryColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                space(height: 12.h),
                Text(
                  'Sign up to enjoy the best managing\nexperience!',
                  style: AppTextStyles.semiBold18.copyWith(
                    color: context.customColors.textColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                space(height: 20.h),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
