import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

/// Enum representing the different types of biometric authentication
enum AppBiometricType {
  /// Fingerprint authentication
  fingerprint,

  /// Face recognition (Face ID on iOS, Face Unlock on Android)
  face,

  /// Iris scanner
  iris,

  /// Any other biometric type
  other,

  /// No biometric available
  none,
}

/// Custom exception for biometric operations
class BiometricException implements Exception {
  final String message;
  final BiometricErrorType type;

  BiometricException(this.message, this.type);

  @override
  String toString() => 'BiometricException: $message';
}

/// Types of biometric errors
enum BiometricErrorType {
  notAvailable,
  notEnrolled,
  permissionDenied,
  authenticationFailed,
  cancelled,
  timeout,
  lockedOut,
  permanentlyLockedOut,
  unknown,
}

/// Service for handling biometric authentication
class BiometricService {
  static final BiometricService _instance = BiometricService._internal();
  factory BiometricService() => _instance;
  BiometricService._internal();

  final LocalAuthentication _localAuth = LocalAuthentication();

  /// Check if biometric authentication is available on the device
  Future<bool> isDeviceSupported() async {
    try {
      return await _localAuth.isDeviceSupported();
    } catch (e) {
      return false;
    }
  }

  /// Check if biometrics can be used (device supports it and has enrolled biometrics)
  Future<bool> canCheckBiometrics() async {
    try {
      return await _localAuth.canCheckBiometrics;
    } catch (e) {
      return false;
    }
  }

  /// Get list of available biometric types
  Future<List<AppBiometricType>> getAvailableBiometrics() async {
    try {
      final List<AppBiometricType> biometrics = [];
      final availableBiometrics = await _localAuth.getAvailableBiometrics();

      for (var biometric in availableBiometrics) {
        switch (biometric) {
          case BiometricType.fingerprint:
            biometrics.add(AppBiometricType.fingerprint);
            break;
          case BiometricType.face:
            biometrics.add(AppBiometricType.face);
            break;
          case BiometricType.iris:
            biometrics.add(AppBiometricType.iris);
            break;
          case BiometricType.weak:
          case BiometricType.strong:
            // Skip weak and strong as they're not specific types
            break;
        }
      }

      return biometrics;
    } catch (e) {
      return [];
    }
  }

  /// Check if fingerprint is available
  Future<bool> isFingerprintAvailable() async {
    final biometrics = await getAvailableBiometrics();
    return biometrics.contains(AppBiometricType.fingerprint);
  }

  /// Check if face recognition is available
  Future<bool> isFaceIdAvailable() async {
    final biometrics = await getAvailableBiometrics();
    return biometrics.contains(AppBiometricType.face);
  }

  /// Authenticate using fingerprint
  Future<bool> authenticateWithFingerprint({String? localizedReason}) async {
    return await authenticate(
      localizedReason: localizedReason ?? 'Authenticate using your fingerprint',
    );
  }

  /// Authenticate using face recognition
  Future<bool> authenticateWithFaceId({String? localizedReason}) async {
    return await authenticate(
      localizedReason: localizedReason ?? 'Authenticate using Face ID',
    );
  }

  /// Main authentication method
  Future<bool> authenticate({required String localizedReason}) async {
    try {
      // Check if device supports biometrics
      final isSupported = await isDeviceSupported();
      if (!isSupported) {
        throw BiometricException(
          'Biometric authentication is not supported on this device',
          BiometricErrorType.notAvailable,
        );
      }

      // Check if biometrics can be used
      final canCheck = await canCheckBiometrics();
      if (!canCheck) {
        throw BiometricException(
          'No biometric authentication is enrolled on this device',
          BiometricErrorType.notEnrolled,
        );
      }

      // Attempt authentication
      final authenticated = await _localAuth.authenticate(
        localizedReason: localizedReason,
      );

      return authenticated;
    } on PlatformException catch (e) {
      throw _handlePlatformException(e);
    } catch (e) {
      if (e is BiometricException) {
        rethrow;
      }

      // Check if error message contains "userCanceled"
      final errorString = e.toString();
      if (errorString.contains('userCanceled') ||
          errorString.toLowerCase().contains('cancel')) {
        throw BiometricException(
          'Authentication cancelled by user',
          BiometricErrorType.cancelled,
        );
      }

      throw BiometricException(
        'An unexpected error occurred during authentication: ${e.toString()}',
        BiometricErrorType.unknown,
      );
    }
  }

  /// Stop authentication (for cases where authentication is in progress)
  Future<void> stopAuthentication() async {
    try {
      await _localAuth.stopAuthentication();
    } catch (e) {
      // Ignore errors when stopping authentication
    }
  }

