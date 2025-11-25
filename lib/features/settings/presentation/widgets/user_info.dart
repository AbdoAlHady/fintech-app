part of '../../feature_imports.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 92,
          height: 92,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: context.customColors.secondaryCardColor,
          ),
          child: Image.asset(AppAssets.imagesAvatar),
        ).center,
        space(height: 12),
        Text('Sophia Isabella', style: AppTextStyles.bold20).center,
      ],
    );
  }
}
