import 'package:fintech_app/core/helpers/extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fintech_app/core/widgets/app_elevated_button.dart';
import 'package:fintech_app/features/auth/presentation/common/verification_success_widget.dart';

class BiometricVerifiedContent extends StatelessWidget {
  final VoidCallback onContinue;

  const BiometricVerifiedContent({super.key, required this.onContinue});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        // Success Icon
        Container(
          width: 125.w,
          height: 125.w,
          decoration: BoxDecoration(
            color: context.customColors.primaryColor,
            shape: BoxShape.circle,
          ),
          child: Icon(
            CupertinoIcons.checkmark_alt,
            color: context.customColors.cardColor,
            size: 110.sp,
          ),
        ),
        SizedBox(height: 60.h),
        // Success Message
        VerificationSuccessWidget(
          title: "You're verified",
          subtitle: "You have been verified your\ninformation completely. Let's make\ntransactions!",
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
    );
  }
}
