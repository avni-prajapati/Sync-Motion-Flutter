import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import '../widgets/dotted_ui.dart';

class OverLayView extends StatelessWidget {
  const OverLayView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController(), permanent: true);
    return Obx(() {
      return Transform.rotate(angle: controller.angle.value, child: DottedUI());
    });
  }
}
