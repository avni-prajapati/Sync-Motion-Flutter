import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kine_stop/app/modules/home/controllers/theme_controller.dart';
import 'package:kine_stop/app/modules/home/widgets/rounded_container.dart';
import 'package:kine_stop/app/utils/utils.dart';

class ThemeBottomSheet extends StatelessWidget {
  ThemeBottomSheet({super.key, required this.onBackTap});

  final VoidCallback onBackTap;
  final themeController = Get.find<ThemeController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 32),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
      ),
      child: Column(
        spacing: 16,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: onBackTap,
                child: Container(height: 4, width: 60, color: Colors.grey),
              ),
            ],
          ),
          Text('Shape', style: TextStyle(fontSize: 20, color: Colors.black87)),
          Row(
            spacing: 16,
            children: [
              RoundContainer(
                size: 35,
                boarderRadius: 30,
                color: Colors.deepPurple.withAlpha(70),
              ),
              RoundContainer(
                size: 30,
                boarderRadius: 0,
                color: Colors.deepPurple.withAlpha(70),
              ),
              HeartWidget(color: Colors.deepPurple.withAlpha(70), size: 40),
            ],
          ),
          Text('Color', style: TextStyle(fontSize: 20, color: Colors.black87)),
          Row(
            spacing: 16,
            children: List.generate(5, (index) {
              return GestureDetector(
                onTap: () {
                  themeController.setSelectedColor();
                },
                child: RoundContainer(
                  size: 40,
                  boarderRadius: 30,
                  color: themeColorsList[index],
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
