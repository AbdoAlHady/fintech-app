import 'package:fintech_app/core/helpers/extensions.dart';
import 'package:fintech_app/core/helpers/spacing.dart';
import 'package:fintech_app/core/theme/app_colors.dart';
import 'package:fintech_app/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      width: double.infinity,
      child: Stack(
        children: [
          Positioned(
            top: -150,
            left: 185,
            child: Container(
              width: 342.w,
              height: 342.h,
              decoration: BoxDecoration(
                color: context.customColors.secondaryCardColor,
                shape: BoxShape.circle,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Login To Your Account',
                  style: AppTextStyles.bold26.copyWith(
                    color: AppColors.primaryColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                space(height: 12),
                Text(
                  "Welcome back you've\nbeen missed!",
                  style: AppTextStyles.semiBold18.copyWith(
                    color:
                        AppColors.textColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                space(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
