import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kine_stop/app/modules/home/controllers/home_controller.dart';

class MenuButton extends StatelessWidget {
  MenuButton({super.key});

  final homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: (context) {
        return [
          PopupMenuItem(
            value: '1',
            child: Text(!homeController.isOverlayOn.value ? 'Start overlay' : 'Stop overlay'),
          ),
        ];
      },
      onSelected: (value) {
        homeController.handleOverlay();
      },
    );
  }
}
