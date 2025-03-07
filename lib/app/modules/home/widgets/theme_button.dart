import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sync_motion/app/modules/home/controllers/theme_controller.dart';
import 'package:sync_motion/app/utils/utils.dart';

class ThemeButton extends StatelessWidget {
  const ThemeButton({super.key, required this.onThemeTap});

  final VoidCallback onThemeTap;

  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();
    return GestureDetector(
      onTap: onThemeTap,
      child: Container(
        margin: EdgeInsets.all(8),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color:
              themeController.selectedColor.value?.withAlpha(70) ??
              themeColorsList[0].withAlpha(70),
        ),
        child: Text('Theme', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      ),
    );
  }
}
