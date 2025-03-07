import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sync_motion/app/modules/home/bindings/home_binding.dart';
import 'package:sync_motion/app/modules/home/views/overlay_screen.dart';
import 'app/routes/app_pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init('ThemeData');
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
void overlayMain() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: OverLayView(),
      initialBinding: HomeBinding(),
    ),
  );
}
