import 'package:flutter/material.dart';

class MainShellLayout extends StatefulWidget {
  final Widget child;

  const MainShellLayout({super.key, required this.child});

  @override
  State<MainShellLayout> createState() => _MainShellLayoutState();
}

class _MainShellLayoutState extends State<MainShellLayout> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int selectedIndex = 0;
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

    return Scaffold(
      body: widget.child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) {
          switch (index) {
            case 0:
              //  context.go('/news_feed');
              break;
            case 1:
              //  context.go('/post');
              break;
            case 2:
              //    context.go('/profile');
              break;
          }
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Color(0xFF1D3A70),
        unselectedItemColor: const Color(0xFF979797),
        backgroundColor: Colors.white.withOpacity(0.8),
        items: items,
      ),
    );
  }
}
