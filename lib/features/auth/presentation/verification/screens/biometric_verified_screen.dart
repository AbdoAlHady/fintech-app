import 'package:fintech_app/core/helpers/extensions.dart';
import 'package:fintech_app/core/routing/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:fintech_app/features/auth/presentation/common/decorative_circle_background.dart';
import 'package:fintech_app/features/auth/presentation/verification/widgets/biometric_verified_content.dart';

class BiometricVerifiedScreen extends StatelessWidget {
  const BiometricVerifiedScreen({super.key});

  void _navigateToHome(BuildContext context) {
    context.go(AppRouter.marketScreen);
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
                    child: BiometricVerifiedContent(
                      onContinue: () => _navigateToHome(context),
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
