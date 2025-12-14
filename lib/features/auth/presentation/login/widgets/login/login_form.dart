import 'package:fintech_app/core/helpers/spacing.dart';
import 'package:fintech_app/core/helpers/extensions.dart';
import 'package:fintech_app/core/theme/app_text_styles.dart';
import 'package:fintech_app/core/widgets/app_elevated_button.dart';
import 'package:fintech_app/core/widgets/app_form_field.dart';
import 'package:fintech_app/core/widgets/app_text_button.dart';
import 'package:fintech_app/features/auth/presentation/login/widgets/login/remember_me_checkbox.dart';
import 'package:fintech_app/core/utils/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fintech_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:fintech_app/features/auth/presentation/cubit/auth_state.dart';
import 'package:go_router/go_router.dart';
import 'package:fintech_app/core/routing/app_router.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
          AppFormField(
            hintText: 'E-mail ID',
            prefixIcon: Icons.mail_outline,
            controller: _emailController,
            validator: AppValidators.validateEmail,
            keyboardType: TextInputType.emailAddress,
          ),
          space(height: 16.h),
          AppFormField(
            hintText: 'Password',
            prefixIcon: Iconsax.lock,
            obscureText: true,
            controller: _passwordController,
            validator: AppValidators.validatePassword,
          ),
          space(height: 12.h),
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
              AppTextButton(
                text: 'Forget Password?',
                onPressed: () {
                  context.push(AppRouter.forgotPasswordScreen);
                },
              ),
            ],
          ),
          space(height: 24.h),
          BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is AuthSuccess) {
                context.go(AppRouter.marketView);
              } else if (state is AuthFailure) {
                Fluttertoast.showToast(
                  msg: state.message,
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.BOTTOM,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0,
                );
              }
            },
            builder: (context, state) {
              return AppElevatedButton(
                isLoading: state is AuthLoading,
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    context.read<AuthCubit>().login(
                      email: _emailController.text.trim(),
                      password: _passwordController.text.trim(),
                    );
                  }
                },
                text: 'Login',
                textStyle: AppTextStyles.bold18.copyWith(
                  color: context.customColors.cardColor,
                ),
                radius: 30.r,
              );
            },
          ),
        ],
      ),
    );
  }
}
