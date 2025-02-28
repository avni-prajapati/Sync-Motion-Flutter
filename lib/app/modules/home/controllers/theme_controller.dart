import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:kine_stop/app/utils/utils.dart';

class ThemeController extends GetxController {
  final selectedColor = Rx<Color>(themeColorsList[0]);
  final selectedShape = Rx<ThemeShape>(ThemeShape.round);

  void setSelectedColor({required Color color}) {
    selectedColor.value = color;
  }

  void setSelectedShape({required ThemeShape shape}) {
    selectedShape.value = shape;
  }
}
