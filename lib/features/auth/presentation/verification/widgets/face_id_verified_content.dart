import 'package:fintech_app/core/helpers/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fintech_app/core/widgets/app_elevated_button.dart';
import 'package:fintech_app/features/auth/presentation/verification/widgets/face_id_card_widget.dart';
import 'package:fintech_app/features/auth/presentation/common/verification_success_widget.dart';

class FaceIdVerifiedContent extends StatelessWidget {
  final VoidCallback onContinue;

  const FaceIdVerifiedContent({super.key, required this.onContinue});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(),
          // Verified Card
          FaceIdCardWidget(onTap: () {}, isVerified: true),
          space(height: 80.h),
          // Success Message
          VerificationSuccessWidget(
            title: "You're verified",
            subtitle:
                "You have been verified your information\ncompletely. Let's make transactions!",
          ),
          const Spacer(),
          // Continue Button
          AppElevatedButton(
            text: 'Continue To Home',
            onPressed: onContinue,
            radius: 30.r,
          ),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}
