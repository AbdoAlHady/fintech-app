import 'package:fintech_app/core/helpers/extensions.dart';
import 'package:fintech_app/core/helpers/spacing.dart';
import 'package:fintech_app/core/theme/app_colors.dart';
import 'package:fintech_app/core/theme/app_text_styles.dart';
import 'package:fintech_app/features/onboarding/data/models/onboarding_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingPage extends StatelessWidget {
  final OnboardingModel page;
  final int index;

  const OnboardingPage({super.key, required this.page, required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(child: Image.asset(page.image, height: 300.h, width: 300.w)),
          space(height: 40.h),
          index == 0
              ? RichText(
                  textAlign: TextAlign.left,
                  text: TextSpan(
                    style: AppTextStyles.bold30.copyWith(
                      color: context.customColors.textColor,
                    ),
                    children: [
                      const TextSpan(text: 'Welcome To '),
                      TextSpan(
                        text: 'Crypto X',
                        style:AppTextStyles.bold30.copyWith(
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ],
                  ),
                )
              : Text(
                  page.title,
                  style:AppTextStyles.bold30.copyWith(
                    color: context.customColors.textColor,
                  ),
                  textAlign: TextAlign.left,
                ),
        ],
      ),
    );
  }
}
