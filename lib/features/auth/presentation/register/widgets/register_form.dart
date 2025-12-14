import 'dart:developer';

import 'package:fintech_app/core/helpers/spacing.dart';
import 'package:fintech_app/core/helpers/extensions.dart';
import 'package:fintech_app/core/theme/app_text_styles.dart';
import 'package:fintech_app/core/widgets/app_elevated_button.dart';
import 'package:fintech_app/core/widgets/app_form_field.dart';
import 'package:fintech_app/core/utils/validators.dart';
import 'package:fintech_app/features/auth/presentation/verification/screens/biometric_verify_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fintech_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:fintech_app/features/auth/presentation/cubit/auth_state.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _firstNameController;
  late final TextEditingController _lastNameController;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final TextEditingController _confirmPasswordController;
  late final TextEditingController _phoneController;

  @override
  void initState() {
    super.initState();
    _firstNameController = TextEditingController();
    _lastNameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
    _phoneController = TextEditingController();
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  String? _validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    }
    if (value != _passwordController.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  String? _validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }
    if (value.length < 2) {
      return 'Name must be at least 2 characters';
    }
    return null;
  }

  String? _validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required';
    }
    // Remove any spaces or formatting
    final cleanedValue = value.replaceAll(RegExp(r'[^\d]'), '');
    if (cleanedValue.length < 10) {
      return 'Please enter a valid phone number';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          AppFormField(
            hintText: 'First Name',
            prefixIcon: Iconsax.user,
            controller: _firstNameController,
            validator: _validateName,
            keyboardType: TextInputType.name,
            textInputAction: TextInputAction.next,
          ),
          space(height: 16.h),
          AppFormField(
            hintText: 'Last Name',
            prefixIcon: Iconsax.user,
            controller: _lastNameController,
            validator: _validateName,
            keyboardType: TextInputType.name,
            textInputAction: TextInputAction.next,
          ),
          space(height: 16.h),
          AppFormField(
            hintText: 'Email-ID',
            prefixIcon: Icons.mail_outline,
            controller: _emailController,
            validator: AppValidators.validateEmail,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
          ),
          space(height: 16.h),
          AppFormField(
            hintText: 'Password',
            prefixIcon: Iconsax.lock,
            obscureText: true,
            controller: _passwordController,
            validator: AppValidators.validatePassword,
            textInputAction: TextInputAction.next,
          ),
          space(height: 16.h),
          AppFormField(
            hintText: 'Confirm Password',
            prefixIcon: Iconsax.lock,
            obscureText: true,
            controller: _confirmPasswordController,
            validator: _validateConfirmPassword,
            textInputAction: TextInputAction.next,
          ),
          space(height: 16.h),
          AppFormField(
            hintText: 'xxx xxx xxxx',
            prefixIcon: Icons.phone_outlined,
            controller: _phoneController,
            validator: _validatePhone,
            keyboardType: TextInputType.phone,
            textInputAction: TextInputAction.done,
          ),
          space(height: 24.h),
          BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is AuthSuccess) {
                log('Registration successful for user: ${state.user.email}');
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const BiometricVerifyScreen(),
                  ),
                );
              } else if (state is AuthFailure) {
                log('Registration failed: ${state.message}');
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
                    context.read<AuthCubit>().register(
                      firstName: _firstNameController.text.trim(),
                      lastName: _lastNameController.text.trim(),
                      email: _emailController.text.trim(),
                      password: _passwordController.text.trim(),
                      phone: _phoneController.text.trim(),
                    );
                  }
                },
                text: 'Register',
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
