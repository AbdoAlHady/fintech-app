part of '../../feature_imports.dart';

class PaymentMethodsView extends StatelessWidget {
  const PaymentMethodsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppStrings.paymentMethod), centerTitle: true),
      body: PaymentMethodViewBody().withPadding(vertical: 20, horizontal: 30),
    );
  }
}
