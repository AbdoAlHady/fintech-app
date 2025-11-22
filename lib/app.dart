import 'package:fintech_app/core/theme/app_theme.dart';
import 'package:fintech_app/features/portfolio/screens/portfolio_intro_screen.dart';
import 'package:flutter/material.dart';

class FintechApp extends StatelessWidget {
  const FintechApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      home: const PortfolioIntroScreen(),
    );
  }
}
