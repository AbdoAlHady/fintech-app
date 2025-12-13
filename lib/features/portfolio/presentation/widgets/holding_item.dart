part of '../../feature_imports.dart';

class HoldingItem extends StatelessWidget {
  const HoldingItem({super.key, required this.holding});
  final HoldingEntity holding;

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
                child: Center(child: SvgPicture.asset(holding.iconPath)),
              ),
              space(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(holding.name, style: AppTextStyles.bold16),
                  space(height: 4),
                  Text(
                    holding.symbol,
                    style: AppTextStyles.medium14.copyWith(
                      color: AppColors.grey3,
                    ),
                  ),
                  space(height: 12),
                  Text(
                    '${holding.amount} ${holding.amountUnit}',
                    style: AppTextStyles.medium14,
                  ),
                  space(height: 4),
                  Text(
                    holding.currentPrice,
                    style: AppTextStyles.regular12.copyWith(
                      color: AppColors.secondaryColor,
                    ),
                  ),
                ],
              ),
              Spacer(),
              Column(
                children: [
                  Text(
                    '${holding.portfolioPercentage}%',
                    style: AppTextStyles.bold20,
                  ),
                  space(height: 24),
                  Text(
                    '+\$${holding.profitLoss}',
                    style: AppTextStyles.medium14.copyWith(
                      color: AppColors.lightGreen,
                    ),
                  ),
                  space(height: 4),
                  Text(
                    '+${holding.profitLossPercentage}%',
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
