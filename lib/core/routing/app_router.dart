import 'package:fintech_app/features/market/presentation/views/coin_details_view.dart';
import 'package:fintech_app/features/market/presentation/views/market_view.dart';
import 'package:fintech_app/features/market/presentation/widgets/custom_bottom_nav_bar.dart';
import 'package:fintech_app/features/portfolio/feature_imports.dart';
import 'package:fintech_app/features/settings/feature_imports.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const String marketView = '/';
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
