import 'package:fintech_app/core/helpers/extensions.dart';
import 'package:fintech_app/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// A customizable form field widget that can be reused throughout the app
///
/// This widget provides a flexible way to create form fields with:
/// - Custom hint text and labels
/// - Custom prefix and suffix icons
/// - Password visibility toggle
/// - Custom borders, colors, and styling
/// - Validation support
/// - Custom keyboard types and input formatters
class AppFormField extends StatefulWidget {
  const AppFormField({
    super.key,
    required this.hintText,
    this.labelText,
    this.controller,
    this.validator,
    this.onChanged,
    this.onFieldSubmitted,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.enabled = true,
    this.readOnly = false,
    this.keyboardType,
    this.textInputAction,
    this.inputFormatters,
    this.maxLines = 1,
    this.minLines,
    this.maxLength,
    this.autovalidateMode,
    this.focusNode,
    this.hintStyle,
    this.labelStyle,
    this.textStyle,
    this.fillColor,
    this.prefixIconColor,
    this.suffixIconColor,
    this.enabledBorderColor,
    this.focusedBorderColor,
    this.errorBorderColor,
    this.borderRadius,
    this.contentPadding,
    this.initialValue,
  });

  // Content
  final String hintText;
  final String? labelText;
  final String? initialValue;

  // Controllers & Callbacks
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final void Function(String)? onFieldSubmitted;
  final FocusNode? focusNode;

  // Icons
  final IconData? prefixIcon;
  final Widget? suffixIcon;
  final Color? prefixIconColor;
  final Color? suffixIconColor;

  // Behavior
  final bool obscureText;
  final bool enabled;
  final bool readOnly;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLines;
  final int? minLines;
  final int? maxLength;
  final AutovalidateMode? autovalidateMode;

  // Styling
  final TextStyle? hintStyle;
  final TextStyle? labelStyle;
  final TextStyle? textStyle;
  final Color? fillColor;
  final Color? enabledBorderColor;
  final Color? focusedBorderColor;
  final Color? errorBorderColor;
  final double? borderRadius;
  final EdgeInsetsGeometry? contentPadding;

  @override
  State<AppFormField> createState() => _AppFormFieldState();
}

class _AppFormFieldState extends State<AppFormField> {
  late bool _isObscured;

  @override
  void initState() {
    super.initState();
    _isObscured = widget.obscureText;
  }

  void _toggleObscure() {
    setState(() {
      _isObscured = !_isObscured;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      initialValue: widget.initialValue,
      validator: widget.validator,
      onChanged: widget.onChanged,
      onFieldSubmitted: widget.onFieldSubmitted,
      focusNode: widget.focusNode,
      obscureText: _isObscured,
      enabled: widget.enabled,
      readOnly: widget.readOnly,
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
      inputFormatters: widget.inputFormatters,
      maxLines: widget.obscureText ? 1 : widget.maxLines,
      minLines: widget.minLines,
      maxLength: widget.maxLength,
      autovalidateMode:
          widget.autovalidateMode ?? AutovalidateMode.onUserInteraction,
      style:
          widget.textStyle ??
          AppTextStyles.regular14.copyWith(
            color: context.customColors.textColor,
          ),
      decoration: InputDecoration(
        hintText: widget.hintText,
        labelText: widget.labelText,
        hintStyle:
            widget.hintStyle ??
            AppTextStyles.regular14.copyWith(
              color: context.customColors.hintColor,
            ),
        labelStyle:
            widget.labelStyle ??
            AppTextStyles.regular14.copyWith(
              color: context.customColors.hintColor,
            ),
        prefixIcon: widget.prefixIcon != null
            ? Icon(
                widget.prefixIcon,
                color: widget.prefixIconColor ?? context.customColors.textColor,
                size: 20,
              )
            : null,
        suffixIcon: widget.obscureText
            ? IconButton(
                icon: Icon(
                  _isObscured ? Icons.visibility_off : Icons.visibility,
                  color:
                      widget.suffixIconColor ?? context.customColors.textColor,
                  size: 20,
                ),
                onPressed: _toggleObscure,
              )
            : widget.suffixIcon,
        enabledBorder: _buildBorder(
          widget.enabledBorderColor ?? context.customColors.primaryColor,
          1,
        ),
        focusedBorder: _buildBorder(
          widget.focusedBorderColor ?? context.customColors.primaryColor,
          2,
        ),
        errorBorder: _buildBorder(widget.errorBorderColor ?? Colors.red, 1),
        focusedErrorBorder: _buildBorder(
          widget.errorBorderColor ?? Colors.red,
          2,
        ),
        disabledBorder: _buildBorder(
          context.customColors.hintColor.withValues(alpha: 0.3),
          1,
        ),
        border: _buildBorder(
          widget.enabledBorderColor ?? context.customColors.primaryColor,
          1,
        ),
        contentPadding:
            widget.contentPadding ??
            const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        filled: true,
        fillColor: widget.fillColor ?? context.customColors.lightBackground,
        counterText: '', // Hide character counter
      ),
    );
  }

  OutlineInputBorder _buildBorder(Color color, double width) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(widget.borderRadius ?? 12),
      borderSide: BorderSide(color: color, width: width),
    );
  }
}
