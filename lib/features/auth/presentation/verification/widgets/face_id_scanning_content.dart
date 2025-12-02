import 'package:fintech_app/core/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fintech_app/features/auth/presentation/verification/widgets/face_id_card_widget.dart';
import 'package:fintech_app/features/auth/presentation/common/instruction_text_widget.dart';

class FaceIdScanningContent extends StatelessWidget {
  final VoidCallback onTap;
  final bool showBackButton;

  const FaceIdScanningContent({
    super.key,
    required this.onTap,
    this.showBackButton = true,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Top spacing for back button area
            SizedBox(height: showBackButton ? 60.h : 20.h),
            // Face ID Card (centered)
            FaceIdCardWidget(onTap: onTap, isVerified: false),
            // Instruction Text
            Center(
              child: InstructionTextWidget(
                text: 'Please wait until your scanning is\ncomplete',
                color: context.customColors.cardColor,
                bottomSpacing: 45.h,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
