import 'package:fintech_app/core/utils/exports.dart';
import 'package:go_router/go_router.dart';
import 'package:fintech_app/core/widgets/session_timeout_listener.dart';
import 'package:fintech_app/core/routing/app_router.dart';

class MainShellLayout extends StatefulWidget {
  final Widget child;

  const MainShellLayout({super.key, required this.child});

  @override
  State<MainShellLayout> createState() => _MainShellLayoutState();
}

class _MainShellLayoutState extends State<MainShellLayout> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final items = <BottomNavigationBarItem>[
      const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),

      const BottomNavigationBarItem(
        icon: Icon(Icons.shopping_basket),
        label: 'Market',
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.person_outlined),
        label: 'Portfolio',
      ),

      const BottomNavigationBarItem(
        icon: Icon(Icons.settings),
        label: 'Settings',
      ),
    ];

    return SessionTimeoutListener(
      duration: const Duration(minutes: 5), // Set session timeout to 5 minutes
      onTimeout: () {
        // Navigate to Biometric Verify Screen on timeout
        context.go(AppRouter.biometricVerifyScreen);
      },
      child: Scaffold(
        body: widget.child,
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: (index) {
            switch (index) {
              case 0:
                context.go(AppRouter.marketView);
                break;
              case 1:
                // context.go(AppRouter.portfolioScreen); // Logic placeholder
                break;
              case 2:
                context.go(AppRouter.portfolioScreen);
                break;
              case 3:
                context.go(AppRouter.settingsView);
                break;
            }
          },
          type: BottomNavigationBarType.fixed,
          selectedItemColor: AppColors.primaryColor,
          unselectedItemColor: AppColors.unSelectedIcon,
          backgroundColor: context.customColors.cardColor,
          items: items,
        ),
    ));
  }
}
