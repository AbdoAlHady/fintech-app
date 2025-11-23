import 'package:fintech_app/core/utils/exports.dart';
import 'package:fintech_app/features/payment/feature_imports.dart';

class FintechApp extends StatelessWidget {
  const FintechApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,
      home: const PaymentMethodsView(),
    );
  }
}
