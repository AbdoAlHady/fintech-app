import 'package:fintech_app/core/helpers/spacing.dart';
import 'package:fintech_app/core/helpers/extensions.dart';
import 'package:fintech_app/core/theme/app_text_styles.dart';
import 'package:fintech_app/core/widgets/app_elevated_button.dart';
import 'package:fintech_app/features/auth/presentation/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomTextField(hintText: 'E-mail ID', prefixIcon: Icons.mail_outline),
        space(height: 16),
        const CustomTextField(
          hintText: 'Password',
          prefixIcon: Iconsax.lock,
          obscureText: true,
        ),
        space(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SizedBox(
                  height: 24,
                  width: 24,
                  child: Checkbox(
                    value: rememberMe,
                    onChanged: (value) {
                      setState(() {
                        rememberMe = value ?? false;
                      });
                    },
                    activeColor: context.customColors.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    side: BorderSide(color: context.customColors.primaryColor),
                  ),
                ),
                space(width: 8),
                Text(
                  'Remember me',
                  style: AppTextStyles.regular12.copyWith(
                    color: context.customColors.primaryColor,
                  ),
                ),
              ],
            ),
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(padding: EdgeInsets.zero),
              child: Text(
                'Forget Password?',
                style: AppTextStyles.regular12.copyWith(
                  color: context.customColors.primaryColor,
                ),
              ),
            ),
          ],
        ),
        space(height: 24),
        AppElevatedButton(
          onPressed: () {},
          text: 'Login',
          textStyle: AppTextStyles.bold16.copyWith(color:context.customColors.cardColor),
          radius: 30,
          backgroundColor: context.customColors.primaryColor,
        ),
      ],
    );
  }
}
