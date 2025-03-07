import 'package:get/get.dart';
import 'package:sync_motion/app/modules/home/controllers/home_controller.dart';
import 'package:sync_motion/app/modules/home/controllers/theme_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ThemeController(), permanent: true);
    Get.put(HomeController(), permanent: true);
  }
}
