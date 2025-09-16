import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/app_colors.dart';
import '../../custom_widgets/custom_header.dart';
import '../../utils/sizedBox_extention.dart';
import '../screens/sidemenu/sidemenu.dart';

class BaseLayout extends StatelessWidget {
  final String headerTitle;
  final List<Widget> children;
  final EdgeInsetsGeometry? padding;

  const BaseLayout({
    super.key,
    required this.headerTitle,
    required this.children,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteShadeColor,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SideMenu(),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: padding ?? const EdgeInsets.all(34),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      customHeader(headerTitle),
                      26.toHeight,
                      ...children,
                    ],
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
