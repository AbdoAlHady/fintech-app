import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  const AppTextStyles._();
  // Regular
  static TextStyle regular12 = _regular(fontSize: 12);
  static TextStyle regular14 = _regular(fontSize: 14);
  static TextStyle regular16 = _regular(fontSize: 16);
  static TextStyle regular28 = _regular(fontSize: 28);
  // Medium
  static TextStyle medium10 = _medium(fontSize: 10);
  static TextStyle medium12 = _medium(fontSize: 12);
  static TextStyle medium14 = _medium(fontSize: 14);
  static TextStyle medium20 = _medium(fontSize: 20);
  // semiBold
  static TextStyle semiBold10 = _semiBold(fontSize: 10);
  static TextStyle semiBold14 = _semiBold(fontSize: 14);
  static TextStyle semiBold16 = _semiBold(fontSize: 16);
  static TextStyle semiBold18 = _semiBold(fontSize: 18);
  // Bold
  static TextStyle bold10 = _bold(fontSize: 10);
  static TextStyle bold12 = _bold(fontSize: 12);
  static TextStyle bold14 = _bold(fontSize: 14);
  static TextStyle bold15 = _bold(fontSize: 15);
  static TextStyle bold16 = _bold(fontSize: 16);
  static TextStyle bold17 = _bold(fontSize: 17);
  static TextStyle bold18 = _bold(fontSize: 18);
  static TextStyle bold20 = _bold(fontSize: 20);
  static TextStyle bold24 = _bold(fontSize: 24);
  static TextStyle bold26 = _bold(fontSize: 26);
  static TextStyle bold28 = _bold(fontSize: 28);
  static TextStyle bold32 = _bold(fontSize: 32);

  // Base text style with common properties
  static TextStyle _baseTextStyle({
    required double fontSize,
    required FontWeight fontWeight,
    Color? color,
    double? height,
    double? letterSpacing,
  }) {
    return GoogleFonts.lato(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      height: height,
      letterSpacing: letterSpacing,
    );
  }

  static TextStyle _regular({
    required double fontSize,
    Color? color,
    double? height,
    double? letterSpacing,
  }) {
    return _baseTextStyle(
      fontSize: fontSize,
      fontWeight: FontWeight.w400,
      color: color,
      height: height,
      letterSpacing: letterSpacing,
    );
  }

  static TextStyle _medium({
    required double fontSize,
    Color? color,
    double? height,
    double? letterSpacing,
  }) {
    return _baseTextStyle(
      fontSize: fontSize,
      fontWeight: FontWeight.w500,
      color: color,
      height: height,
      letterSpacing: letterSpacing,
    );
  }

  static TextStyle _semiBold({
    required double fontSize,
    Color? color,
    double? height,
    double? letterSpacing,
  }) {
    return _baseTextStyle(
      fontSize: fontSize,
      fontWeight: FontWeight.w600,
      color: color,
      height: height,
      letterSpacing: letterSpacing,
    );
  }

  static TextStyle _bold({
    required double fontSize,
    Color? color,
    double? height,
    double? letterSpacing,
  }) {
    return _baseTextStyle(
      fontSize: fontSize,
      fontWeight: FontWeight.w700,
      color: color,
      height: height,
      letterSpacing: letterSpacing,
    );
  }
}
