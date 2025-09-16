import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../screens/auth/controller/auth_controller.dart';
import '../utils/app_colors.dart';
import '../utils/app_images.dart';

class AuthComponent extends StatelessWidget {
  Widget content;
  AuthComponent({super.key,required this.content});

  AuthController controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: kWhiteShadeColor,
      body: SizedBox(
        height: Get.height,
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 35.h),
                child: SizedBox(
                  height: height,
                  width: width,
                  child: Center(
                    child: SizedBox(
                      width: 388.w,
                      child: content,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: SizedBox(
                  height: Get.height,
                  child: Padding(
                    padding: const EdgeInsets.all(32),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(24),
                        child: Image.asset(kAuthImage1,fit: BoxFit.cover,)),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
