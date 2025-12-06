part of '../../feature_imports.dart';

class HoldingsListView extends StatelessWidget {
  const HoldingsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        return HoldingItem(holding: dummyHoldingEntity[index]);
      },
      separatorBuilder: (context, index) {
        return space(height: 10);
      },
      itemCount: dummyHoldingEntity.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
    );
  }
}
