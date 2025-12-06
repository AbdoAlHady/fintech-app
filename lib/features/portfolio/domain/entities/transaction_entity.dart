import 'package:fintech_app/core/utils/app_assets.dart';

class TransactionEntity {
  final String title;
  final String iconPath;
  final DateTime timestamp;
  final double amount;
  final String amountUnit;
  final String priceValue;

  const TransactionEntity({
    required this.title,
    required this.iconPath,
    required this.timestamp,
    required this.amount,
    required this.amountUnit,
    required this.priceValue,
  });

  String get formattedTime {
    final now = DateTime.now();
    final difference = now.difference(timestamp);

    if (difference.inMinutes < 60) {
      return '${difference.inMinutes} minutes ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours} hours ago';
    } else if (difference.inDays < 7) {
      return '${difference.inDays} days ago';
    } else {
      return '${timestamp.day}/${timestamp.month}/${timestamp.year}';
    }
  }
}

List<TransactionEntity> dummyTransactionEntity = [
  TransactionEntity(
    title: 'Buy Bitcoin',
    iconPath: AppAssets.svgsArrow,
    timestamp: DateTime.now().subtract(Duration(minutes: 30)),
    amount: 0.01,
    amountUnit: 'BTC',
    priceValue: r'$452.50',
  ),
  TransactionEntity(
    title: 'Sell Ethereum',
    iconPath: AppAssets.svgsArrow2,
    timestamp: DateTime.now().subtract(Duration(hours: 5)),
    amount: 0.5,
    amountUnit: 'ETH',
    priceValue: r'$1,200.00',
  ),
];
