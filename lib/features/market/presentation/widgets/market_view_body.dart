import 'package:fintech_app/core/utils/exports.dart';
import 'package:fintech_app/features/market/presentation/widgets/crypto_category.dart';
import 'package:fintech_app/features/market/presentation/widgets/crypto_item.dart';
import 'package:fintech_app/features/market/presentation/widgets/crypto_item_list_view.dart';
import 'package:fintech_app/features/market/presentation/widgets/search_text_field.dart';
import 'package:flutter/material.dart';

class MarketViewBody extends StatelessWidget {
  const MarketViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(children: [Expanded(child: SearchTextField())]),
          space(height: 10),
          CryptoCategory(),
          space(height: 10),

          CryptoItemListView(),
        ],
      ),
    );
  }
}
