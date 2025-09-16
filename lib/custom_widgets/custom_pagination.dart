import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_colors.dart';
import '../utils/app_styles.dart';

class CustomPagination extends StatelessWidget {
  final int currentPage;
  final List<int> visiblePages;
  final VoidCallback onPrevious;
  final VoidCallback onNext;
  final Function(int) onPageSelected;

  const CustomPagination({
    super.key,
    required this.currentPage,
    required this.visiblePages,
    required this.onPrevious,
    required this.onNext,
    required this.onPageSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: onPrevious,
          child: Container(
            height: 36,
            width: 77,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              border: Border.all(color: kGrey1Color),
            ),
            child: Row(
              spacing: 4,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.arrow_back_ios, size: 15,color: kBlackShade1Color,),
                Text("Back", style: AppStyles.blackTextStyle().copyWith(fontSize: 12)),
              ],
            ),
          ),
        ),
        const SizedBox(width: 8),
        ...visiblePages.map((page) {
          final isSelected = currentPage == page;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: GestureDetector(
              onTap: () => onPageSelected(page),
              child: Container(
                height: 36,
                width: 36,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: isSelected ? kPrimaryColor : kWhiteColor,
                  border: Border.all(
                    color: isSelected ? kPrimaryColor : kGrey1Color,
                  ),
                ),
                child: Center(
                  child: Text(
                    page.toString(),
                    style: AppStyles.blackTextStyle().copyWith(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color:isSelected ? kWhiteColor : kBlackShade1Color,
                    ),
                  ),
                ),
              ),
            ),
          );
        }),

        const SizedBox(width: 18),

        GestureDetector(
          onTap: onNext,
          child: Container(
            height: 36,
            width: 85,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              border: Border.all(color: kGrey1Color),
            ),
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Row(
              spacing: 4,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Next", style: AppStyles.blackTextStyle().copyWith(fontSize: 12)),
                Icon(Icons.arrow_forward_ios_outlined, size: 15,color: kBlackShade1Color,),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
