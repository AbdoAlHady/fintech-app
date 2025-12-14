import 'package:fintech_app/core/utils/exports.dart';

class CustomColors {
  const CustomColors._({
    required this.cardColor,
    required this.secondaryCardColor,
    required this.primaryColor,
    required this.textColor,
    required this.hintColor,
    required this.lightBackground,
  });
  final Color cardColor;
  final Color secondaryCardColor;
  final Color primaryColor;
  final Color textColor;
  final Color hintColor;
  final Color lightBackground;

  CustomColors({
    required this.cardColor,
    required this.secondaryCardColor,
    required this.primaryColor,
    required this.textColor,
    required this.hintColor,
    required this.lightBackground,
  });

  factory CustomColors._light() {
    return CustomColors._(
      lightBackground: AppColors.lightBackground,
      cardColor: AppColors.white,
      secondaryCardColor: AppColors.grey200,
      primaryColor: AppColors.primaryColor,
      textColor: AppColors.textBlack,
      hintColor: AppColors.hintColor,
    );
  }

  factory CustomColors._dark() {
    return CustomColors._(
      lightBackground: AppColors.darkBackground,
      cardColor: AppColors.darkColor,
      secondaryCardColor: AppColors.lightDarkColor,
      primaryColor: AppColors.white,
      textColor: AppColors.white,
      hintColor: AppColors.grey3,
    );
  }
}

extension CustomColorExtension on ThemeData {
  CustomColors get customColors {
    return brightness == Brightness.light
        ? CustomColors._light()
        : CustomColors._dark();
  }
}
