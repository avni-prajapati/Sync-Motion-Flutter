import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sync_motion/app/modules/home/bindings/home_binding.dart';
import 'package:sync_motion/app/modules/home/controllers/home_controller.dart';
import 'package:sync_motion/app/modules/home/views/overlay_screen.dart';
import 'app/modules/home/controllers/theme_controller.dart';
import 'app/routes/app_pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init('ThemeData');
  Get.put(HomeController());
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      initialBinding: HomeBinding(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

// overlay entry point
@pragma("vm:entry-point")
Future<void> overlayMain() async {
  await GetStorage.init('ThemeData');

  // Create and initialize controllers
  final homeController = HomeController();
  Get.put(homeController);

  // Create the ThemeController and wait for it to load theme data
  final themeController = ThemeController();
  await themeController.getAndSetStoredTheme();
  Get.put(themeController);

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: OverLayView(),
      initialBinding: HomeBinding(),
    ),
  );
}
