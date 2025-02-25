import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import '../widgets/dotted_ui.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: const Text('MEOW', style: TextStyle(fontSize: 25)),
          centerTitle: true,
        ),
        body: Center(
          child:
              controller.hasError.value == true
                  ? Text('MEOOOWWWW', style: TextStyle(fontSize: 20))
                  : Stack(
                    alignment: Alignment.center,
                    children: [
                      Positioned.fill(
                        child: Transform.rotate(
                          angle: controller.steeringAngle.value,
                          child: DottedUI(),
                        ),
                      ),
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
      ),
    );
  }
}
