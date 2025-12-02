import 'package:fintech_app/core/helpers/extensions.dart';
import 'package:fintech_app/core/helpers/spacing.dart';
import 'package:fintech_app/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocialLoginButton extends StatelessWidget {
  const SocialLoginButton({
    super.key,
    required this.image,
    required this.title,
    this.onTap,
  });

  final String image;
  final String title;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 56.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(color: context.customColors.secondaryCardColor),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(image, width: 24.w, height: 24.h),
              space(width: 8.w),
              Text(
                title,
                style: AppTextStyles.semiBold16.copyWith(
                  color: context.customColors.primaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
