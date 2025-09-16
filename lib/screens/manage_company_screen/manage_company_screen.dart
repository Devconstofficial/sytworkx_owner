import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sytworkx_superadmin/custom_widgets/custom_button.dart';
import 'package:sytworkx_superadmin/custom_widgets/custom_dialouge.dart';
import 'package:sytworkx_superadmin/custom_widgets/custom_text.dart';
import 'package:sytworkx_superadmin/screens/manage_company_screen/controller/manage_company_controller.dart';
import 'package:sytworkx_superadmin/utils/app_colors.dart';
import 'package:sytworkx_superadmin/utils/app_images.dart';
import 'package:sytworkx_superadmin/utils/app_strings.dart';
import 'package:sytworkx_superadmin/utils/sizedBox_extention.dart';
import '../../custom_widgets/custom_pagination.dart';
import '../../custom_widgets/delete_dialog.dart';
import '../../custom_widgets/pages_layout.dart';
import '../../utils/app_styles.dart';
import '../sidemenu/controller/sidemenu_controller.dart';

class ManageCompanyScreen extends GetView<ManageCompanyController> {
  const ManageCompanyScreen({super.key});

  final double idWidth = 190;
  final double nameWidth = 190;
  final double emailWidth = 230;
  final double dateWidth = 150;
  final double statusWidth = 150;
  final double actionWidth = 60;


  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      headerTitle: "Manage Companies Registered",
      children: [
        32.toHeight,
        Container(
          height: 70.h,
          width: 520.w,
          decoration: BoxDecoration(
            color: kWhiteColor,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: kGrey1Color, width: 0.6),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(kFilterIcon, height: 22, width: 19),
              Container(height: 70.h, width: 1, color: kGrey1Color),
              CustomText(
                text: "Filter By",
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
              Container(height: 70.h, width: 1, color: kGrey1Color),

              Row(
                spacing: 8,
                children: [
                  CustomText(
                    text: "Company Name",
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                  Icon(
                    Icons.keyboard_arrow_down_outlined,
                    size: 16,
                    color: kGrey2Color,
                  ),
                ],
              ),
              Container(height: 70.h, width: 1, color: kGrey1Color),
              Row(
                spacing: 8,
                children: [
                  CustomText(
                    text: "Subscription Type",
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                  Icon(
                    Icons.keyboard_arrow_down_outlined,
                    size: 16,
                    color: kGrey2Color,
                  ),
                ],
              ),
            ],
          ),
        ),
        32.toHeight,
        buildTableHeader(),
        SizedBox(height: 25.h),
        Obx(
          () => ListView.separated(
            itemCount: controller.pagedUsers.length,
            shrinkWrap: true,
            separatorBuilder: (_, __) => SizedBox(height: 8.h),
            itemBuilder: (context, index) {
              final user = controller.pagedUsers[index];

              return Container(
                padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 16.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: kBlackColor.withValues(alpha: 0.07),
                      blurRadius: 44,
                      spreadRadius: 0,
                      offset: Offset(1, 17),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: idWidth.w,
                      child: MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          onTap: () {
                            // SideMenuController controller = Get.put(SideMenuController());
                            // controller.onItemTapped(-1);
                            Get.toNamed(kWorkerDetailsScreenRoute);
                          },
                          child: Row(
                            children: [
                              Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(200),
                                  child: Image.asset(
                                    kPersonImage,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              8.toWidth,
                              Text(
                                "${user['name']}",
                                style: AppStyles.greyTextStyle().copyWith(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: nameWidth.w,
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              user['id'],
                              overflow: TextOverflow.ellipsis,
                              style: AppStyles.greyTextStyle().copyWith(
                                fontWeight: FontWeight.w400,
                                fontSize: 14.sp,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: emailWidth.w,
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              user['email'],
                              overflow: TextOverflow.ellipsis,
                              style: AppStyles.greyTextStyle().copyWith(
                                fontWeight: FontWeight.w400,
                                fontSize: 14.sp,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: dateWidth.w,
                      child: Row(
                        children: [
                          Text(
                            user['abnId'],
                            overflow: TextOverflow.ellipsis,
                            style: AppStyles.greyTextStyle().copyWith(
                              fontWeight: FontWeight.w400,
                              fontSize: 14.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: statusWidth.w,
                      child: Row(
                        children: [
                          Text(
                            user['subType'],
                            overflow: TextOverflow.ellipsis,
                            style: AppStyles.greyTextStyle().copyWith(
                              fontWeight: FontWeight.w400,
                              fontSize: 14.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: actionWidth.w,
                      child: MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          onTap: () {
                            Get.dialog(deleteDialog());
                          },
                          child: Center(
                            child: Icon(
                              Icons.more_horiz_outlined,
                              color: kPrimaryColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        SizedBox(height: 46.h),
        Obx(
          () => CustomPagination(
            currentPage: controller.currentPage2.value,
            visiblePages: controller.visiblePageNumbers,
            onPrevious: controller.goToPreviousPage,
            onNext: controller.goToNextPage,
            onPageSelected: controller.goToPage,
          ),
        ),
      ],
    );
  }

  Widget buildTableHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            width: idWidth.w,
            child: Row(
              children: [
                Text(
                  "Name",
                  style: AppStyles.greyTextStyle().copyWith(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: nameWidth.w,
            child: Row(
              spacing: 13.w,
              children: [
                Text(
                  "Company ID",
                  style: AppStyles.greyTextStyle().copyWith(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: emailWidth.w,
            child: Row(
              spacing: 13.w,
              children: [
                Text(
                  "Email",
                  style: AppStyles.greyTextStyle().copyWith(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: dateWidth.w,
            child: Row(
              spacing: 13.w,
              children: [
                Text(
                  "ABN ID",
                  style: AppStyles.greyTextStyle().copyWith(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: statusWidth.w,
            child: Row(
              children: [
                Text(
                  "Subscription Type",
                  style: AppStyles.greyTextStyle().copyWith(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: actionWidth.w, child: Container()),
        ],
      ),
    );
  }
}
