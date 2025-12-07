import 'package:fintech_app/core/utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:fintech_app/core/services/biometric_service.dart';
import 'package:fintech_app/core/routing/app_router.dart';
import 'package:go_router/go_router.dart';
import 'package:fintech_app/features/auth/presentation/verification/widgets/face_id_scanning_content.dart';

import 'package:fintech_app/features/auth/presentation/verification/widgets/biometric_error_overlay.dart';
import 'package:fintech_app/features/auth/presentation/verification/widgets/biometric_loading_overlay.dart';

class FaceIdScanningScreen extends StatefulWidget {
  const FaceIdScanningScreen({super.key});

  @override
  State<FaceIdScanningScreen> createState() => _FaceIdScanningScreenState();
}

class _FaceIdScanningScreenState extends State<FaceIdScanningScreen> {
  final BiometricService _biometricService = BiometricService();
  bool _isAuthenticating = false;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    // Start Face ID authentication automatically
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _startFaceIdVerification();
    });
  }

  Future<void> _startFaceIdVerification() async {
    if (_isAuthenticating) return;

    setState(() {
      _isAuthenticating = true;
      _errorMessage = null;
    });

    try {
      // Try Face ID authentication directly
      final authenticated = await _biometricService.authenticateWithFaceId(
        localizedReason: 'Authenticate using Face ID',
      );

      if (authenticated && mounted) {
        // Success! Navigate to verified screen
        context.go(AppRouter.faceIdVerifiedScreen);
      } else if (mounted) {
        // Authentication failed
        setState(() {
          _errorMessage = 'Face ID authentication failed. Try again.';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background
          Positioned.fill(
            child: Image.asset(AppAssets.svgsGirlBackground, fit: BoxFit.cover),
          ), // Content
          FaceIdScanningContent(
            onTap: () {
              if (!_isAuthenticating) {
                _startFaceIdVerification();
              }
            },
          ),
          // Error overlay
          if (_errorMessage != null)
            BiometricErrorOverlay(
              errorMessage: _errorMessage!,
              onCancel: () => context.pop(),
              onRetry: () {
                setState(() => _errorMessage = null);
                _startFaceIdVerification();
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
