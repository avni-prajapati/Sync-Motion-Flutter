import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kine_stop/app/modules/home/views/overlay_screen.dart';
import 'app/routes/app_pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
    ),
  );
}

// overlay entry point
@pragma("vm:entry-point")
void overlayMain() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: OverLayView()));
}
