import 'package:fintech_app/core/utils/exports.dart';
import 'package:fintech_app/features/market/presentation/widgets/coin_details_view_body.dart';
import 'package:flutter/material.dart';

class CoinDetailsView extends StatelessWidget {
  const CoinDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            context.pop();
          },
          color: AppColors.primaryColor,
        ),
        title: Text(
          AppStrings.coinDetails,
          style: AppTextStyles.bold24.copyWith(color: AppColors.primaryColor),
          
        ),
        centerTitle: true,
      ),
      body: CoinDetailsViewBody().withPadding(vertical: 10, horizontal: 20),
    );
  }
}