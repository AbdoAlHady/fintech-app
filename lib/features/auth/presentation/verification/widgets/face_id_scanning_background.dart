import 'package:fintech_app/core/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fintech_app/core/utils/app_assets.dart';
import 'package:fintech_app/features/auth/presentation/common/back_button_widget.dart';

class FaceIdScanningBackground extends StatelessWidget {
  final VoidCallback? onBackPressed;

  const FaceIdScanningBackground({super.key, this.onBackPressed});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background Image
        Positioned.fill(
          child: Image.asset(AppAssets.svgsGirlBackground, fit: BoxFit.cover),
        ),
        // Back Button
        if (onBackPressed != null)
          SafeArea(
            child: Padding(
              padding: EdgeInsets.only(left: 24.w, top: 20.h),
              child: Align(
                alignment: Alignment.topLeft,
                child: BackButtonWidget(
                  backgroundColor: Colors.white.withValues(alpha: 0.2),
                  iconColor: context.customColors.cardColor,
                  onPressed: onBackPressed,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
