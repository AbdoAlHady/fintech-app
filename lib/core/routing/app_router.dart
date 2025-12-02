import 'package:fintech_app/features/market/presentaton/views/market_screen.dart';
import 'package:fintech_app/features/market/presentaton/widgets/custom_bottom_nav_bar.dart';
import 'package:fintech_app/features/portfolio/feature_imports.dart';
import 'package:fintech_app/features/settings/feature_imports.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/login/screens/login_screen.dart';
import '../../features/auth/presentation/verification/screens/biometric_verify_screen.dart';
import '../../features/auth/presentation/verification/screens/biometric_verified_screen.dart';
import '../../features/auth/presentation/verification/screens/face_id_scanning_screen.dart';
import '../../features/auth/presentation/verification/screens/face_id_verified_screen.dart';

abstract class AppRouter {
  static const String marketScreen = '/';
  static const String portfolioScreen = '/portfolioScreen';
  static const String settingsView = '/settingsView';

  static const String loginScreen = '/login';

  // Biometric verification routes
  static const String biometricVerifyScreen = '/biometricVerify';
  static const String biometricVerifiedScreen = '/biometricVerified';

  // Face ID verification routes
  static const String faceIdScanningScreen = '/faceIdScanning';
  static const String faceIdVerifiedScreen = '/faceIdVerified';

  static final router = GoRouter(
    initialLocation: loginScreen,
    routes: <RouteBase>[
      GoRoute(
        path: loginScreen,
        builder: (context, state) {
          return const LoginScreen();
        },
      ),
      // Biometric (Fingerprint) routes
      GoRoute(
        path: biometricVerifyScreen,
        builder: (context, state) {
          return const BiometricVerifyScreen();
        },
      ),
      GoRoute(
        path: biometricVerifiedScreen,
        builder: (context, state) {
          return const BiometricVerifiedScreen();
        },
      ),
      // Face ID routes
      GoRoute(
        path: faceIdScanningScreen,
        builder: (context, state) {
          return const FaceIdScanningScreen();
        },
      ),
      GoRoute(
        path: faceIdVerifiedScreen,
        builder: (context, state) {
          return const FaceIdVerifiedScreen();
        },
      ),
      ShellRoute(
        builder: (context, state, child) {
          return MainShellLayout(child: child);
        },
        routes: [
          GoRoute(
            path: marketScreen,
            builder: (context, state) {
              return const MarketScreen();
            },
          ),
          GoRoute(
            path: portfolioScreen,
            builder: (context, state) {
              return const PortfolioView();
            },
          ),
          GoRoute(
            path: settingsView,
            builder: (context, state) {
              return const SettingsView();
            },
          ),
        ],
      ),
    ],
  );
}
