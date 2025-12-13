import 'package:fintech_app/core/helpers/spacing.dart';
import 'package:fintech_app/core/theme/app_colors.dart';
import 'package:fintech_app/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class HighChartValue extends StatelessWidget {
  const HighChartValue({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              Text(
                "\$54,382.64",
                style: AppTextStyles.bold26.copyWith(color: AppColors.textBlack)
                ),
              
              space(height: 6),
              Text(
                "/ 1 BTC",
                style: AppTextStyles.regular14.copyWith(color: AppColors.textGrey),
              ),
            ],
          ),
    
          const Spacer(),
    
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Icon(Icons.arrow_upward,
                    color: AppColors.white, size: 16),
                 space(width: 5),
                 Text(
                  "15.3%",
                  style: AppTextStyles.bold12.copyWith(color: AppColors.white),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

