import 'package:fintech_app/core/helpers/spacing.dart';
import 'package:fintech_app/core/theme/app_colors.dart';
import 'package:fintech_app/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class CoinDetails extends StatelessWidget {
  const CoinDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Text(
          "About Bitcoin",
          style: AppTextStyles.semiBold18.copyWith(
            color: AppColors.primaryColor,
          ),
        ),

        space(height: 10),

        Text(
          "Bitcoin is a decentralized cryptocurrency originally described in "
          "a 2008 whitepaper by a person, or group of people, using the alias "
          "Satoshi Nakamoto. It was launched in January 2009.",
          style: AppTextStyles.regular16.copyWith( color: AppColors.grey3),
        ),
      ],
    );
  }
}

