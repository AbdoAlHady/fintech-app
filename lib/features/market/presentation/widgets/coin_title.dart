import 'package:fintech_app/core/helpers/spacing.dart';
import 'package:fintech_app/core/theme/app_colors.dart';
import 'package:fintech_app/core/theme/app_text_styles.dart';
import 'package:fintech_app/core/utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CoinTitle extends StatelessWidget {
  const CoinTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 22,
          backgroundColor: AppColors.secondaryColor,
          child: SvgPicture.asset(
            AppAssets.svgsBitcoin,
            width: 24,
            height: 24,
          ),
        ),
        space(width: 10),
          Text(
          "Bitcoin",
          style: AppTextStyles.bold20.copyWith(color: AppColors.primaryColor),
        ),
    
      ],
    );
  }
}