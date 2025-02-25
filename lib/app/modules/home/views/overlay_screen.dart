import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../controllers/home_controller.dart';
import '../widgets/dotted_ui.dart';

class OverLayScreen extends GetView<HomeController> {
  const OverLayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: Colors.transparent,
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
