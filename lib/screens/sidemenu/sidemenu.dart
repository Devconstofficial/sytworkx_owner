import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sytworkx_superadmin/utils/sizedBox_extention.dart';
import '../../custom_widgets/custom_text.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_images.dart';
import '../../utils/app_strings.dart';
import 'controller/sidemenu_controller.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  final menuController = Get.put(SideMenuController());

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Drawer(
      backgroundColor: kWhiteColor,
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(0),
        borderSide: BorderSide.none
      ),
      width: 120.w,
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 135.h,
              child: DrawerHeader(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(text: "S",fontWeight: FontWeight.w400,fontSize: 36.sp,),
                    // 20.toHeight,
                    Divider(color: kGrey1Color,thickness: 1,endIndent: 0,indent: 0,),
                  ],
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 6.w),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      25.toHeight,
                      Obx(() {
                        return MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: () {
                              menuController.onItemTapped(0);
                              Get.toNamed(kDashboardScreenRoute);
                            },
                            child: Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: menuController
                                    .selectedIndex
                                    .value ==
                                    0
                                    ? kPrimaryColor
                                    : kWhiteColor,
                              ),
                              child: Center(
                                child: Image.asset(
                                  kDashboardIcon,
                                  height: 24,
                                  width: 24,
                                  color:  menuController
                                      .selectedIndex
                                      .value ==
                                      0
                                      ? kWhiteColor
                                      : kGrey2Color,
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                      40.toHeight,
                      Obx(() {
                        return MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: () {
                              menuController.onItemTapped(1);
                              Get.toNamed(kManageCompanyScreenRoute);
                            },
                            child: Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: menuController
                                    .selectedIndex
                                    .value ==
                                    1
                                    ? kPrimaryColor
                                    : kWhiteColor,
                              ),
                              child: Center(
                                child: Image.asset(
                                  kGroupUsersIcon,
                                  height: 24,
                                  width: 24,
                                  color:  menuController
                                      .selectedIndex
                                      .value ==
                                      1
                                      ? kWhiteColor
                                      : kGrey2Color,
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                      40.toHeight,
                      Obx(() {
                        return MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: () {
                              menuController.onItemTapped(2);
                              Get.toNamed(kSubscriptionScreenRoute);
                            },
                            child: Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: menuController
                                    .selectedIndex
                                    .value ==
                                    2
                                    ? kPrimaryColor
                                    : kWhiteColor,
                              ),
                              child: Center(
                                child: Image.asset(
                                  kCurrencyIcon,
                                  height: 24,
                                  width: 24,
                                  color:  menuController
                                      .selectedIndex
                                      .value ==
                                      2
                                      ? kWhiteColor
                                      : kGrey2Color,
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                    ],
                  ),
                ),
              ),
            ),
            // const Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 120.0),
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () {
                    Get.offAllNamed(kAuthScreenRoute);
                    // Get.dialog(logoutDialog());
                  },
                  child: Image.asset(
                    kLogoutIcon,
                    height: 24,
                    width: 24,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
