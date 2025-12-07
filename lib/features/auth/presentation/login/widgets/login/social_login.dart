import 'package:fintech_app/core/helpers/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fintech_app/core/widgets/social_login_button.dart';
import 'package:fintech_app/core/widgets/divider_with_text.dart';
import 'package:go_router/go_router.dart';
import 'package:fintech_app/core/routing/app_router.dart';

class SocialLogin extends StatelessWidget {
  const SocialLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DividerWithText(text: 'Or continue with'),
        space(height: 24.h),
        Row(
          children: [
            SocialLoginButton(
              image: 'assets/svgs/google.svg',
              title: 'Google',
              onTap: () {},
            ),
            space(width: 16.w),
            SocialLoginButton(
              image: 'assets/svgs/facebook.svg',
              title: 'Facebook',
              onTap: () {},
            ),
          ],
        ),
        space(height: 24.h),
        DividerWithText(text: 'Or login with'),
        space(height: 24.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                context.push(AppRouter.biometricVerifyScreen);
              },
              child: SvgPicture.asset(
                'assets/svgs/finger_print.svg',
                width: 40.w,
                height: 40.h,
              ),
            ),
            space(width: 60.w),
            GestureDetector(
              onTap: () {
                context.push(AppRouter.faceIdScanningScreen);
              },
              child: SvgPicture.asset(
                'assets/svgs/Face_ID.svg',
                width: 40.w,
                height: 40.h,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
