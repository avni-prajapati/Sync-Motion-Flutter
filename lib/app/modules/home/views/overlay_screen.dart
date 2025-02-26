import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../controllers/home_controller.dart';
import '../widgets/dotted_ui.dart';

class OverLayView extends StatelessWidget {
  const OverLayView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController(), permanent: true);
    final size = MediaQuery.sizeOf(context);
    return Obx(() {
      return Transform.rotate(angle: controller.angle.value, child: DottedUI());
    });
  }
}
