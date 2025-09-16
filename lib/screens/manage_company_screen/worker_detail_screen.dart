import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sytworkx_superadmin/custom_widgets/custom_button.dart';
import 'package:sytworkx_superadmin/screens/sidemenu/controller/sidemenu_controller.dart';
import 'package:sytworkx_superadmin/utils/app_strings.dart';
import 'package:sytworkx_superadmin/utils/sizedBox_extention.dart';
import '../../custom_widgets/custom_text.dart';
import '../../custom_widgets/pages_layout.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_images.dart';
import 'controller/manage_company_controller.dart';

class WorkerDetailsScreen extends GetView<ManageCompanyController> {
  const WorkerDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      headerTitle: "Worker Details",
      children: [
        32.toHeight,
        Row(
          children: [
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: (){
                  Get.back();
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
                Row(
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
                    20.toWidth,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 12,
                      children: [
                        CustomText(text: "John Walker",fontSize: 14,fontWeight: FontWeight.w600,color: kGrey2Color,),
                        CustomText(text: "John@gmail.com",fontSize: 14,fontWeight: FontWeight.w400,color: kGrey2Color,),
                      ],
                    ),
                    25.toWidth,
                    CustomButton(text: "Pro", onTap: (){},width: 41.w,height: 31.h,fontSize: 14,fontWeight: FontWeight.w400,borderRadius: 8,color: kPrimaryColor1,)

                  ],
                ),
                24.toHeight,
                Row(
                  spacing: 10,
                  children: [
                    CustomText(text: "Company Name:",fontSize: 14,fontWeight: FontWeight.w600,color: kBlackColor,),
                    CustomText(text: "Alpha Treader",fontSize: 14,fontWeight: FontWeight.w400,color: kBlackColor,),
                  ],
                ),
                27.toHeight,
                Row(
                  spacing: 10,
                  children: [
                    CustomText(text: "ABN:",fontSize: 14,fontWeight: FontWeight.w600,color: kBlackColor,),
                    CustomText(text: "41744121 561 5645 64",fontSize: 14,fontWeight: FontWeight.w400,color: kBlackColor,),
                  ],
                ),
                27.toHeight,
                Row(
                  spacing: 24,
                  children: [
                    Row(
                      spacing: 10,
                      children: [
                        CustomText(text: "State:",fontSize: 14,fontWeight: FontWeight.w600,color: kBlackColor,),
                        CustomText(text: "Nothwridge",fontSize: 14,fontWeight: FontWeight.w400,color: kBlackColor,),

                      ],
                    ),
                    Row(
                      spacing: 10,
                      children: [
                        CustomText(text: "City:",fontSize: 14,fontWeight: FontWeight.w600,color: kBlackColor,),
                        CustomText(text: "Almeraa",fontSize: 14,fontWeight: FontWeight.w400,color: kBlackColor,),

                      ],
                    ),
                    Row(
                      spacing: 10,
                      children: [
                        CustomText(text: "Postal Code:",fontSize: 14,fontWeight: FontWeight.w600,color: kBlackColor,),
                        CustomText(text: "123231",fontSize: 14,fontWeight: FontWeight.w400,color: kBlackColor,),
                      ],
                    ),
                  ],
                ),
                27.toHeight,
                Row(
                  spacing: 10,
                  children: [
                    CustomText(text: "Street Address:",fontSize: 14,fontWeight: FontWeight.w600,color: kBlackColor,),
                    CustomText(text: "Street 12, Main Area Block C near Subway",fontSize: 14,fontWeight: FontWeight.w400,color: kBlackColor,),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomButton(text: "De-activate", onTap: (){},width: 119.w,height: 48.h,color: kPrimaryColor1,fontSize: 14,fontWeight: FontWeight.w400,borderColor: kPrimaryColor1,)
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
