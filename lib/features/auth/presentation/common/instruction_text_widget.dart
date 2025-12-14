import 'package:flutter/material.dart';
import 'package:fintech_app/core/theme/app_text_styles.dart';

class InstructionTextWidget extends StatelessWidget {
  final String text;
  final Color color;
  final double? bottomSpacing;

  const InstructionTextWidget({
    super.key,
    required this.text,
    required this.color,
    this.bottomSpacing,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          text,
          textAlign: TextAlign.center,
          style: AppTextStyles.regular18.copyWith(color: color, height: 1.5),
        ),
        if (bottomSpacing != null) SizedBox(height: bottomSpacing),
      ],
    );
  }
}
