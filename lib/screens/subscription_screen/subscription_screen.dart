import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sytworkx_superadmin/custom_widgets/custom_button.dart';
import 'package:sytworkx_superadmin/custom_widgets/custom_dialouge.dart';
import 'package:sytworkx_superadmin/custom_widgets/custom_dropdown.dart';
import 'package:sytworkx_superadmin/custom_widgets/custom_text.dart';
import 'package:sytworkx_superadmin/custom_widgets/custom_textfield.dart';
import 'package:sytworkx_superadmin/screens/subscription_screen/controller/subscription_controller.dart';
import 'package:sytworkx_superadmin/utils/app_colors.dart';
import 'package:sytworkx_superadmin/utils/app_images.dart';
import 'package:sytworkx_superadmin/utils/app_strings.dart';
import 'package:sytworkx_superadmin/utils/sizedBox_extention.dart';
import '../../custom_widgets/custom_pagination.dart';
import '../../custom_widgets/delete_dialog.dart';
import '../../custom_widgets/pages_layout.dart';
import '../../utils/app_styles.dart';

class SubscriptionScreen extends GetView<SubscriptionController> {
  SubscriptionScreen({super.key});

  final double idWidth = 200;

  updateSubDialog(){
    return CustomDialog(
      width: 639.w,
        widget: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w,vertical: 27.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(text: "Update Subscription",fontSize: 24,fontWeight: FontWeight.w400,),
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        height: 38.h,
                          width: 38.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: kWhiteColor,
                            boxShadow: [
                              BoxShadow(
                                color: kGrey3Color.withValues(alpha: 0.11),
                                offset: Offset(0, 2),
                                blurRadius: 13
                              )
                            ]
                          ),
                          child: Center(child: Icon(Icons.close,size: 12,color: kGrey2Color,))),
                    ),
                  )
                ],
              ),
              24.toHeight,
              CustomText(text: "Package",fontSize: 14,fontWeight: FontWeight.w600,),
              CustomDropdown2(
                selected: controller.selectedPackage,
                items: ["Basic", "Pro"],
                hint: "Select package",
              ),
              // CustomTextField(fieldController: controller.packageController, hintText: "Select package",radius: 8,),
              17.toHeight,
              CustomText(text: "Update Package Name",fontSize: 14,fontWeight: FontWeight.w600,),
              CustomTextField(fieldController: controller.updatePackageController, hintText: "Change name here",radius: 8,padding: EdgeInsets.all(16),hintColor: kGrey2Color,),
              17.toHeight,
              Row(
                children: [
                  CustomText(text: "Set Package Fee",fontSize: 14,fontWeight: FontWeight.w600,),
                  17.toWidth,
                  CustomText(text: "USD (\$)",fontSize: 14,fontWeight: FontWeight.w600,),
                  17.toWidth,
                  Expanded(child: CustomTextField(fieldController: controller.priceController, hintText: "00.00",radius: 8,padding: EdgeInsets.all(16),hintColor: kGrey2Color,)),
                ],
              ),
              17.toHeight,
              CustomText(text: "Package Description",fontSize: 14,fontWeight: FontWeight.w600,),
              CustomTextField(fieldController: controller.descController,
                hintText: "For small subcontractors just getting started.\n"
                    "1 Active User\n"
                    "Track daily attendance\n"
                    "Manage daily dockets\n"
                    "Basic job site insights",
                radius: 8,padding: EdgeInsets.all(16),maxLines: 5,hintColor: kGrey2Color,),
              24.toHeight,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomButton(text: "Cancel", onTap: (){
                    Get.back();
                  },width: 75,height: 40,fontSize: 14,fontWeight: FontWeight.w400,color: kWhiteColor,borderColor: kGrey1Color,textColor: kGrey2Color,),
                  CustomButton(text: "Update Subscription", onTap: (){
                    Get.back();
                  },width: 162,height: 40,fontSize: 14,fontWeight: FontWeight.w400,),
                ],
              )
            ],
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      headerTitle: "Billing & Subscriptions ",
      children: [
        32.toHeight,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 70.h,
              width: 520.w,
              decoration: BoxDecoration(
                  color: kWhiteColor,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      color: kGrey1Color,
                      width: 0.6
                  )
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(kFilterIcon,height: 22,width: 19,),
                  Container(
                    height: 70.h,
                    width: 1,
                    color: kGrey1Color,
                  ),
                  CustomText(text: "Filter By",fontSize: 14,fontWeight: FontWeight.w400,),
                  Container(
                    height: 70.h,
                    width: 1,
                    color: kGrey1Color,
                  ),
                  Row(
                    spacing: 8,
                    children: [
                      CustomText(text: "Company Name",fontSize: 14,fontWeight: FontWeight.w400,),
                      Icon(Icons.keyboard_arrow_down_outlined,size: 16,color: kGrey2Color,)
                    ],
                  ),
                  Container(
                    height: 70.h,
                    width: 1,
                    color: kGrey1Color,
                  ),
                  Row(
                    spacing: 8,
                    children: [
                      CustomText(text: "Subscription Type",fontSize: 14,fontWeight: FontWeight.w400,),
                      Icon(Icons.keyboard_arrow_down_outlined,size: 16,color: kGrey2Color,)
                    ],
                  ),
                ],
              ),
            ),
            CustomButton(text: "Update Subscription Pricing", onTap: (){
              Get.dialog(updateSubDialog());

            },width: 220.w,height: 40.h,color: kPrimaryColor1,fontSize: 14.sp,fontWeight: FontWeight.w400,borderColor: kPrimaryColor1,)
          ],
        ),
        32.toHeight,
        buildTableHeader(),
        SizedBox(height: 25.h),
        Obx(() => ListView.separated(
          itemCount: controller.pagedUsers.length,
          shrinkWrap: true,
          separatorBuilder: (_, __) => SizedBox(height: 8.h),
          itemBuilder: (context, index) {
            final user = controller.pagedUsers[index];

            return Container(
              padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: idWidth.w,
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            user['id'],
                            overflow: TextOverflow.ellipsis,
                            style: AppStyles.greyTextStyle().copyWith(fontWeight: FontWeight.w400,fontSize: 14.sp),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: idWidth.w,
                    child: MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: (){
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
                                  child: Image.asset(kPersonImage,fit: BoxFit.cover,)),
                            ),
                            8.toWidth,
                            Text(
                              "${user['name']}",
                              style: AppStyles.greyTextStyle().copyWith(fontWeight: FontWeight.w400,fontSize: 14.sp),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: idWidth.w,
                    child: Text(
                      user['subType'],
                      overflow: TextOverflow.ellipsis,
                      style: AppStyles.greyTextStyle().copyWith(fontWeight: FontWeight.w400,fontSize: 14.sp),
                    ),
                  ),
                  SizedBox(
                    width: idWidth.w,
                    child: Row(
                      children: [
                        Text(
                          user['date'],
                          overflow: TextOverflow.ellipsis,
                          style: AppStyles.greyTextStyle().copyWith(fontWeight: FontWeight.w400,fontSize: 14.sp),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: idWidth.w,
                    child: MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                            onTap: (){
                              Get.dialog(deleteDialog());
                            },
                            child: Center(child: Icon(Icons.more_horiz_outlined, color: kPrimaryColor)))),
                  ),
                ],
              ),
            );
          },
        )),
        SizedBox(height: 46.h,),
        Obx(() => CustomPagination(
          currentPage: controller.currentPage2.value,
          visiblePages: controller.visiblePageNumbers,
          onPrevious: controller.goToPreviousPage,
          onNext: controller.goToNextPage,
          onPageSelected: controller.goToPage,
        )),
      ],
    );
  }

  Widget buildTableHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: idWidth.w,
            child: Row(
              children: [
                Text("Company ID", style: AppStyles.greyTextStyle().copyWith(fontSize: 12.sp,fontWeight: FontWeight.w400)),
              ],
            ),
          ),
          SizedBox(
            width: idWidth.w,
            child: Row(
              children: [
                Text("Name", style: AppStyles.greyTextStyle().copyWith(fontSize: 12.sp,fontWeight: FontWeight.w400)),
              ],
            ),
          ),
          SizedBox(
            width: idWidth.w,
            child: Row(
              spacing: 13.w,
              children: [
                Text("Subscription Type", style: AppStyles.greyTextStyle().copyWith(fontSize: 12.sp,fontWeight: FontWeight.w400)),
              ],
            ),
          ),
          SizedBox(
            width: idWidth.w,
            child: Row(
              spacing: 13.w,
              children: [
                Text("Renewal Date", style: AppStyles.greyTextStyle().copyWith(fontSize: 12.sp,fontWeight: FontWeight.w400)),
              ],
            ),
          ),
          SizedBox(
            width: idWidth.w,
            child: Container(),
          ),
        ],
      ),
    );
  }

}
