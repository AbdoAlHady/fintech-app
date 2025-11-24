part of '../../feature_imports.dart';

class HoldingItem extends StatelessWidget {
  const HoldingItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 21, horizontal: 11),

      decoration: BoxDecoration(
        color: context.customColors.cardColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: context.customColors.secondaryCardColor,
                ),
                child: Center(child: SvgPicture.asset(AppAssets.svgsBitcoin)),
              ),
              space(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Bitcoin', style: AppTextStyles.bold16),
                  space(height: 4),
                  Text(
                    'BTC',
                    style: AppTextStyles.medium14.copyWith(
                      color: AppColors.grey3,
                    ),
                  ),
                  space(height: 12),
                  Text('0.05 BTC', style: AppTextStyles.medium14),
                  space(height: 4),
                  Text(
                    '\$2,262.53',
                    style: AppTextStyles.regular12.copyWith(
                      color: AppColors.secondaryColor,
                    ),
                  ),
                ],
              ),
              Spacer(),
              Column(
                children: [
                  Text('50%', style: AppTextStyles.bold20),
                  space(height: 24),
                  Text(
                    '+\$145.20',
                    style: AppTextStyles.medium14.copyWith(
                      color: AppColors.lightGreen,
                    ),
                  ),
                  space(height: 4),
                  Text(
                    '+6.85%',
                    style: AppTextStyles.regular12.copyWith(
                      color: AppColors.lightGreen,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
