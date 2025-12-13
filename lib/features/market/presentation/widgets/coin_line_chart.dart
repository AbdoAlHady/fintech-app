import 'package:fintech_app/core/theme/app_colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class CoinLineChart extends StatelessWidget {
  const CoinLineChart({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 260,
      child: LineChart(
        LineChartData(
          minX: 0,
          maxX: 6,
          minY: 0,
          maxY: 6,

          // خطوط الخلفية
          gridData: FlGridData(
            show: true,
            drawVerticalLine: false,
            horizontalInterval: 1,
            getDrawingHorizontalLine: (_) => FlLine(
              color: AppColors.grey,
              strokeWidth: 1,
            ),
          ),

          // المحورين
          titlesData: FlTitlesData(
            leftTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            topTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            rightTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                interval: 1,
                getTitlesWidget: (value, meta) {
                  switch (value.toInt()) {
                    case 0:
                      return const Text("00.00");
                    case 1:
                      return const Text("04.00");
                    case 2:
                      return const Text("08.00");
                    case 3:
                      return const Text("12.00");
                    case 4:
                      return const Text("16.00");
                    case 5:
                      return const Text("20.00");
                    case 6:
                      return const Text("23.59");
                  }
                  return const Text("");
                },
              ),
            ),
          ),

          // شكل الحدود
          borderData: FlBorderData(show: false),

          // البيانات + الشكل + الجريدنت
          lineBarsData: [
            LineChartBarData(
              spots: const [
                FlSpot(0, 3),
                FlSpot(1, 4),
                FlSpot(2, 3.2),
                FlSpot(3, 2),
                FlSpot(4, 4.2),
                FlSpot(5, 6),
                FlSpot(6, 4),
              ],
              isCurved: true,
              barWidth: 3,

              // اللون الأساسي للخط
              color: AppColors.primaryColor,

              // الجريدنت تحت الخط
              belowBarData: BarAreaData(
                show: true,
                gradient: LinearGradient(
                  colors: [
                    const Color(0xFF1E3E68).withOpacity(.4),
                    const Color(0xFF1E3E68).withOpacity(.05),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),

              // النقطة ال Active زي الصورة
              dotData: FlDotData(
                show: true,
                getDotPainter: (spot, percent, barData, index) {
                  // نخلي اخر نقطة بس اللي لونها برتقالي
                  if (index == 5) {
                    return FlDotCirclePainter(
                      radius: 6,
                      color: AppColors.secondaryColor,
                      strokeWidth: 3,
                      strokeColor: AppColors.white,
                    );
                  }
                  return FlDotCirclePainter(
                    radius: 0,
                    color: Colors.transparent,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
