import 'package:fintech_app/core/routing/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:fintech_app/features/auth/presentation/verification/widgets/face_id_scanning_background.dart';
import 'package:fintech_app/features/auth/presentation/verification/widgets/face_id_scanning_content.dart';

class FaceIdScanningScreen extends StatelessWidget {
  const FaceIdScanningScreen({super.key});

  void _startVerification(BuildContext context) {
    context.go(AppRouter.faceIdVerifiedScreen);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background with image
          FaceIdScanningBackground(
            onBackPressed: () => GoRouter.of(context).pop(),
          ),
          // Main Content
          FaceIdScanningContent(onTap: () => _startVerification(context)),
        ],
      ),
    );
  }
}
