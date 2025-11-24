import 'package:fintech_app/core/utils/exports.dart';

class CustomColors {
  const CustomColors._({
    required this.cardColor,
    required this.secondaryCardColor,
  });
  final Color cardColor;
  final Color secondaryCardColor;

  CustomColors({required this.cardColor, required this.secondaryCardColor});

  factory CustomColors._light() {
    return CustomColors._(
      cardColor: AppColors.white,
      secondaryCardColor: AppColors.grey200,
    );
  }

  factory CustomColors._dark() {
    return CustomColors._(
      cardColor: AppColors.darkColor,
      secondaryCardColor: AppColors.lightDarkColor,
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
