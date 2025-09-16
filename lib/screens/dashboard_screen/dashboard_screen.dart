import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pie_chart/pie_chart.dart' as pie;
import 'package:sytworkx_superadmin/custom_widgets/custom_text.dart';
import 'package:sytworkx_superadmin/utils/app_images.dart';
import 'package:sytworkx_superadmin/utils/sizedBox_extention.dart';
import '../../custom_widgets/pages_layout.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_styles.dart';
import 'controller/dashboard_controller.dart';

class DashboardScreen extends GetView<DashboardController> {
  const DashboardScreen({super.key});

  insightContainer(Color color, String title, String amount, String img,percent,{bool isDown = false}) {
    return Container(
      width: 300.w,
      // height: 147.h,
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20.r),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h,),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(text: amount,fontWeight: FontWeight.w700,fontSize: 28.sp,color: kWhiteColor,),
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: kWhiteColor.withValues(alpha: 0.4),
                    boxShadow: [
                      BoxShadow(
                        color: kPrimaryColor1.withOpacity(0.12),
                        blurRadius: 10,
                        spreadRadius: 0,
                        offset: Offset(0, 2)
                      )
                    ]
                  ),
                  child: Center(
                    child: Image.asset(
                      img,
                      height: 24.h,
                      width: 24.w,
                      color: kWhiteColor,
                    ),
                  ),
                ),
              ],
            ),
            2.toHeight,
            CustomText(text: title,fontWeight: FontWeight.w400,fontSize: 14.sp,color: kWhiteColor,),
            12.toHeight,
            Row(
              children: [
                Image.asset(isDown ? kDownArrowIcon : kUpArrowIcon,height: 20,width: 20,),
                CustomText(text: "  10.2  +$percent% this week",fontWeight: FontWeight.w400,fontSize: 12.sp,color: kWhiteColor,),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      headerTitle: "Welcome, Tony",
      children: [
        32.toHeight,
        Row(
          spacing: 24.w,
          children: [
            insightContainer(kPrimaryColor, "Total Companies", "91", kCaseIcon, "1.01",isDown: true),
            insightContainer(kPrimaryColor1, "Total Revenue Generated", "\$23,866.00", kCurrencyIcon, "1.01",isDown: false)
          ],
        ),
        34.toHeight,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(text: "Revenue",fontSize: 20.sp,fontWeight: FontWeight.w400,),
            Container(
              width: 90,
              height: 30,
              decoration: BoxDecoration(
                color: kWhiteColor,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(text: "Today",fontSize: 13,fontWeight: FontWeight.w400,),
                  SizedBox(width: 10.w,),
                  Image.asset(kCalenderIcon,height: 14,width: 14,),
                ],
              ),
            )
          ],
        ),
        32.toHeight,
        SizedBox(
          height: 280.h,
          child: LineChart(
            LineChartData(
              backgroundColor: Colors.transparent,
              minY: 0,
              maxY: 100,
              titlesData: FlTitlesData(
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 50,
                    interval: 20,
                    getTitlesWidget: (value, meta) => Text(
                      '${value.toInt()}k',
                      style: AppStyles.greyTextStyle().copyWith(fontSize: 12),
                    ),
                  ),
                ),
                rightTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                topTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: (value, meta) {
                      const months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];
                      return Text(
                        months[value.toInt()],
                        style: AppStyles.greyTextStyle().copyWith(fontSize: 12),
                      );
                    },
                  ),
                ),
              ),
              gridData: FlGridData(
                show: true,
                drawVerticalLine: false,
                getDrawingHorizontalLine: (value) => FlLine(
                  color: Colors.grey.withOpacity(0.3),
                  strokeWidth: 1,
                ),
              ),
              borderData: FlBorderData(show: false),

              lineTouchData: LineTouchData(
                handleBuiltInTouches: true,
                touchSpotThreshold: 10,
                touchTooltipData: LineTouchTooltipData(
                  tooltipBgColor: Colors.white,
                  tooltipRoundedRadius: 10,
                  tooltipPadding: const EdgeInsets.all(8),
                  fitInsideHorizontally: true,
                  fitInsideVertically: true,
                  getTooltipItems: (touchedSpots) {
                    return touchedSpots.map((spot) {
                      final isMainLine = spot.bar.color == kPrimaryColor;
                      final isSecondaryLine = spot.bar.color == kGrey1Color;

                      return LineTooltipItem(
                        '\$${(spot.y * 1000).toStringAsFixed(0)}',
                        AppStyles.blackTextStyle().copyWith(fontSize: 22.sp,fontWeight: FontWeight.w700,color: kGrey2Color),
                        children: [
                          TextSpan(
                            text: isMainLine ? '\nCurrent Earning' : '\nPrevious Earning',
                            style: AppStyles.blackTextStyle().copyWith(fontSize: 12.sp,fontWeight: FontWeight.w400),
                          )
                        ],
                      );
                    }).toList();
                  },
                ),
              ),

              lineBarsData: [
                LineChartBarData(
                  spots: controller.mainLineSpots,
                  isCurved: true,
                  barWidth: 3,
                  color: kPrimaryColor,
                  belowBarData: BarAreaData(
                    show: true,
                    gradient: LinearGradient(
                      colors: [
                        kPrimaryColor1.withOpacity(0.05),
                        kPrimaryColor1.withOpacity(0.05)
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  dotData: FlDotData(show: false),
                ),
                LineChartBarData(
                  spots: controller.secondaryLineSpots,
                  isCurved: true,
                  barWidth: 2,
                  color: kGrey1Color,
                  dotData: FlDotData(show: false),
                  belowBarData: BarAreaData(show: false),
                ),
              ],
            ),
          ),
        ),
        32.toHeight,
        Row(
          spacing: 20,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                height: 400.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: kGrey1Color),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(text: "Subscription Plan Distribution", fontSize: 18, fontWeight: FontWeight.w600),
                      20.toHeight,
                      pie.PieChart(
                        dataMap: controller.pieChartData,
                        colorList: controller.pieChartColors,
                        chartRadius: 180.w,
                        chartType: pie.ChartType.disc,
                        legendOptions: const pie.LegendOptions(
                          showLegends: false,
                        ),
                        chartValuesOptions: pie.ChartValuesOptions(
                          showChartValues: true,
                          showChartValuesInPercentage: true,
                          showChartValueBackground: false,
                          decimalPlaces: 0,
                          chartValueStyle: AppStyles.whiteTextStyle().copyWith(fontSize: 14.sp,fontWeight: FontWeight.w600),
                        ),
                      ),
                      Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            spacing: 8,
                            children: [
                              CircleAvatar(radius: 4,backgroundColor: kPrimaryColor,),
                              CustomText(text: "Free", fontSize: 14, fontWeight: FontWeight.w400),
                            ],
                          ),
                          Row(
                            spacing: 8,
                            children: [
                              CircleAvatar(radius: 4,backgroundColor: kPrimaryColor1,),
                              CustomText(text: "Basic", fontSize: 14, fontWeight: FontWeight.w400),
                            ],
                          ),
                          Row(
                            spacing: 8,
                            children: [
                              CircleAvatar(radius: 4,backgroundColor: kPrimaryColor,),
                              CustomText(text: "Pro", fontSize: 14, fontWeight: FontWeight.w400),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                height: 400.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: kGrey1Color),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(text: "New Companies Registered", fontSize: 18, fontWeight: FontWeight.w600),
                      20.toHeight,
                      Expanded(
                        child: Obx(() => BarChart(
                            BarChartData(
                              barGroups: controller.barGroups,
                              titlesData: FlTitlesData(
                                show: true,
                                leftTitles: AxisTitles(
                                  sideTitles: SideTitles(
                                    showTitles: true,
                                    reservedSize: 40,
                                    interval: 10,
                                    getTitlesWidget: (value, meta) {
                                      return Padding(
                                        padding: const EdgeInsets.only(right: 8),
                                        child: Text(
                                          value.toInt().toString(),
                                          style: AppStyles.greyTextStyle().copyWith(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                bottomTitles: AxisTitles(
                                  sideTitles: SideTitles(
                                    showTitles: true,
                                    getTitlesWidget: (value, meta) {
                                      final months = [
                                        "Jan", "Feb", "Mar", "Apr", "May", "Jun",
                                        "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"
                                      ];
                                      if (value.toInt() >= 0 && value.toInt() < months.length) {
                                        return Padding(
                                          padding: const EdgeInsets.only(top: 6),
                                          child: Text(
                                            months[value.toInt()],
                                            style: AppStyles.greyTextStyle().copyWith(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        );
                                      } else {
                                        return const SizedBox.shrink();
                                      }
                                    },
                                  ),
                                ),
                                rightTitles: AxisTitles(
                                  sideTitles: SideTitles(showTitles: false),
                                ),
                                topTitles: AxisTitles(
                                  sideTitles: SideTitles(showTitles: false),
                                ),
                              ),

                              gridData: FlGridData(
                                show: true,
                                drawVerticalLine: false,
                                horizontalInterval: 10,
                                getDrawingHorizontalLine: (value) => FlLine(
                                  color: Colors.grey.withOpacity(0.2),
                                  strokeWidth: 1,
                                ),
                              ),
                              borderData: FlBorderData(show: false),
                            )
                        )),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
