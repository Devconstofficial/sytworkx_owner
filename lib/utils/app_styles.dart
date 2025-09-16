import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app_colors.dart';

class AppStyles {
  static TextStyle blackTextStyle() {
    return TextStyle(
      fontFamily: 'Gilroy',
      fontSize: 14.sp,
      fontWeight: FontWeight.w500,
      color: kGrey2Color,
    );
  }

  static TextStyle primaryTextStyle() {
    return TextStyle(
      fontFamily: 'Gilroy',
      fontSize: 14.sp,
      fontWeight: FontWeight.w500,
      color: kPrimaryColor,
    );
  }

  static TextStyle whiteTextStyle() {
    return TextStyle(
      fontFamily: 'Gilroy',
      fontSize: 14.sp,
      fontWeight: FontWeight.w500,
      color: kWhiteColor,
    );
  }

  static TextStyle greyTextStyle() {
    return TextStyle(
      fontFamily: 'Gilroy',
      fontSize: 14.sp,
      fontWeight: FontWeight.w500,
      color: kGrey2Color,
    );
  }

  static BorderRadius get customBorder16 => BorderRadius.all(
    Radius.circular(16.r),
  );
}
