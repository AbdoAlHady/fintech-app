part of '../../feature_imports.dart';

class CardItem extends StatefulWidget {
  const CardItem({super.key});

  @override
  State<CardItem> createState() => _CardItemState();
}

class _CardItemState extends State<CardItem> {
  bool _isOpened = false;
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
      ),
      child: ExpansionTile(
        tilePadding: EdgeInsets.zero,
        shape: const Border(),
        collapsedShape: const Border(),
        backgroundColor: Colors.transparent,
        collapsedBackgroundColor: Colors.transparent,
        trailing: RotatedBox(
          quarterTurns: _isOpened ? 2 : 1,
          child: SvgPicture.asset(AppAssets.svgsArrowUp),
        ),
        onExpansionChanged: (expanded) {
          setState(() {
            _isOpened = expanded;
          });
        },
        expandedCrossAxisAlignment: CrossAxisAlignment.start,
        controlAffinity: ListTileControlAffinity.trailing,
        title: Text('Credit Card', style: AppTextStyles.bold16),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CardType(imageUrl: AppAssets.imagesMasterCard),
              CardType(imageUrl: AppAssets.imagesVisa),
              CardType(imageUrl: AppAssets.imagesApplePay),
            ],
          ),
          space(height: 16),
          CardWidget(),
        ],
      ),
    );
  }
}
