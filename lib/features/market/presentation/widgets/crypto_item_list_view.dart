import 'package:fintech_app/core/theme/app_colors.dart';
import 'package:fintech_app/core/utils/app_assets.dart';
import 'package:fintech_app/features/market/presentation/widgets/crypto_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CryptoItemListView extends StatelessWidget {

  const CryptoItemListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          

          return GestureDetector(
            onTap: () {
              context.push('/coin_detail');
            },
            child: CryptoItem(
              name: "name",
              price: "\$3434",
              rank: "Rank #${index + 1}",
              isUp: 5 > 0,
              percentage: "33%",
              iconPath:  AppAssets.svgsBitcoin,        
              logoColor: AppColors.lightRed,
            ),
          );
        },
      ),
    );
  }
}
