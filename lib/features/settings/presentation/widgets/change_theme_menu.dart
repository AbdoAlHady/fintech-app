part of '../../feature_imports.dart';

class ChangeThemeMenu extends StatelessWidget {
  const ChangeThemeMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return MenuItem(
          title: state.themeMode == ThemeMode.dark ? 'Light Mode' : 'Dark Mode',
          icon: state.themeMode == ThemeMode.dark
              ? Icons.light_mode_outlined
              : Icons.dark_mode_outlined,

          trailing: Switch(
            value: state.themeMode == ThemeMode.dark,
            activeThumbColor: AppColors.lightPrimaryColor,
            activeTrackColor: AppColors.primaryColor,
            onChanged: (value) {
              context.read<ThemeCubit>().setTheme();
            },
          ),
        );
      },
    );
  }
}
