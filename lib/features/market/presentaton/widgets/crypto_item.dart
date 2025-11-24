import 'package:flutter/material.dart';

class CryptoItem extends StatelessWidget {
  final String name;
  final String price;
  final String rank;
  final bool isUp;
  final Color logoColor;
  final String ticker;

  const CryptoItem({
    super.key,
    required this.name,
    required this.price,
    required this.rank,
    required this.isUp,
    required this.logoColor,
    required this.ticker,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          // Logo
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: const Color(0xFFF1F6F9),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: CircleAvatar(
                backgroundColor: logoColor,
                radius: 18,
                child: Text(
                  ticker,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(width: 14),

          // Name + rank
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1E3E28),
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  rank,
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ],
            ),
          ),

          // Price + change
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                price,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1E3E28),
                ),
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                decoration: BoxDecoration(
                  color: isUp ? Colors.green : Colors.red,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Icon(
                      isUp ? Icons.arrow_upward : Icons.arrow_downward,
                      size: 14,
                      color: Colors.white,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      isUp ? "15.3%" : "-2.1%",
                      style: const TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}