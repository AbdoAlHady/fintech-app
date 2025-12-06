import 'package:fintech_app/app.dart';
import 'package:fintech_app/core/helpers/cache_helper.dart';
import 'package:fintech_app/core/services/root_service.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final securityService = RootService(bundleId: "com.example.fintech_app");
  final status = await securityService.checkDeviceSecurity();

  final isDeviceSafe = status.checkAndLog();

  if (!isDeviceSafe) {
    print("⚠️ Device is not secure! Take action.");
  } else {
    print("✅ Device is safe to use.");
  }

  await CacheHelper().init();
  runApp(const FintechApp());
}
