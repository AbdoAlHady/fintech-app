import 'package:fintech_app/features/market/presentaton/views/market_screen.dart';
import 'package:fintech_app/features/market/presentaton/widgets/custom_bottom_nav_bar.dart';
import 'package:fintech_app/features/portfolio/feature_imports.dart';
import 'package:fintech_app/features/settings/feature_imports.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const String marketScreen = '/';
  static const String portfolioScreen = '/portfolioScreen';
  static const String settingsView = '/settingsView';

  static final router = GoRouter(
    initialLocation: settingsView,
    routes: <RouteBase>[
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
