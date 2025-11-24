import 'package:fintech_app/core/theme/app_text_styles.dart';
import 'package:fintech_app/features/market/presentaton/widgets/crypto_item.dart';
import 'package:flutter/material.dart';

class MarketScreen extends StatelessWidget {
  const MarketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Crypto Market',
          style: AppTextStyles.bold24.copyWith(color: const Color(0xFF1D3A70)),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.search, color: Colors.grey),
                          const SizedBox(width: 8),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Search',
                                hintStyle: TextStyle(color: Colors.grey[500]),
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.tune, color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: 40,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  //  padding: const EdgeInsets.symmetric(horizontal: 4),
                  children: [
                    _buildFilterChip('All', isSelected: true),
                    _buildFilterChip('DeFi'),
                    _buildFilterChip('NFT'),
                    _buildFilterChip('Gaming'),
                    _buildFilterChip('Metaverse'),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView(
                  children: [
                    CryptoItem(
                      name: "Bitcoin",
                      rank: "Rank #1",
                      price: "\$54,382.64",
                      isUp: true,
                      logoColor: Colors.orange,
                      ticker: "B",
                    ),
                    CryptoItem(
                      name: "Etherium",
                      rank: "Rank #2",
                      price: "\$4,145.61",
                      isUp: false,
                      logoColor: Colors.grey,
                      ticker: "E",
                    ),
                    CryptoItem(
                      name: "Litecoin",
                      rank: "Rank #3",
                      price: "\$207.3",
                      isUp: false,
                      logoColor: Colors.blue.shade700,
                      ticker: "L",
                    ),
                    CryptoItem(
                      name: "Solana",
                      rank: "Rank #4",
                      price: "\$227.93",
                      isUp: true,
                      logoColor: Colors.green.shade700,
                      ticker: "S",
                    ),
                    CryptoItem(
                      name: "Binance Coin",
                      rank: "Rank #5",
                      price: "\$610.5",
                      isUp: false,
                      logoColor: Colors.amber,
                      ticker: "B",
                    ),
                    CryptoItem(
                      name: "Ripple",
                      rank: "Rank #6",
                      price: "\$1.0358",
                      isUp: true,
                      logoColor: Colors.black87,
                      ticker: "R",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFilterChip(String label, {bool isSelected = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: ChoiceChip(
        label: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : Color(0xFF1E1F4B),
          ),
        ),
        selected: isSelected,
        selectedColor: const Color(0xFF1D3A70),
        backgroundColor: Colors.white,
        elevation: 0,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        onSelected: (_) {},
      ),
    );
  }
}
