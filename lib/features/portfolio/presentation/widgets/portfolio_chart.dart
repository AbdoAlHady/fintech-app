part of '../../feature_imports.dart';

class PortfolioChart extends StatelessWidget {
  const PortfolioChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            width: 168,
            height: 141,
            child: Stack(
              alignment: Alignment.center,
              children: [
                PieChart(
                  PieChartData(
                    pieTouchData: PieTouchData(
                      touchCallback: (FlTouchEvent event, pieTouchResponse) {},
                    ),
                    borderData: FlBorderData(show: false),
                    sectionsSpace: 0,
                    centerSpaceRadius: 60,
                    sections: [
                      PieChartSectionData(
                        color: AppColors.skyCyan,
                        showTitle: false,
                        value: 40,
                        radius: 20,
                      ),
                      PieChartSectionData(
                        color: AppColors.warmCoral,
                        showTitle: false,
                        value: 35,
                        radius: 20,
                      ),
                      PieChartSectionData(
                        color: AppColors.softViolet,
                        showTitle: false,
                        value: 35,
                        radius: 20,
                      ),
                    ],
                  ),
                ),
                Text('\$143,421.20', style: AppTextStyles.bold15),
              ],
            ),
          ),
        ),
        space(width: 12),
        Expanded(
          child: Column(
            children: [
              PortfolioAssetItem(
                color: AppColors.skyCyan,
                assetName: '\$54,382.64 BTC',
              ),
              space(height: 15),
              PortfolioAssetItem(
                color: AppColors.warmCoral,
                assetName: '\$50,197.00 Bonds',
              ),
              space(height: 15),
              PortfolioAssetItem(
                color: AppColors.softViolet,
                assetName: '\$50,197.00 Bonds',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
