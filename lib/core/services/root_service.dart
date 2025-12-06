import 'dart:io';
import 'package:jailbreak_root_detection/jailbreak_root_detection.dart';

class RootService {
  final String bundleId;

  RootService({required this.bundleId});

  Future<DeviceSecurityStatus> checkDeviceSecurity() async {
    final detection = JailbreakRootDetection.instance;

    // Unified root + jailbreak detection
    final bool isRootOrJailbroken = await detection.isJailBroken;

    // Common checks
    final bool isRealDevice = await detection.isRealDevice;
    final bool isNotTrusted = await detection.isNotTrust;
    final bool isDevMode = await detection.isDevMode;

    // Issues
    final List<JailbreakIssue> issues = await detection.checkForIssues;
    final bool hasIssues = issues.isNotEmpty;

    // Emulator check
    final bool isEmulator = !isRealDevice;

    // Android-only: external storage
    final bool isOnExternalStorage = Platform.isAndroid
        ? await detection.isOnExternalStorage
        : false;

    // iOS-only: tamper detection (SAFE)
    bool isTampered = false;

    if (Platform.isIOS) {
      try {
        isTampered = await detection.isTampered(bundleId);
      } catch (e) {
        print("⚠ isTampered not supported / plugin issue → $e");
        isTampered = false;
      }
    }

    return DeviceSecurityStatus(
      isRootedOrJailbroken: isRootOrJailbroken,
      isRealDevice: isRealDevice,
      isNotTrusted: isNotTrusted,
      isDevMode: isDevMode,
      isOnExternalStorage: isOnExternalStorage,
      hasIssues: hasIssues,
      isEmulator: isEmulator,
      isTampered: isTampered,
      issues: issues,
    );
  }
}

class DeviceSecurityStatus {
  final bool isRootedOrJailbroken;
  final bool isRealDevice;
  final bool isNotTrusted;
  final bool isDevMode;
  final bool isOnExternalStorage;
  final bool hasIssues;
  final bool isEmulator;
  final bool isTampered;
  final List<JailbreakIssue> issues;

  const DeviceSecurityStatus({
    required this.isRootedOrJailbroken,
    required this.isRealDevice,
    required this.isNotTrusted,
    required this.isDevMode,
    required this.isOnExternalStorage,
    required this.hasIssues,
    required this.isEmulator,
    required this.isTampered,
    required this.issues,
  });

  /// Check all security flags and log
  bool checkAndLog() {
    print("=== Device Security Status ===");
    print("Rooted / Jailbroken........: $isRootedOrJailbroken");
    print("Real Device................: $isRealDevice");
    print("Not Trusted................: $isNotTrusted");
    print("Developer Mode.............: $isDevMode");
    print("On External Storage........: $isOnExternalStorage");
    print("Has Issues.................: $hasIssues");
    print("Is Emulator................: $isEmulator");
    print("Tampered (iOS only)........: $isTampered");

    if (issues.isNotEmpty) {
      print("Detailed Issues:");
      for (var issue in issues) {
        print(" - $issue");
      }
    }

    print("================================");

    // Device is valid if all checks are safe
    return !isRootedOrJailbroken &&
        isRealDevice &&
        !isNotTrusted &&
        !isDevMode &&
        !isOnExternalStorage &&
        !hasIssues &&
        !isEmulator &&
        !isTampered;
  }
}
