import 'package:get/get.dart';
import 'package:kine_stop/app/modules/home/controllers/theme_controller.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<HomeController>(HomeController());
    Get.put<ThemeController>(ThemeController());
  }
}
