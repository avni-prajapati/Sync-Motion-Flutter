import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kine_stop/app/modules/home/controllers/theme_controller.dart';
import 'package:kine_stop/app/utils/utils.dart';

import '../controllers/home_controller.dart';
import '../widgets/dotted_ui.dart';

class OverLayView extends StatelessWidget {
  const OverLayView({super.key});

  @override
  Widget build(BuildContext context) {
    final homeController = Get.find<HomeController>();
    final themeController = Get.find<ThemeController>();
    themeController.getAndSetStoredTheme();
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
