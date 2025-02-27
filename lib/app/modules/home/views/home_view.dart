import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kine_stop/app/modules/home/controllers/home_controller.dart';
import 'package:kine_stop/app/modules/home/widgets/dotted_ui.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: const Text('MEOW', style: TextStyle(fontSize: 25)),
          centerTitle: true,
          actions: [MenuButton(homeController: controller)],
        ),
        body: Center(
          child:
              controller.hasError.value == true
                  ? Text('MEOOOWWWW', style: TextStyle(fontSize: 20))
                  : Stack(
                    alignment: Alignment.center,
                    children: [
                      !controller.isOverlayOn.value
                          ? Positioned.fill(
                            child: Transform.rotate(
                              angle: controller.shouldPlay.value ? controller.angle.value : 0,
                              filterQuality: FilterQuality.high,
                              child: DottedUI(),
                            ),
                          )
                          : SizedBox.shrink(),
                      Align(
                        alignment: Alignment.topCenter,
                        child: SizedBox(
                          height: 150,
                          width: 150,
                          child: Image.asset('assets/car.png'),
                        ),
                      ),
                    ],
                  ),
        ),
        floatingActionButton:
            controller.isOverlayOn.value
                ? SizedBox.shrink()
                : FloatingActionButton(
                  onPressed: () {
                    controller.alterPlayPauseValue();
                  },
                  backgroundColor: Colors.black38,
                  elevation: 0,
                  child: Icon(
                    controller.shouldPlay.value ? Icons.pause : Icons.play_arrow,
                    color: Colors.white,
                  ),
                ),
      ),
    );
  }
}

class MenuButton extends StatelessWidget {
  const MenuButton({super.key, required this.homeController});

  final HomeController homeController;

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
