import 'package:fintech_app/core/helpers/spacing.dart';
import 'package:fintech_app/core/helpers/extensions.dart';
import 'package:fintech_app/core/theme/app_text_styles.dart';
import 'package:fintech_app/core/widgets/app_elevated_button.dart';
import 'package:fintech_app/features/auth/presentation/widgets/custom_text_field.dart';
import 'package:fintech_app/features/auth/presentation/widgets/remember_me_checkbox.dart';
import 'package:fintech_app/features/auth/presentation/widgets/forgot_password_button.dart';
import 'package:fintech_app/core/utils/validators.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool rememberMe = false;
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextField(
            hintText: 'E-mail ID',
            prefixIcon: Icons.mail_outline,
            controller: _emailController,
            validator: AppValidators.validateEmail,
            keyboardType: TextInputType.emailAddress,
          ),
          space(height: 16),
          CustomTextField(
            hintText: 'Password',
            prefixIcon: Iconsax.lock,
            obscureText: true,
            controller: _passwordController,
            validator: AppValidators.validatePassword,
          ),
          space(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RememberMeCheckbox(
                value: rememberMe,
                onChanged: (value) {
                  setState(() {
                    rememberMe = value ?? false;
                  });
                },
              ),
              ForgotPasswordButton(onPressed: () {}),
            ],
          ),
          space(height: 24),
          AppElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {}
            },
            text: 'Login',
            textStyle: AppTextStyles.bold16.copyWith(
              color: context.customColors.cardColor,
            ),
            radius: 30,
            backgroundColor: context.customColors.primaryColor,
          ),
        ],
      ),
    );
  }
}
