import 'package:fintech_app/core/utils/exports.dart';
import 'package:flutter/material.dart';

class CryptoCategory extends StatefulWidget {
  CryptoCategory({super.key});

  @override
  State<CryptoCategory> createState() => _CryptoCategoryState();
}

class _CryptoCategoryState extends State<CryptoCategory> {
  final List<String> cryptoCategories = [
    "All",
    "NFT",
    "DeFi",
    "Gaming",
    "Metaverse",
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        itemCount: cryptoCategories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {

          final bool isSelected = selectedIndex == index;

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: ChoiceChip(
              label: Text(
                cryptoCategories[index],
                style: AppTextStyles.medium14.copyWith(
                  color: isSelected ? AppColors.white :  AppColors.darkPrimaryColor,
                ),
              ),
              selected: isSelected,
              selectedColor:  AppColors.primaryColor,
              backgroundColor: AppColors.white,
              onSelected: (_) {
                setState(() {
                  selectedIndex = index;
                });
              },
            ),
          );
        },
      ),
    );
  }
}
