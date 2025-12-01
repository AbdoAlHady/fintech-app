import 'package:fintech_app/core/helpers/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fintech_app/core/widgets/social_login_button.dart';
import 'package:fintech_app/core/widgets/divider_with_text.dart';

class SocialLogin extends StatelessWidget {
  const SocialLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DividerWithText(text: 'Or continue with'),
        space(height: 24),
        Row(
          children: [
            SocialLoginButton(
              image: 'assets/svgs/google.svg',
              title: 'Google',
              onTap: () {},
            ),
            space(width: 16),
            SocialLoginButton(
              image: 'assets/svgs/facebook.svg',
              title: 'Facebook',
              onTap: () {},
            ),
          ],
        ),
        space(height: 24),
        DividerWithText(text: 'Or login with'),
        space(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/svgs/finger_print.svg',
              width: 50,
              height: 50,
            ),
            space(width: 60),
            SvgPicture.asset('assets/svgs/Face_ID.svg', width: 50, height: 50),
          ],
        ),
      ],
    );
  }
}
