import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kine_stop/app/modules/home/controllers/home_controller.dart';
import 'package:kine_stop/app/modules/home/controllers/theme_controller.dart';

class MenuButton extends StatelessWidget {
  const MenuButton({super.key});

  @override
  Widget build(BuildContext context) {
    final homeController = Get.find<HomeController>();
    final themeController = Get.find<ThemeController>();
    return PopupMenuButton(
      itemBuilder: (context) {
        return [
          PopupMenuItem(
            value: '1',
            child: Text(
              !homeController.isOverlayOn.value
                  ? 'Start overlay'
                  : 'Stop overlay',
            ),
          ),
        ];
      },
      onSelected: (value) {
        themeController.getAndSetStoredTheme();
        homeController.handleOverlay();
      },
    );
  }
}
