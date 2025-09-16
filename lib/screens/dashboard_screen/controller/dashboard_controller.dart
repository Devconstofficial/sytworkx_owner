import 'package:get/get.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:sytworkx_superadmin/utils/app_colors.dart';

class DashboardController extends GetxController {

  final List<FlSpot> mainLineSpots = [
    FlSpot(0, 20),
    FlSpot(1, 30),
    FlSpot(2, 25),
    FlSpot(3, 40),
    FlSpot(4, 60),
    FlSpot(5, 65),
    FlSpot(6, 55),
    FlSpot(7, 70),
    FlSpot(8, 75),
    FlSpot(9, 60),
    FlSpot(10, 45),
    FlSpot(11, 50),
  ];

  final List<FlSpot> secondaryLineSpots = [
    FlSpot(0, 45),
    FlSpot(1, 35),
    FlSpot(2, 30),
    FlSpot(3, 35),
    FlSpot(4, 50),
    FlSpot(5, 40),
    FlSpot(6, 38),
    FlSpot(7, 30),
    FlSpot(8, 25),
    FlSpot(9, 40),
    FlSpot(10, 35),
    FlSpot(11, 30),
  ];


  final Map<String, double> pieChartData = {
    "Free": 45,
    "Basic": 45,
    "Pro": 10,
  };

  final List<Color> pieChartColors = [
    kPrimaryColor,
    kPrimaryColor1,
    kPrimaryColor,
  ];

  final RxList<BarChartGroupData> barGroups = <BarChartGroupData>[].obs;

  @override
  void onInit() {
    super.onInit();

    final List<int> companyCounts = [20, 45, 30, 10, 25, 35, 15, 15, 20, 30, 18, 22];
    barGroups.value = List.generate(12, (index) {
      return BarChartGroupData(
        x: index,
        barRods: [
          BarChartRodData(
            toY: companyCounts[index].toDouble(),
            color: kPrimaryColor1,
            width: 29,
            borderRadius: BorderRadius.circular(1),
          ),
        ],
      );
    });
  }
}
