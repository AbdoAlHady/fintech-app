part of '../../feature_imports.dart';

class TransactionListItem extends StatelessWidget {
  const TransactionListItem({super.key});

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
                child: Center(child: SvgPicture.asset(AppAssets.svgsArrow)),
              ),
              space(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Buy Bitcoin', style: AppTextStyles.bold16),
                  space(height: 4),
                  Text(
                    '2 hours ago',
                    style: AppTextStyles.medium14.copyWith(
                      color: AppColors.grey3,
                    ),
                  ),
                ],
              ),
              Spacer(),
              Column(
                children: [
                  Text('0.01 BTC', style: AppTextStyles.medium14),
                  space(height: 4),
                  Text(
                    '-\$452.50',
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
