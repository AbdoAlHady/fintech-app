import 'package:fintech_app/core/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class BackButtonWidget extends StatelessWidget {
  final Color? backgroundColor;
  final Color? iconColor;
  final VoidCallback? onPressed;

  const BackButtonWidget({
    super.key,
    this.backgroundColor,
    this.iconColor,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed ?? () => GoRouter.of(context).pop(),
      child: Container(
        padding: EdgeInsets.all(8.r),
        decoration: BoxDecoration(
          color: backgroundColor ?? context.customColors.cardColor,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Icon(
          Icons.arrow_back_ios_new,
          color: iconColor ?? context.customColors.textColor,
          size: 20.sp,
        ),
      ),
    );
  }
}
