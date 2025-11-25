part of '../../feature_imports.dart';

class SettingsViewBody extends StatelessWidget {
  const SettingsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UserInfo(),
          SizedBox(height: 24),
          Text('General', style: AppTextStyles.semiBold16),
          SizedBox(height: 10),
          // Icon(Iconsax.user, color: AppColors.darkBackground, size: 20),
          MenuItem(title: 'My Account', icon: Iconsax.user, onTap: () {}),
          _buildDivider(),
          MenuItem(
            title: 'Billing/Payment',
            icon: Iconsax.wallet,
            onTap: () {},
          ),
          _buildDivider(),
          MenuItem(title: 'FAQ & Support', icon: Icons.help, onTap: () {}),

          SizedBox(height: 24),
          Text('Settings', style: AppTextStyles.semiBold16),
          SizedBox(height: 10),

          MenuItem(
            title: 'Language',
            icon: Iconsax.language_square,
            onTap: () {},
          ),
          _buildDivider(),
          MenuItem(
            title: 'Dark Mode',
            icon: Icons.dark_mode_outlined,
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Divider _buildDivider() => Divider(color: AppColors.grey2);
}
