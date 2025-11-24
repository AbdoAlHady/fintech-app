part of '../../feature_imports.dart';

class RecentTransactions extends StatelessWidget {
  const RecentTransactions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Recent Transactions', style: AppTextStyles.bold18),
        space(height: 10),
        RecentTransactionsListView(),
      ],
    );
  }
}
