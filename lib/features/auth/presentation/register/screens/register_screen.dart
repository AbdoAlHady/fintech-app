import 'package:fintech_app/core/helpers/extensions.dart';
import 'package:fintech_app/core/helpers/spacing.dart';
import 'package:fintech_app/core/widgets/app_rich_text_button.dart';
import 'package:fintech_app/features/auth/presentation/register/widgets/register_form.dart';
import 'package:fintech_app/features/auth/presentation/register/widgets/register_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const RegisterHeader(),
            space(height: 30.h),
            const RegisterForm().withPadding(horizontal: 24.h),
            space(height: 16.h),
            AppRichTextButton(
              text: 'Already have an account?',
              spacing: 3.h,
              buttonText: 'login',
              onPressed: () {
                Navigator.pop(context);
              },
            ).withPadding(bottom: 40.h),
          ],
        ),
      ),
    );
  }
}
