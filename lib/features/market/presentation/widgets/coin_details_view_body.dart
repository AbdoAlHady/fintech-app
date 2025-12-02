import 'package:fintech_app/core/helpers/spacing.dart';
import 'package:fintech_app/core/theme/app_colors.dart';
import 'package:fintech_app/core/theme/app_text_styles.dart';
import 'package:fintech_app/features/market/presentation/widgets/buttons.dart';
import 'package:fintech_app/features/market/presentation/widgets/coin_details.dart';
import 'package:fintech_app/features/market/presentation/widgets/coin_line_chart.dart';
import 'package:fintech_app/features/market/presentation/widgets/coin_title.dart';
import 'package:fintech_app/features/market/presentation/widgets/high_chart_value.dart';
import 'package:fintech_app/features/market/presentation/widgets/ranges.dart';
import 'package:fintech_app/features/market/presentation/widgets/statics_values.dart';
import 'package:flutter/material.dart';

class CoinDetailsViewBody extends StatefulWidget {
  const CoinDetailsViewBody({super.key});

  @override
  State<CoinDetailsViewBody> createState() => _CoinDetailsViewBodyState();
}

class _CoinDetailsViewBodyState extends State<CoinDetailsViewBody> {
  int selectedRange = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CoinTitle(),
            space(height: 20),
            HighChartValue(),

            space(height: 20),

            const CoinLineChart(),

            space(height: 16),

            Ranges(),

            space(height: 25),
            Text(
              "Statics",
              style: AppTextStyles.semiBold18.copyWith(color: AppColors.darkPrimaryColor,
              ),
            ),
            space(height: 16),

            StaticsValues(label: "Current Price", value: "44,826.12 \$"),
            StaticsValues(label: "Market Cap", value: "836,819 \$"),
            StaticsValues(label: "Volume 24h", value: "35,867 \$"),
            StaticsValues(label: "Available Supply", value: "18,784"),
            StaticsValues(label: "Max Supply", value: "21,000"),

            space(height: 25),

            CoinDetails(),

            space(height: 30),

            Buttons(),

            space(height: 40),
          ],
        ),
      ),
    );
  }
}
