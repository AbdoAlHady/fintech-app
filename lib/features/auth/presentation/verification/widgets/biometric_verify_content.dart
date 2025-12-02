import 'package:fintech_app/core/helpers/extensions.dart';
import 'package:fintech_app/core/helpers/spacing.dart';
import 'package:fintech_app/features/auth/presentation/common/instruction_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fintech_app/core/theme/app_text_styles.dart';

class BiometricVerifyContent extends StatelessWidget {
  final VoidCallback onFingerPrintTap;

  const BiometricVerifyContent({super.key, required this.onFingerPrintTap});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          space(height: 50.h),
          Text(
            'Touch ID sensor to verify yourself',
            style: AppTextStyles.bold26.copyWith(
              color: context.customColors.primaryColor,
            ),
            textAlign: TextAlign.center,
          ),
          Spacer(),
          // Fingerprint Icon
          GestureDetector(
            onTap: onFingerPrintTap,
            child: SvgPicture.asset(
              'assets/svgs/finger_print.svg',
              width: 108.w,
              height: 125.w,
            ),
          ),
          const Spacer(),
          // Instruction
          InstructionTextWidget(
            text:'Please verify your identity using touch\nID and it will proceed automatically.',
            color: context.customColors.textColor,
            bottomSpacing: 45.h,
          ),
        ],
      ),
    );
  }
}
