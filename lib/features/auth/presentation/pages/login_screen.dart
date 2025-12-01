import 'package:fintech_app/core/helpers/extensions.dart';
import 'package:fintech_app/core/helpers/spacing.dart';
import 'package:fintech_app/features/auth/presentation/widgets/login_form.dart';
import 'package:fintech_app/features/auth/presentation/widgets/login_header.dart';
import 'package:fintech_app/features/auth/presentation/widgets/sign_up_link.dart';
import 'package:fintech_app/features/auth/presentation/widgets/social_login.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.customColors.cardColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const LoginHeader(),
            space(height: 50),
            const LoginForm().withPadding(horizontal: 24),
            const SocialLogin().withPadding(vertical: 24),
            const SignUpLink().withPadding(bottom: 24),
          ],
        ),
      ),
    );
  }
}
