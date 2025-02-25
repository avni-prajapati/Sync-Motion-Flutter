import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:kine_stop/app/modules/home/views/overlay_screen.dart';

import 'app/routes/app_pages.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    GetMaterialApp(title: "Application", initialRoute: AppPages.INITIAL, getPages: AppPages.routes),
  );
}

// // overlay entry point
// @pragma("vm:entry-point")
// void overlayMain() {
//   runApp(const MaterialApp(debugShowCheckedModeBanner: false, home: OverLayScreen()));
// }
