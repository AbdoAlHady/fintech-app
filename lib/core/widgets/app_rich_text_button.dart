import 'package:fintech_app/core/helpers/extensions.dart';
import 'package:fintech_app/core/theme/app_text_styles.dart';
import 'package:fintech_app/core/widgets/app_text_button.dart';
import 'package:flutter/material.dart';

/// A widget that displays a text with an actionable button next to it
///
/// Commonly used for patterns like:
/// - "Don't have an account? Sign Up"
/// - "Already have an account? Login"
/// - "Agree to Terms and Conditions"
class AppRichTextButton extends StatelessWidget {
  const AppRichTextButton({
    super.key,
    required this.text,
    required this.buttonText,
    required this.onPressed,
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.textStyle,
    this.buttonTextStyle,
    this.textColor,
    this.buttonTextColor,
    this.spacing = 0,
  });

  final String text;
  final String buttonText;
  final VoidCallback onPressed;
  final MainAxisAlignment mainAxisAlignment;
  final TextStyle? textStyle;
  final TextStyle? buttonTextStyle;
  final Color? textColor;
  final Color? buttonTextColor;
  final double spacing;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        Text(
          text,
          style:
              textStyle ??
              AppTextStyles.medium18.copyWith(
                color: textColor ?? context.customColors.hintColor,
              ),
        ),
        if (spacing > 1) SizedBox(width: spacing),
        AppTextButton(
          text: buttonText,
          onPressed: onPressed,
          textStyle: buttonTextStyle ?? AppTextStyles.medium18,
          textColor: buttonTextColor ?? context.customColors.primaryColor,
        ),
      ],
    );
  }
}
