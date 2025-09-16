import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../utils/app_colors.dart';
import '../utils/app_styles.dart';

class CustomDropdown2 extends StatelessWidget {
  final RxString selected;
  final List<String> items;
  final String hint;
  final double height;

  const CustomDropdown2({
    super.key,
    required this.selected,
    required this.items,
    required this.hint,
    this.height = 55,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height.h,
      child: Obx(() {
        final value = selected.value.isEmpty ? null : selected.value;
        return DropdownButtonFormField2<String>(
          value: value,
          isExpanded: true,
          dropdownStyleData: DropdownStyleData(
            maxHeight: 230,
            decoration: BoxDecoration(
              color: kWhiteColor,
              borderRadius: BorderRadius.circular(8.r),
            ),
          ),
          hint: Text(
            hint,
            style: AppStyles.blackTextStyle().copyWith(fontWeight: FontWeight.w400, fontSize: 14.sp,color: kBlackShade1Color),
          ),
          style: AppStyles.blackTextStyle().copyWith(fontSize: 14.sp,fontWeight: FontWeight.w400,color: kBlackShade1Color),

          decoration: InputDecoration(
            isDense: true,
            filled: true,
            fillColor: kWhiteColor,
            contentPadding:EdgeInsets.only(top: 18.h,bottom: 18.h,right: 20.w),
            hintStyle: AppStyles.blackTextStyle().copyWith(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: kBlackShade1Color,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(
                color:kGrey1Color,
                width: 1.5,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(
                color: kGrey1Color,
                width: 1.5,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(
                color: kPrimaryColor,
                width: 1.5,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: const BorderSide(
                color: kPrimaryColor,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(
                color: kGrey1Color,
              ),
            ),
          ),

          items: items
              .map((e) => DropdownMenuItem<String>(
            value: e,
            child: Text(e, style: AppStyles.blackTextStyle().copyWith(fontWeight: FontWeight.w400, fontSize: 14)),
          ))
              .toList(),
          onChanged: (v) => selected.value = v ?? '',
        );
      }),
    );
  }
}
