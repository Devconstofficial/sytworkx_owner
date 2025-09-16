import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sytworkx_superadmin/custom_widgets/custom_button.dart';
import 'package:sytworkx_superadmin/screens/settings/controller/setting_controller.dart';
import 'package:sytworkx_superadmin/screens/sidemenu/controller/sidemenu_controller.dart';
import 'package:sytworkx_superadmin/utils/app_strings.dart';
import 'package:sytworkx_superadmin/utils/sizedBox_extention.dart';
import '../../custom_widgets/custom_text.dart';
import '../../custom_widgets/pages_layout.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_images.dart';

class SettingScreen extends GetView<SettingController> {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      headerTitle: "Profile Settings",
      children: [
        32.toHeight,
        Row(
          children: [
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: (){
                  SideMenuController menuController = Get.put(SideMenuController());
                  menuController.onItemTapped(0);
                  Get.toNamed(kDashboardScreenRoute);
                },
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(
                      color: kGrey1Color,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 6.0),
                    child: Icon(Icons.arrow_back_ios,size: 15,color: kGrey2Color,),
                  ),
                ),
              ),
            ),
            12.toWidth,
            CustomText(text: "Back to dashboard",fontSize: 14,fontWeight: FontWeight.w400,),
          ],
        ),
        32.toHeight,
        Container(
          width: Get.width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              color: kWhiteColor,
              border: Border.all(
                  color: kGrey1Color,
              ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 70,width: 70,
                  decoration: BoxDecoration(
                    color: kWhiteShadeColor,
                    borderRadius: BorderRadius.circular(200)
                  ),
                  child: Image.asset(kPersonImage,fit: BoxFit.contain,),
                ),
                18.toHeight,
                Row(
                  spacing: 10,
                  children: [
                    CustomText(text: "Admin Name:",fontSize: 14,fontWeight: FontWeight.w600,color: kBlackColor,),
                    CustomText(text: "Alpha Treader",fontSize: 14,fontWeight: FontWeight.w400,),
                  ],
                ),
                18.toHeight,
                Row(
                  spacing: 10,
                  children: [
                    CustomText(text: "Email Address:",fontSize: 14,fontWeight: FontWeight.w600,color: kBlackColor,),
                    CustomText(text: "su19@gmail.com",fontSize: 14,fontWeight: FontWeight.w400),
                  ],
                ),
                21.toHeight,
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomButton(text: "Save", onTap: (){},width: 72.w,height: 48.h,)
                  ],
                )
              ],
            ),
          ),
        ),

      ],
    );
  }
}
