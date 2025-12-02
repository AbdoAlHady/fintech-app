import 'package:fintech_app/core/helpers/extensions.dart';
import 'package:fintech_app/core/routing/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:fintech_app/features/auth/presentation/common/decorative_circle_background.dart';
import 'package:fintech_app/features/auth/presentation/verification/widgets/biometric_verify_content.dart';

class BiometricVerifyScreen extends StatelessWidget {
  const BiometricVerifyScreen({super.key});

  void _handleFingerPrintTap(BuildContext context) {
    // Navigate to verified screen after fingerprint tap
    context.go(AppRouter.biometricVerifiedScreen);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Decorative Background Circle
          DecorativeCircleBackground(
            color: context.customColors.secondaryCardColor,
            top: -130.h,
            left: 150.w,
          ),
          // Main Content
          SafeArea(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return SizedBox(
                  width: constraints.maxWidth,
                  height: constraints.maxHeight,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 24.w,
                      vertical: 20.h,
                    ),
                    child: BiometricVerifyContent(
                      onFingerPrintTap: () => _handleFingerPrintTap(context),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
