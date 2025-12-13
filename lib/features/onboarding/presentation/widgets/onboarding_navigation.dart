import 'package:fintech_app/core/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingNavigation extends StatelessWidget {
  final int currentIndex;
  final int totalPages;
  final VoidCallback onNextTap;

  const OnboardingNavigation({
    super.key,
    required this.currentIndex,
    required this.totalPages,
    required this.onNextTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Dots Indicator
        Row(
          children: List.generate(
            totalPages,
            (index) => AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: EdgeInsets.only(right: 4.w),
              height: 4.h,
              width: currentIndex == index ? 24.w : 12.w,
              decoration: BoxDecoration(
                color: currentIndex == index
                    ? context.customColors.primaryColor
                    : context.customColors.primaryColor.withValues(alpha: 0.3),
                borderRadius: BorderRadius.circular(2.r),
              ),
            ),
          ),
        ),

        // Next Button (FAB style)
        GestureDetector(
          onTap: onNextTap,
          child: Container(
            width: 50.w,
            height: 50.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: context.customColors.primaryColor,
            ),
            child: Icon(
              Icons.arrow_forward_ios,
              color:context.customColors.cardColor,
              size: 20.sp,
            ),
          ),
        ),
      ],
    );
  }
}
