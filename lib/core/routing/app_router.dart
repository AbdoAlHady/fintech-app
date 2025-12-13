import 'package:fintech_app/features/market/presentation/views/coin_details_view.dart';
import 'package:fintech_app/features/market/presentation/views/market_view.dart';
import 'package:fintech_app/features/market/presentation/widgets/custom_bottom_nav_bar.dart';
import 'package:fintech_app/features/portfolio/feature_imports.dart';
import 'package:fintech_app/features/settings/feature_imports.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/login/screens/login_screen.dart';
import '../../features/auth/presentation/register/screens/register_screen.dart';
import '../../features/auth/presentation/forgot_password/screens/forgot_password_screen.dart';
import '../../features/onboarding/presentation/screens/onboarding_screen.dart';
import '../../features/auth/presentation/verification/screens/biometric_verify_screen.dart';
import '../../features/auth/presentation/verification/screens/biometric_verified_screen.dart';
import '../../features/auth/presentation/verification/screens/face_id_scanning_screen.dart';
import '../../features/auth/presentation/verification/screens/face_id_verified_screen.dart';

abstract class AppRouter {
  static const String marketView = '/';
  static const String portfolioScreen = '/portfolioScreen';
  static const String settingsView = '/settingsView';

  static const String loginScreen = '/login';
  static const String registerScreen = '/register';
  static const String forgotPasswordScreen = '/forgotPassword';
  static const String onboardingScreen = '/onboarding';

  // Biometric verification routes
  static const String biometricVerifyScreen = '/biometricVerify';
  static const String biometricVerifiedScreen = '/biometricVerified';

  // Face ID verification routes
  static const String faceIdScanningScreen = '/faceIdScanning';
  static const String faceIdVerifiedScreen = '/faceIdVerified';

  static final router = GoRouter(
    initialLocation: onboardingScreen,
    routes: <RouteBase>[
      GoRoute(
        path: onboardingScreen,
        builder: (context, state) {
          return const OnboardingScreen();
        },
      ),
      GoRoute(
        path: loginScreen,
        builder: (context, state) {
          return const LoginScreen();
        },
      ),
      GoRoute(
        path: registerScreen,
        builder: (context, state) {
          return const RegisterScreen();
        },
      ),
      GoRoute(
        path: forgotPasswordScreen,
        builder: (context, state) {
          return const ForgotPasswordScreen();
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
            path: marketView,
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
      GoRoute(path: '/coin_detail' , builder: (context, state) {
        return  CoinDetailsView();
      }
      ),
    ],
  );
}
