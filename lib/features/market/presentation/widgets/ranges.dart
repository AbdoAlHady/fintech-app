import 'package:fintech_app/core/theme/app_colors.dart';
import 'package:fintech_app/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class Ranges extends StatefulWidget {
  const Ranges({super.key});

  @override
  State<Ranges> createState() => _RangesState();
}

class _RangesState extends State<Ranges> {
    final ranges = ["1h", "1d", "1w", "1m", "1y"];
    int selectedRange = 1; 
  @override
  Widget build(BuildContext context) {
    return  Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(
              ranges.length,
              (index) => GestureDetector(
                onTap: () => setState(() => selectedRange = index),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: selectedRange == index
                        ? AppColors.primaryColor
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    ranges[index],
                    style: AppTextStyles.regular12.copyWith(
                      color: selectedRange == index
                          ? AppColors.white
                          : AppColors.grey2,
                    ),
                  ),
                ),
              ),
            ),
          );
  
  }
}