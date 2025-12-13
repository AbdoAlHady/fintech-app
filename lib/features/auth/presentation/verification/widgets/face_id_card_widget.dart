import 'package:fintech_app/core/helpers/extensions.dart';
import 'package:fintech_app/core/helpers/spacing.dart';
import 'package:fintech_app/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconsax/iconsax.dart';

class FaceIdCardWidget extends StatelessWidget {
  final VoidCallback onTap;
  final bool isVerified;

  const FaceIdCardWidget({
    super.key,
    required this.onTap,
    this.isVerified = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 155.w,
        height: 158.h,
        decoration: BoxDecoration(
          color: context.customColors.cardColor,
          borderRadius: BorderRadius.circular(24.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isVerified)
              Center(
                child: Icon(
                  Iconsax.tick_circle,
                  color: context.customColors.primaryColor,
                  size: 70.sp,
                ),
              )
            else

              SvgPicture.asset(
                'assets/svgs/Face_ID.svg',
                width: 64.w,
                height: 64.w,
                colorFilter: ColorFilter.mode(
                  context.customColors.primaryColor,
                  BlendMode.srcIn,
                ),
              ),
            space(height: 16.h),
            Text(
              'Face ID',
              style: AppTextStyles.medium24.copyWith(
                color: context.customColors.primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
