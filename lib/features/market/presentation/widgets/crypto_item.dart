import 'package:fintech_app/core/helpers/spacing.dart';
import 'package:fintech_app/core/theme/app_colors.dart';
import 'package:fintech_app/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CryptoItem extends StatelessWidget {
  final String name;
  final String price;
  final String rank;
  final bool isUp;
  final String percentage;
  final String iconPath; 
  final Color logoColor;

  const CryptoItem({
    super.key,
    required this.name,
    required this.price,
    required this.rank,
    required this.isUp,
    required this.percentage,
    required this.iconPath,
    required this.logoColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color:  AppColors.grey200,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: CircleAvatar(
                radius: 18,
                backgroundColor: logoColor,
                child: SvgPicture.asset(
                  iconPath, 
                  width: 24,
                  height: 24,
                ),
              ),
            ),
          ),

          space(width: 14),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style:  AppTextStyles.bold18.copyWith(
                    color: AppColors.darkblue,
                  ),
                ),
                space(height: 6),
                Text(
                  rank,
                  style: TextStyle(color: AppColors.grey3),
                ),
              ],
            ),
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                price,
                style:  AppTextStyles.bold16.copyWith(
                  color: AppColors.darkColor,
                ),
              ),

              space(height: 8),

              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                decoration: BoxDecoration(
                  color: isUp ? AppColors.green : AppColors.red,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Icon(
                      isUp ? Icons.arrow_upward : Icons.arrow_downward,
                      size: 14,
                      color: AppColors.white,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      percentage, 
                      style: AppTextStyles.regular16.copyWith(color: AppColors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
