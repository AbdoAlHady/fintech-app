import 'package:fintech_app/core/helpers/extensions.dart';
import 'package:fintech_app/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

/// A customizable text button widget that can be reused throughout the app
///
/// This widget provides a flexible way to create text buttons with:
/// - Custom text and text style
/// - Custom colors (text color, background color, hover color)
/// - Custom padding
/// - Optional underline
/// - Loading state
class AppTextButton extends StatelessWidget {
  const AppTextButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.textStyle,
    this.textColor,
    this.padding,
    this.backgroundColor,
    this.hoverColor,
    this.underline = false,
    this.isLoading = false,
  });

  final String text;
  final VoidCallback? onPressed;
  final TextStyle? textStyle;
  final Color? textColor;
  final EdgeInsetsGeometry? padding;
  final Color? backgroundColor;
  final Color? hoverColor;
  final bool underline;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: isLoading ? null : onPressed,
      style: TextButton.styleFrom(
        padding: padding ?? EdgeInsets.zero,
        backgroundColor: backgroundColor,
        overlayColor: hoverColor,
        minimumSize: Size.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      child: isLoading
          ? SizedBox(
              width: 16,
              height: 16,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(
                  textColor ?? context.customColors.primaryColor,
                ),
              ),
            )
          : Text(
              text,
              style: (textStyle ?? AppTextStyles.semiBold12).copyWith(
                color: textColor ?? context.customColors.primaryColor,
                decoration: underline ? TextDecoration.underline : null,
                decorationColor: textColor ?? context.customColors.primaryColor,
              ),
            ),
    );
  }
}
