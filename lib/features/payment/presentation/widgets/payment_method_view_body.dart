part of '../../feature_imports.dart';

class PaymentMethodViewBody extends StatefulWidget {
  const PaymentMethodViewBody({super.key});

  @override
  State<PaymentMethodViewBody> createState() => _PaymentMethodViewBodyState();
}

class _PaymentMethodViewBodyState extends State<PaymentMethodViewBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PaymentMethodsListView(),
        Theme(
          data: ThemeData(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
          ),
          child: SwitchListTile(
            hoverColor: Colors.transparent,
            value: true,
            contentPadding: EdgeInsets.zero,
            activeThumbColor: AppColors.white,
            activeTrackColor: AppColors.primaryColor,
            onChanged: (value) {},
            title: Text(AppStrings.sendReceipt, style: AppTextStyles.medium12),
          ),
        ),
        space(height: 20),
        AppElevatedButton(onPressed: () {}, text: AppStrings.buy, radius: 31),
      ],
    );
  }
}
