import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sytworkx_superadmin/utils/sizedBox_extention.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_images.dart';
import '../../../utils/app_styles.dart';
import '../../custom_widgets/auth_component.dart';
import '../../custom_widgets/custom_button.dart';
import '../../custom_widgets/custom_text.dart';
import '../../custom_widgets/custom_textfield.dart';
import '../../utils/app_strings.dart';
import 'controller/auth_controller.dart';

class AuthScreen extends GetView<AuthController> {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: AuthComponent(
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomText(text: "Welcome Back  👋",fontWeight: FontWeight.w400,fontSize: 32.sp,),
            28.toHeight,
            CustomText(text: "Sign in to start managing your sites.",fontWeight: FontWeight.w400,fontSize: 18.sp,),
            48.toHeight,
            CustomText(text: "Email",fontSize: 15.sp,fontWeight: FontWeight.w400,),
            8.toHeight,
            CustomTextField(
              fieldController: controller.emailController,
              hintText: "Example@email.com",
            ),
            24.toHeight,
            CustomText(text: "Password",fontSize: 15.sp,fontWeight: FontWeight.w400,),
            8.toHeight,
            CustomTextField(
              fieldController: controller.loginPassController,
              hintText: "at least 8 characters",
            ),
            24.toHeight,
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: (){
                      // Get.toNamed(kSendOtpScreenRoute);
                    },
                    child: CustomText(text: "Forgot Password?",fontWeight: FontWeight.w400,fontSize: 15.sp,color: kPrimaryColor,),
                  ),
                ),
              ],
            ),
            24.toHeight,
            CustomButton(
              text: "Sign in",
              onTap: () {
                Get.toNamed(kDashboardScreenRoute);
              },
            ),
            48.toHeight,
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 1,
                    color: kGrey1Color,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: CustomText(text: "Or",fontSize: 16.sp,fontWeight: FontWeight.w400,),
                ),
                Expanded(
                  child: Container(
                    height: 1,
                    color: kGrey1Color,
                  ),
                ),
              ],
            ),
            34.toHeight,
            CustomButton(
              text: "Sign in with Google",
              isImage: true,
              image: kGoogleIcon,
              color: kWhiteColor,
              borderColor: kGrey1Color,
              textColor: kGrey2Color,
              fontSize: 16,
              fontWeight: FontWeight.w400,
              onTap: () {
                // Get.toNamed(kDashboardScreenRoute);
              },

            ),
            16.toHeight,
            CustomButton(
              text: "Sign in with Facebook",
              isImage: true,
              image: kFacebookIcon,
              color: kWhiteColor,
              borderColor: kGrey1Color,
              textColor: kGrey2Color,
              fontSize: 16,
              fontWeight: FontWeight.w400,
              onTap: () {
                // Get.toNamed(kDashboardScreenRoute);
              },

            ),
          ],
        ),
      ),
    );
  }
}
