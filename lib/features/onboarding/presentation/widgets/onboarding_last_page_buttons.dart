import 'package:fintech_app/core/helpers/extensions.dart';
import 'package:fintech_app/core/helpers/spacing.dart';
import 'package:fintech_app/core/routing/app_router.dart';
import 'package:fintech_app/core/theme/app_text_styles.dart';
import 'package:fintech_app/core/widgets/app_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class OnboardingLastPageButtons extends StatelessWidget {
  const OnboardingLastPageButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppElevatedButton(
          onPressed: () {
            context.push(AppRouter.loginScreen);
          },
          text: 'Login',
          textStyle: AppTextStyles.bold18.copyWith(color:context.customColors.cardColor),
          backgroundColor: context.customColors.primaryColor,
          radius: 30.r,
        ),
        space(height: 16.h),
        SizedBox(
          width: double.infinity,
          height: 50.h,
          child: OutlinedButton(
            onPressed: () {
              context.push(AppRouter.registerScreen);
            },
            style: OutlinedButton.styleFrom(
              side: BorderSide(color: context.customColors.primaryColor),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.r),
              ),
            ),
            child: Text(
              'Register',
              style: AppTextStyles.bold18.copyWith(
                color: context.customColors.primaryColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
