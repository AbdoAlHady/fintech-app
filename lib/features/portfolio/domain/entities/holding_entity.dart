import 'package:equatable/equatable.dart';
import 'package:fintech_app/core/utils/exports.dart';

class HoldingEntity extends Equatable {
  final String name;
  final String symbol;
  final String iconPath;
  final double amount;
  final String amountUnit;
  final double portfolioPercentage;
  final double profitLoss;
  final double profitLossPercentage;
  final String currentPrice;

  const HoldingEntity({
    required this.name,
    required this.symbol,
    required this.iconPath,
    required this.amount,
    required this.amountUnit,
    required this.portfolioPercentage,
    required this.profitLoss,
    required this.profitLossPercentage,
    required this.currentPrice,
  });

  @override
  List<Object?> get props => [
    name,
    symbol,
    iconPath,
    amount,
    amountUnit,
    portfolioPercentage,
    profitLoss,
    profitLossPercentage,
    currentPrice,
  ];
}

List<HoldingEntity> dummyHoldingEntity = [
  const HoldingEntity(
    name: 'Bitcoin',
    symbol: 'BTC',
    iconPath: AppAssets.svgsBitcoin,
    amount: 0.5,
    amountUnit: 'BTC',
    portfolioPercentage: 50.0,
    profitLoss: 2000.0,
    profitLossPercentage: 10.0,
    currentPrice: r'$2,262.53',
  ),
  const HoldingEntity(
    name: 'Ethereum',
    symbol: 'ETH',
    iconPath: AppAssets.svgsEthereum,
    amount: 2.0,
    amountUnit: 'ETH',
    currentPrice: r'$3,150.75',
    portfolioPercentage: 30.0,
    profitLoss: -500.0,
    profitLossPercentage: -5.0,
  ),
  const HoldingEntity(
    name: 'Litecoin',
    symbol: 'LTC',
    iconPath: AppAssets.svgsLitecoin,
    amount: 10.0,
    amountUnit: 'LTC',
    portfolioPercentage: 20.0,
    profitLoss: 300.0,
    profitLossPercentage: 3.0,
    currentPrice: r'$150.25',
  ),
];
