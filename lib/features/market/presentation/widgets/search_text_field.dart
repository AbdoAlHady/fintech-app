import 'package:fintech_app/core/helpers/spacing.dart';
import 'package:fintech_app/core/theme/app_colors.dart';
import 'package:fintech_app/core/theme/app_text_styles.dart';
import 'package:fintech_app/core/utils/app_strings.dart';
import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(Icons.search, color: AppColors.grey),
            space(width: 8),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: AppStrings.search,
                  hintStyle: AppTextStyles.regular16,
                ),
              ),
            ),
            IconButton(
              onPressed: () {},
              icon:  Icon(Icons.tune, color: AppColors.grey),
            ),
          ],
        ),
      );
  }
}