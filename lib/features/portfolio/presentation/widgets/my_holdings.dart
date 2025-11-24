part of '../../feature_imports.dart';

class MyHoldings extends StatelessWidget {
  const MyHoldings({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('My Holdings', style: AppTextStyles.bold18),
        space(height: 10),
        HoldingsListView(),
      ],
    );
  }
}
