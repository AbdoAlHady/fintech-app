import 'package:fintech_app/core/helpers/extensions.dart';
import 'package:fintech_app/core/routing/app_router.dart';
import 'package:fintech_app/core/services/biometric_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:fintech_app/features/auth/presentation/common/decorative_circle_background.dart';
import 'package:fintech_app/features/auth/presentation/verification/widgets/biometric_verify_content.dart';
import 'package:fintech_app/features/auth/presentation/verification/widgets/biometric_error_overlay.dart';
import 'package:fintech_app/features/auth/presentation/verification/widgets/biometric_loading_overlay.dart';

class BiometricVerifyScreen extends StatefulWidget {
  const BiometricVerifyScreen({super.key});

  @override
  State<BiometricVerifyScreen> createState() => _BiometricVerifyScreenState();
}

class _BiometricVerifyScreenState extends State<BiometricVerifyScreen> {
  final BiometricService _biometricService = BiometricService();
  bool _isAuthenticating = false;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    // Start fingerprint authentication automatically
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _startFingerprintVerification();
    });
  }

  Future<void> _startFingerprintVerification() async {
    if (_isAuthenticating) return;

    setState(() {
      _isAuthenticating = true;
      _errorMessage = null;
    });

    try {
      // Try fingerprint authentication directly - BiometricService will handle errors
      final authenticated = await _biometricService.authenticateWithFingerprint(
        localizedReason: 'Scan your fingerprint to continue',
      );

      if (authenticated && mounted) {
        // Success! Navigate to verified screen
        context.go(AppRouter.biometricVerifiedScreen);
      } else if (mounted) {
        // Authentication failed but no exception thrown
        setState(() {
          _errorMessage = 'Fingerprint authentication failed. Try again.';
          _isAuthenticating = false;
        });
      }
    } on BiometricException catch (e) {
      // Handle biometric errors
      if (mounted) {
        final message = _biometricService.getErrorMessage(e);

        // If user cancelled, go back
        if (e.type == BiometricErrorType.cancelled) {
          Navigator.of(context).pop();
          return;
        }

        // Show error message
        setState(() {
          _errorMessage = message;
          _isAuthenticating = false;
        });
      }
    } catch (e) {
      // Handle unexpected errors
      if (mounted) {
        setState(() {
          _errorMessage = 'An error occurred: ${e.toString()}';
          _isAuthenticating = false;
        });
      }
    }
  }

  void _handleFingerPrintTap() {
    if (!_isAuthenticating) {
      _startFingerprintVerification();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Circle
          DecorativeCircleBackground(
            color: context.customColors.secondaryCardColor,
            top: -130.h,
            left: 150.w,
          ),
          // Content
          SafeArea(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return SizedBox(
                  width: constraints.maxWidth,
                  height: constraints.maxHeight,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 24.w,
                      vertical: 20.h,
                    ),
                    child: BiometricVerifyContent(
                      onFingerPrintTap: _handleFingerPrintTap,
                    ),
                  ),
                );
              },
            ),
          ),
          // Error overlay
          if (_errorMessage != null)
            BiometricErrorOverlay(
              errorMessage: _errorMessage!,
              onCancel: () => Navigator.of(context).pop(),
              onRetry: () {
                setState(() => _errorMessage = null);
                _startFingerprintVerification();
              },
            ),
          // Loading indicator
          if (_isAuthenticating)
            const BiometricLoadingOverlay(message: 'Authenticating...'),
        ],
      ),
    );
  }
}
