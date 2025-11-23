import 'package:fintech_app/features/market/presentaton/views/market_screen.dart';
import 'package:fintech_app/features/market/presentaton/widgets/custom_bottom_nav_bar.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const String marketScreen = '/';

  static final router = GoRouter(
    routes: <RouteBase>[



      ShellRoute(
        builder: (context, state, child) {
        return MainShellLayout(child: child);
      },
        routes: [
        GoRoute(path: marketScreen, builder: (context, state) {
        return const MarketScreen();
      }),
      ]),
  






    ]
  );

}
