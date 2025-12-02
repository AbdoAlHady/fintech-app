import 'package:fintech_app/core/helpers/extensions.dart';
import 'package:fintech_app/core/routing/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:fintech_app/features/auth/presentation/common/decorative_circle_background.dart';
import 'package:fintech_app/features/auth/presentation/verification/widgets/face_id_verified_content.dart';

class FaceIdVerifiedScreen extends StatelessWidget {
  const FaceIdVerifiedScreen({super.key});

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
          // Verified Content
          SafeArea(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return SizedBox(
                  width: constraints.maxWidth,
                  height: constraints.maxHeight,
                  child: FaceIdVerifiedContent(
                    onContinue: () => _navigateToHome(context),
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
