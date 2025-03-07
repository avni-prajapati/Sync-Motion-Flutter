import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sync_motion/app/utils/utils.dart';

class ThemeController extends GetxController {
  final selectedColor = Rxn<Color>();
  final selectedShape = Rxn<ThemeShape>();
  final box = GetStorage('ThemeData');

  @override
  void onInit() {
    super.onInit();
    getAndSetStoredTheme();
  }

  Future<void> getAndSetStoredTheme() async {
    final themeData = box.read('theme');
    if (themeData != null) {
      selectedColor.value = ThemeClass.getColorFromName(themeData['color']) ?? themeColorsList[0];
      selectedShape.value = ThemeClass.getShapeFromName(themeData?['shape']) ?? ThemeShape.round;
    }
  }

  Future<void> setSelectedColor({required Color color}) async {
    selectedColor.value = color;
    await box.write('theme', {
      'color': ThemeClass.getColorName(selectedColor.value ?? themeColorsList[0]),
      'shape': ThemeClass.getShapeName(selectedShape.value ?? ThemeShape.round),
    });
  }

  Future<void> setSelectedShape({required ThemeShape shape}) async {
    selectedShape.value = shape;
    await box.write('theme', {
      'color': ThemeClass.getColorName(selectedColor.value ?? themeColorsList[0]),
      'shape': ThemeClass.getShapeName(selectedShape.value ?? ThemeShape.round),
    });
  }
}
