import 'package:fintech_app/core/helpers/extensions.dart';
import 'package:fintech_app/core/helpers/spacing.dart';
import 'package:fintech_app/core/widgets/app_rich_text_button.dart';
import 'package:fintech_app/features/auth/presentation/login/widgets/login/login_form.dart';
import 'package:fintech_app/features/auth/presentation/login/widgets/login/login_header.dart';
import 'package:fintech_app/features/auth/presentation/login/widgets/login/social_login.dart';
import 'package:fintech_app/features/auth/presentation/register/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const LoginHeader(),
            space(height: 50.h),
            const LoginForm().withPadding(horizontal: 24.h),
            const SocialLogin().withPadding(vertical: 16.w, horizontal: 20.h),
            AppRichTextButton(
              text: "Don't have an account?",
              spacing: 3.h,
              buttonText: 'Sign Up',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RegisterScreen(),
                  ),
                );
              },
            ).withPadding(bottom: 40.h),
          ],
        ),
      ),
    );
  }
}
