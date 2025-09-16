import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sytworkx_superadmin/screens/sidemenu/controller/sidemenu_controller.dart';
import 'package:sytworkx_superadmin/utils/app_colors.dart';
import 'package:sytworkx_superadmin/utils/app_strings.dart';
import 'package:sytworkx_superadmin/utils/sizedBox_extention.dart';

import '../utils/app_images.dart';
import '../utils/app_styles.dart';

 Widget customHeader(String title){
  return Row(
    children: [
      Text(
        title,
        style: AppStyles.blackTextStyle()
            .copyWith(
          fontSize: 36.sp,
          fontWeight: FontWeight.w400,
        ),
      ),
      Spacer(),
      Row(
        children: [
          Container(
            height: 32,
            width: 32,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: kWhiteColor,
              border: Border.all(
                color: kGrey1Color,
                width: 0.6
              ),
              boxShadow: [
                BoxShadow(
                  color: kBlackColor.withOpacity(0.02),
                  offset: Offset(0, 0.62),
                  blurRadius: 30,
                  spreadRadius: 0
                )
              ]
            ),
            child: Center(
              child: Image.asset(
                kNotiIcon,
                height: 14,
                width: 14,
              ),
            ),
          ),
          12.toWidth,
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: (){
                SideMenuController controller = Get.put(SideMenuController());
                controller.onItemTapped(-1);
                Get.toNamed(kSettingScreenRoute);
              },
              child: Container(
                height: 32,
                width: 32,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: kPrimaryColor.withOpacity(0.1),
                  border: Border.all(
                    color: kPrimaryColor
                  )
                ),
                child: Center(
                  child: Text(
                    "MH",
                    style: AppStyles.blackTextStyle()
                        .copyWith(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ],
  );
}