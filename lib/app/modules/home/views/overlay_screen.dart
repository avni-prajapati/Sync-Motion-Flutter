import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sync_motion/app/modules/home/controllers/theme_controller.dart';
import 'package:sync_motion/app/utils/utils.dart';

import '../controllers/home_controller.dart';
import '../widgets/dotted_ui.dart';

class OverLayView extends StatefulWidget {
  const OverLayView({super.key});

  @override
  State<OverLayView> createState() => _OverLayViewState();
}

class _OverLayViewState extends State<OverLayView> {
  @override
  Widget build(BuildContext context) {
    final homeController = Get.find<HomeController>();
    final themeController = Get.find<ThemeController>();
    setState(() {});
    return Obx(() {
      return Transform.rotate(
        angle: homeController.angle.value,
        child: DottedUI(
          color: themeController.selectedColor.value ?? themeColorsList[0],
          themeShape: themeController.selectedShape.value ?? ThemeShape.round,
        ),
      );
    });
  }
}
