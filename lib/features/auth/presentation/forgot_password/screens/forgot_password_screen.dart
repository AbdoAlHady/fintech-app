import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fintech_app/core/helpers/spacing.dart';
import 'package:fintech_app/core/helpers/extensions.dart';
import 'package:fintech_app/core/theme/app_text_styles.dart';
import 'package:fintech_app/core/theme/app_colors.dart';
import 'package:fintech_app/core/widgets/app_elevated_button.dart';
import 'package:fintech_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:fintech_app/features/auth/presentation/cubit/auth_state.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  bool _emailSent = false;

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  void _handleResetPassword() {
    if (_formKey.currentState!.validate()) {
      context.read<AuthCubit>().resetPassword(_emailController.text.trim());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forgot Password', style: AppTextStyles.semiBold20),
        centerTitle: true,
      ),
      body: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.red,
              ),
            );
          } else if (state is AuthInitial && _emailController.text.isNotEmpty) {
            setState(() {
              _emailSent = true;
            });
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Password reset email sent! Check your inbox.'),
                backgroundColor: Colors.green,
              ),
            );
          }
        },
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 32.h),
            child: _emailSent ? _buildSuccessView() : _buildFormView(),
          ),
        ),
      ),
    );
  }

  Widget _buildFormView() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Icon
          Center(
            child: Icon(
              Icons.lock_reset,
              size: 80.sp,
              color: AppColors.primaryColor,
            ),
          ),
          space(height: 24.h),

          // Title
          Text(
            'Reset Your Password',
            style: AppTextStyles.bold24.copyWith(
              color: context.customColors.textColor,
            ),
          ),
          space(height: 8.h),

          // Description
          Text(
            'Enter your email address and we\'ll send you a link to reset your password.',
            style: AppTextStyles.regular14.copyWith(color: Colors.grey),
          ),
          space(height: 32.h),

          // Email Field
          TextFormField(
            controller: _emailController,
            decoration: InputDecoration(
              hintText: 'Email',
              prefixIcon: const Icon(Icons.email_outlined),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              }
              if (!RegExp(
                r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
              ).hasMatch(value)) {
                return 'Please enter a valid email';
              }
              return null;
            },
          ),
          space(height: 32.h),

          // Send Button
          BlocBuilder<AuthCubit, AuthState>(
            builder: (context, state) {
              return AppElevatedButton(
                onPressed: state is AuthLoading ? () {} : _handleResetPassword,
                text: state is AuthLoading ? 'Sending...' : 'Send Reset Link',
              );
            },
          ),
          space(height: 16.h),

          // Back to Login
          Center(
            child: TextButton(
              onPressed: () => context.pop(),
              child: Text(
                'Back to Login',
                style: AppTextStyles.semiBold14.copyWith(
                  color: AppColors.primaryColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSuccessView() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.mark_email_read, size: 100.sp, color: Colors.green),
        space(height: 24.h),
        Text(
          'Email Sent!',
          style: AppTextStyles.bold24.copyWith(
            color: context.customColors.textColor,
          ),
          textAlign: TextAlign.center,
        ),
        space(height: 16.h),
        Text(
          'We\'ve sent password reset instructions to:\n${_emailController.text}',
          style: AppTextStyles.regular14.copyWith(color: Colors.grey),
          textAlign: TextAlign.center,
        ),
        space(height: 8.h),
        Text(
          'Please check your inbox and spam folder.',
          style: AppTextStyles.regular12.copyWith(color: Colors.grey),
          textAlign: TextAlign.center,
        ),
        space(height: 32.h),
        AppElevatedButton(
          onPressed: () => context.pop(),
          text: 'Back to Login',
        ),
        space(height: 16.h),
        TextButton(
          onPressed: () {
            setState(() {
              _emailSent = false;
            });
          },
          child: Text(
            'Resend Email',
            style: AppTextStyles.semiBold14.copyWith(
              color: AppColors.primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
