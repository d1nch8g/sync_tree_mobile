import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:wallet_app/_reusable/colors.dart';

class MarketChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(6),
      child: Container(
        height: MediaQuery.of(context).size.width * 0.72,
        width: MediaQuery.of(context).size.width * 0.92,
        child: LineChart(LineChartData(
          minX: 0,
          maxX: 8,
          minY: 0,
          maxY: 8,
          titlesData: FlTitlesData(
            show: false,
          ),
          gridData: FlGridData(
            show: true,
            getDrawingHorizontalLine: (value) {
              return FlLine(
                color: palette.chartGridColor,
                strokeWidth: 1,
              );
            },
            drawVerticalLine: true,
            getDrawingVerticalLine: (value) {
              return FlLine(
                color: palette.chartGridColor,
                strokeWidth: 1,
              );
            },
          ),
          borderData: FlBorderData(
            show: true,
            border: Border.all(
              width: 2,
              color: palette.buttonEdgesColor,
            ),
          ),
          lineBarsData: [
            LineChartBarData(
                isCurved: true,
                colors: [palette.smallItemsColor],
                barWidth: 1,
                spots: [
                  FlSpot(0, 0),
                  FlSpot(1, 1),
                  FlSpot(2, 4),
                  FlSpot(3, 3),
                  FlSpot(4, 2),
                  FlSpot(5, 5),
                  FlSpot(6, 1),
                  FlSpot(7, 2),
                  FlSpot(8, 7),
                ],
                belowBarData: BarAreaData(
                  show: true,
                  colors: [palette.buttonEdgesColor]
                      .map((color) => color.withOpacity(0.3))
                      .toList(),
                ))
          ],
        )),
      ),
    );
  }
}
