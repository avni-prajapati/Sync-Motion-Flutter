import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sync_motion/app/modules/home/controllers/home_controller.dart';
import 'package:sync_motion/app/modules/home/controllers/theme_controller.dart';
import 'package:sync_motion/app/modules/home/widgets/dotted_ui.dart';
import 'package:sync_motion/app/modules/home/widgets/error_widget.dart';
import 'package:sync_motion/app/modules/home/widgets/menu_button.dart';
import 'package:sync_motion/app/modules/home/widgets/bottom_sheet.dart';
import 'package:sync_motion/app/modules/home/widgets/theme_button.dart';
import 'package:sync_motion/app/utils/utils.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final homeController = Get.find<HomeController>();
    final themeController = Get.find<ThemeController>();
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: const Text('SyncMotion', style: TextStyle(fontSize: 25)),
          centerTitle: true,
          actions: [MenuButton()],
        ),
        body: Center(
          child:
              homeController.hasError.value == true
                  ? CustomErrorWidget()
                  : Stack(
                    alignment: Alignment.center,
                    children: [
                      !homeController.shouldShowOverlay.value
                          ? Positioned.fill(
                            child: Transform.rotate(
                              angle:
                                  homeController.shouldPlay.value ? homeController.angle.value : 0,
                              filterQuality: FilterQuality.high,
                              child: DottedUI(
                                color: themeController.selectedColor.value ?? themeColorsList[0],
                                themeShape: themeController.selectedShape.value ?? ThemeShape.round,
                              ),
                            ),
                          )
                          : SizedBox.shrink(),
                      Align(
                        alignment: Alignment.topCenter,
                        child: Column(
                          children: [
                            SizedBox(height: 150, width: 150, child: Image.asset('assets/car.png')),
                            homeController.shouldShowOverlay.value &&
                                    homeController.isOverlayPermissionGranted.value == true
                                ? SizedBox.shrink()
                                : ThemeButton(
                                  onThemeTap: () {
                                    Get.bottomSheet(
                                      ThemeBottomSheet(
                                        onBackTap: () {
                                          // Navigator.maybePop(context);
                                        },
                                      ),
                                    );
                                  },
                                ),
                            homeController.shouldShowOverlay.value &&
                                    homeController.isOverlayPermissionGranted.value == true
                                ? _OverlayText()
                                : SizedBox.shrink(),
                          ],
                        ),
                      ),
                    ],
                  ),
        ),
        floatingActionButton:
            homeController.shouldShowOverlay.value
                ? SizedBox.shrink()
                : FloatingActionButton(
                  onPressed: () {
                    homeController.alterPlayPauseValue();
                  },
                  backgroundColor: Colors.black38,
                  elevation: 0,
                  child: Icon(
                    homeController.shouldPlay.value ? Icons.pause : Icons.play_arrow,
                    color: Colors.white,
                  ),
                ),
      ),
    );
  }
}

class _OverlayText extends StatelessWidget {
  const _OverlayText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      child: Column(
        children: [
          Text(
            'Relax & use your phone freely!',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
            'Motion sync is now active',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
