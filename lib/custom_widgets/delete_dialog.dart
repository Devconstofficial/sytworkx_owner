import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sytworkx_superadmin/utils/sizedBox_extention.dart';
import '../utils/app_colors.dart';
import '../utils/app_images.dart';
import 'custom_button.dart';
import 'custom_dialouge.dart';
import 'custom_text.dart';

Widget deleteDialog() {
  return CustomDialog(
    isWithCross: true,
    widget: Column(
      children: [
        Image.asset(kDeleteIcon, height: 96, width: 96),
        16.toHeight,
        CustomText(
          text: "Delete Entry?",
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
        12.toHeight,
        CustomText(
          text:
          "Are you sure you want to delete this item? This action is irreversible and will permanently remove the selected record from the system.",
          fontSize: 14,
          fontWeight: FontWeight.w400,
          textAlign: TextAlign.center,
        ),
        32.toHeight,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomButton(
              text: "Cancel",
              onTap: () {
                Get.back();
              },
              width: 75,
              height: 40,
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: kWhiteColor,
              borderColor: kGrey1Color,
              textColor: kGrey2Color,
            ),
            CustomButton(
              text: "Delete Entry",
              onTap: () {
                Get.back();
              },
              width: 108,
              height: 40,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ],
        ),
      ],
    ),
  );
}
