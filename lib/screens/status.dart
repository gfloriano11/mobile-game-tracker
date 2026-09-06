import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class Status extends StatelessWidget {
  final List<dynamic> games;

  const Status({super.key, required this.games});

  @override
  Widget build(BuildContext context) {
    int totalHours = 0;
    double reviews = 0;

    for (final game in games) {
      totalHours += int.tryParse(game["hoursPlayed"].toString()) ?? 0;

      reviews +=
          double.tryParse(game["review"].toString().replaceAll("/10", "")) ?? 0;
    }

    final averageReview = games.isEmpty ? 0.0 : reviews / games.length;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 253, 253, 253),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Estatísticas",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 25, 43, 82),
                ),
              ),

              const SizedBox(height: 20),

              Row(
                children: [
                  Expanded(
                    child: _buildStatCard(
                      title: "HORAS JOGADAS",
                      value: "${totalHours}h",
                    ),
                  ),

                  const SizedBox(width: 12),

                  Expanded(
                    child: _buildStatCard(
                      title: "MÉDIA DAS NOTAS",
                      value: averageReview.toStringAsFixed(1),
                      valueColor: const Color.fromARGB(255, 255, 80, 120),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 28),

              const Text(
                "Horas por jogo",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 25, 43, 82),
                ),
              ),

              const SizedBox(height: 14),

              Container(
                width: double.infinity,
                height: 400,
                padding: const EdgeInsets.fromLTRB(10, 20, 20, 10),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 245, 246, 250),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: _buildHoursChart(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatCard({
    required String title,
    required String value,
    Color? valueColor,
  }) {
    return Container(
      height: 100,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 245, 246, 250),
        borderRadius: BorderRadius.circular(22),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 11,
              letterSpacing: 0.5,
              color: Color.fromARGB(255, 120, 130, 150),
            ),
          ),

          const SizedBox(height: 5),

          Text(
            value,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: valueColor ?? const Color.fromARGB(255, 25, 43, 82),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHoursChart() {
    if (games.isEmpty) {
      return const Center(
        child: Text(
          "Nenhum jogo encontrado.",
          style: TextStyle(color: Color.fromARGB(255, 120, 130, 150)),
        ),
      );
    }

    final maxHours = games.fold<double>(0, (max, game) {
      final hours = double.tryParse(game["hoursPlayed"].toString()) ?? 0;

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
                "${game["name"]}\n${rod.toY.toInt()}h",
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
              double.tryParse(games[index]["hoursPlayed"].toString()) ?? 0;

          return BarChartGroupData(
            x: index,
            barRods: [
              BarChartRodData(
                toY: hours,
                width: 20,
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
