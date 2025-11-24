part of '../../feature_imports.dart';

class PortfolioViewBody extends StatelessWidget {
  const PortfolioViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PortfolioTotalValue(),
          space(height: 24),
          PortfolioMonths(),
          space(height: 40),
          PortfolioChart(),
          space(height: 27),
          MyHoldings(),
          space(height: 10),
          RecentTransactions(),
        ],
      ),
    );
  }
}
