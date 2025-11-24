part of '../../feature_imports.dart';

class PortfolioView extends StatelessWidget {
  const PortfolioView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppStrings.portfolio)),
      body: PortfolioViewBody().withPadding(horizontal: 23, vertical: 30),
    );
  }
}
