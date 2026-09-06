import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:mobile_game_tracker/models/game.dart';

class HoursChart extends StatelessWidget {
  final List<Game> games;
  const HoursChart({super.key, required this.games});

  @override
  Widget build(BuildContext context) {
    if (games.isEmpty) {
      return const Center(
        child: Text(
          "Nenhum jogo encontrado.",
          style: TextStyle(color: Color.fromARGB(255, 120, 130, 150)),
        ),
      );
    }

    final maxHours = games.fold<double>(0, (max, game) {
      final hours = double.tryParse(game.hoursPlayed.toString()) ?? 0;
      return hours > max ? hours : max;
    });

    return BarChart(
      BarChartData(
        maxY: maxHours + 10,
        minY: 0,
        alignment: BarChartAlignment.spaceAround,

        gridData: FlGridData(
          show: true,
          drawVerticalLine: false,
          horizontalInterval: 10,
        ),

        borderData: FlBorderData(show: false),

        barTouchData: BarTouchData(
          enabled: true,
          touchTooltipData: BarTouchTooltipData(
            getTooltipItem: (group, groupIndex, rod, rodIndex) {
              final game = games[groupIndex];

              return BarTooltipItem(
                "${game.name}\n${rod.toY.toInt()}h",
                const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              );
            },
          ),
        ),

        titlesData: FlTitlesData(
          topTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),

          rightTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),

          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 35,
              getTitlesWidget: (value, meta) {
                return Text(
                  "${value.toInt()}h",
                  style: const TextStyle(
                    fontSize: 10,
                    color: Color.fromARGB(255, 120, 130, 150),
                  ),
                );
              },
            ),
          ),

          bottomTitles: const AxisTitles(
            sideTitles: SideTitles(reservedSize: 45),
          ),
        ),

        barGroups: List.generate(games.length, (index) {
          final hours =
              double.tryParse(games[index].hoursPlayed.toString()) ?? 0;

          return BarChartGroupData(
            x: index,
            barRods: [
              BarChartRodData(
                width: 20,
                toY: hours,
                borderRadius: BorderRadius.circular(6),
                color: const Color.fromARGB(255, 54, 119, 240),
              ),
            ],
          );
        }),
      ),
    );
  }
}
