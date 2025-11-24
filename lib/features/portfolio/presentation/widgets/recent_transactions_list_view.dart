part of '../../feature_imports.dart';

class RecentTransactionsListView extends StatelessWidget {
  const RecentTransactionsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 5,
      separatorBuilder: (context, index) => space(height: 10),
      itemBuilder: (context, index) {
        return TransactionListItem();
      },
    );
  }
}
