import 'package:fintech_app/core/utils/exports.dart';
import 'package:fintech_app/features/market/presentation/widgets/market_view_body.dart';

class MarketScreen extends StatelessWidget {
  const MarketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppStrings.market,
          style: AppTextStyles.bold24.copyWith(color: AppColors.primaryColor),
        ),
      ),
      body: MarketViewBody().withPadding(vertical: 10, horizontal: 20),
    );
  }

}