part of '../../feature_imports.dart';

class HoldingsListView extends StatelessWidget {
  const HoldingsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        return HoldingItem();
      },
      separatorBuilder: (context, index) {
        return space(height: 10);
      },
      itemCount: 5,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
    );
  }
}
