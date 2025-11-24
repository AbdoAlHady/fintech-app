part of '../../feature_imports.dart';

class PortfolioAssetItem extends StatelessWidget {
  final Color color;
  final String assetName;

  const PortfolioAssetItem({
    super.key,
    required this.color,
    required this.assetName,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 14,
          height: 14,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        space(width: 8),
        Text(assetName, style: AppTextStyles.bold15),
      ],
    );
  }
}
