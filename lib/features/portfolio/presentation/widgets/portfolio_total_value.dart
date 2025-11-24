part of '../../feature_imports.dart';

class PortfolioTotalValue extends StatelessWidget {
  const PortfolioTotalValue({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.asset(AppAssets.svgsPortfolioCard, height: 140).center,
        Align(
          alignment: Alignment.bottomLeft,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            spacing: 14,
            children: [
              Text(
                '\$143,421.20',
                style: AppTextStyles.bold28.copyWith(color: AppColors.white),
              ),

              Text(
                '+\$123.45 (1.01%) Today',
                style: AppTextStyles.regular14.copyWith(
                  color: AppColors.lightGreen,
                ),
              ),
            ],
          ).withPadding(top: 50, horizontal: 50),
        ),
      ],
    );
  }
}
