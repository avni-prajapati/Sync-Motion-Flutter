import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kine_stop/app/modules/home/controllers/theme_controller.dart';
import 'package:kine_stop/app/modules/home/widgets/rounded_container.dart';
import 'package:kine_stop/app/utils/utils.dart';

class ThemeBottomSheet extends StatelessWidget {
  const ThemeBottomSheet({super.key, required this.onBackTap});

  final VoidCallback onBackTap;

  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();
    return Obx(
      () => Container(
        width: double.infinity,
        padding: EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 40),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), color: Colors.white),
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
            Text(
              'Shape',
              style: TextStyle(fontSize: 20, color: Colors.black87, fontWeight: FontWeight.bold),
            ),
            Row(
              spacing: 16,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _ShapeWidget(
                  shapeWidget: RoundContainer(
                    size: 35,
                    boarderRadius: 30,
                    color:
                        themeController.selectedColor.value?.withAlpha(70) ??
                        themeColorsList[0].withAlpha(70),
                    onTap: () async {
                      await themeController.setSelectedShape(shape: ThemeShape.round);
                    },
                  ),
                  isSelected: themeController.selectedShape.value == ThemeShape.round,
                ),
                _ShapeWidget(
                  shapeWidget: RoundContainer(
                    size: 30,
                    boarderRadius: 0,
                    color:
                        themeController.selectedColor.value?.withAlpha(70) ??
                        themeColorsList[0].withAlpha(70),
                    onTap: () async {
                      await themeController.setSelectedShape(shape: ThemeShape.square);
                    },
                  ),
                  isSelected: themeController.selectedShape.value == ThemeShape.square,
                ),
                _ShapeWidget(
                  shapeWidget: HeartWidget(
                    color:
                        themeController.selectedColor.value?.withAlpha(70) ??
                        themeColorsList[0].withAlpha(70),
                    size: 40,
                    onTap: () async {
                      await themeController.setSelectedShape(shape: ThemeShape.heart);
                    },
                  ),
                  isSelected: themeController.selectedShape.value == ThemeShape.heart,
                ),
              ],
            ),
            Text(
              'Color',
              style: TextStyle(fontSize: 20, color: Colors.black87, fontWeight: FontWeight.bold),
            ),
            Row(
              spacing: 16,
              children: List.generate(5, (index) {
                return RoundContainer(
                  size: 40,
                  boarderRadius: 30,
                  color: themeColorsList[index].withAlpha(70),
                  isSelected: themeController.selectedColor.value == themeColorsList[index],
                  onTap: () async {
                    await themeController.setSelectedColor(color: themeColorsList[index]);
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}

class _ShapeWidget extends StatelessWidget {
  const _ShapeWidget({super.key, required this.shapeWidget, required this.isSelected});

  final Widget shapeWidget;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8,
      children: [
        shapeWidget,
        Container(height: 4, width: 30, color: isSelected ? Colors.black87 : Colors.transparent),
      ],
    );
  }
}