  /// Handle platform exceptions and convert to BiometricException
  BiometricException _handlePlatformException(PlatformException e) {
    switch (e.code) {
      case 'NotAvailable':
        return BiometricException(
          'Biometric authentication is not available',
          BiometricErrorType.notAvailable,
        );
      case 'NotEnrolled':
        return BiometricException(
          'No biometrics enrolled on this device',
          BiometricErrorType.notEnrolled,
        );
      case 'LockedOut':
        return BiometricException(
          'Too many failed attempts. Biometric authentication is temporarily locked',
          BiometricErrorType.lockedOut,
        );
      case 'PermanentlyLockedOut':
        return BiometricException(
          'Biometric authentication is permanently locked. Please use device credentials',
          BiometricErrorType.permanentlyLockedOut,
        );
      case 'PasscodeNotSet':
        return BiometricException(
          'Device passcode is not set',
          BiometricErrorType.notEnrolled,
        );
      case 'OtherOperatingSystem':
        return BiometricException(
          'Biometric authentication is not available on this operating system',
          BiometricErrorType.notAvailable,
        );
      default:
        // Check for cancellation
        if (e.code.toLowerCase().contains('cancel') ||
            e.code.toLowerCase().contains('user_cancel')) {
          return BiometricException(
            'Authentication cancelled by user',
            BiometricErrorType.cancelled,
          );
        }
        return BiometricException(
          e.message ?? 'Unknown authentication error',
          BiometricErrorType.unknown,
        );
    }
  }

  /// Get a user-friendly error message
  String getErrorMessage(BiometricException exception) {
    switch (exception.type) {
      case BiometricErrorType.notAvailable:
        return 'Biometric authentication is not available on this device';
      case BiometricErrorType.notEnrolled:
        return 'No biometrics enrolled. Please set up biometric authentication in settings';
      case BiometricErrorType.permissionDenied:
        return 'Permission to use biometric authentication was denied';
      case BiometricErrorType.authenticationFailed:
        return 'Authentication failed. Please try again';
      case BiometricErrorType.cancelled:
        return 'Authentication was cancelled';
      case BiometricErrorType.timeout:
        return 'Authentication timed out. Please try again';
      case BiometricErrorType.lockedOut:
        return 'Too many failed attempts. Please try again later';
      case BiometricErrorType.permanentlyLockedOut:
        return 'Biometric authentication is locked. Please use your device password';
      case BiometricErrorType.unknown:
        return exception.message;
    }
  }

  /// Get biometric type name for display
  String getBiometricTypeName(AppBiometricType type) {
    switch (type) {
      case AppBiometricType.fingerprint:
        return 'Fingerprint';
      case AppBiometricType.face:
        return 'Face ID';
      case AppBiometricType.iris:
        return 'Iris';
      case AppBiometricType.other:
        return 'Biometric';
      case AppBiometricType.none:
        return 'None';
    }
  }

  /// Get biometric status information
  Future<BiometricStatus> getBiometricStatus() async {
    final isSupported = await isDeviceSupported();
    if (!isSupported) {
      return BiometricStatus(
        isAvailable: false,
        canAuthenticate: false,
        availableTypes: [],
        message: 'Biometric authentication is not supported on this device',
      );
    }

    final canCheck = await canCheckBiometrics();
    if (!canCheck) {
      return BiometricStatus(
        isAvailable: true,
        canAuthenticate: false,
        availableTypes: [],
        message: 'No biometrics enrolled on this device',
      );
    }

    final availableTypes = await getAvailableBiometrics();
    return BiometricStatus(
      isAvailable: true,
      canAuthenticate: true,
      availableTypes: availableTypes,
      message: 'Biometric authentication is ready',
    );
  }

  /// Quick check if device has any biometric enrolled
  Future<bool> hasEnrolledBiometrics() async {
    try {
      final isSupported = await isDeviceSupported();
      if (!isSupported) return false;

      final canCheck = await canCheckBiometrics();
      return canCheck;
    } catch (e) {
      return false;
    }
  }
}

/// Status of biometric authentication on the device
class BiometricStatus {
  final bool isAvailable;
  final bool canAuthenticate;
  final List<AppBiometricType> availableTypes;
  final String message;

  BiometricStatus({
    required this.isAvailable,
    required this.canAuthenticate,
    required this.availableTypes,
    required this.message,
  });

  bool get hasFaceId => availableTypes.contains(AppBiometricType.face);
  bool get hasFingerprint =>
      availableTypes.contains(AppBiometricType.fingerprint);
  bool get hasIris => availableTypes.contains(AppBiometricType.iris);
  bool get hasAny => availableTypes.isNotEmpty;
}
