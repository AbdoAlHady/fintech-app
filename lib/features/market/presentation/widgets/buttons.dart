import 'package:fintech_app/core/helpers/spacing.dart';
import 'package:fintech_app/core/theme/app_colors.dart';
import 'package:fintech_app/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  const Buttons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 50,
            decoration: BoxDecoration(
              color: AppColors.warmCoral,
              borderRadius: BorderRadius.circular(14),
            ),
            child:  Center(
              child: Text(
                "Sell",
                style: AppTextStyles.bold18.copyWith(
                    color: AppColors.red,
                    ),
              ),
            ),
          ),
        ),
    
        space(width: 12),
    
        Expanded(
          child: Container(
            height: 50,
            decoration: BoxDecoration(
              color:  AppColors.primaryColor,
              borderRadius: BorderRadius.circular(14),
            ),
            child:  Center(
              child: Text(
                "Buy",
                style: AppTextStyles.bold18.copyWith(
                    color: AppColors.white,
                    ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

