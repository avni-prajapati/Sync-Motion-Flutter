import 'package:get/get.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'dart:math' as math;

enum AppState { loading, loaded, error, initial }

class HomeController extends GetxController {
  late final Stream<AccelerometerEvent> accelerometerStream;
  var angle = 0.0.obs;
  var hasError = false.obs;
  var xValue = 0.0.obs;
  var yValue = 0.0.obs;
  var shouldPlay = true.obs;

  @override
  void onInit() {
    super.onInit();
    accelerometerStream = accelerometerEventStream();
    listenAccelerometerStream();
  }

  void listenAccelerometerStream() {
    accelerometerStream.listen(
      (event) {
        findAngle(currentCoordinates: event);
      },
      onError: (error) {
        hasError.value = true;
      },
      cancelOnError: true,
    );
  }

  void findAngle({required AccelerometerEvent currentCoordinates}) {
    xValue.value += currentCoordinates.x * 0.02;
    yValue.value += currentCoordinates.y * 0.02;
    xValue.value = xValue.value.clamp(-math.pi / 2, math.pi / 2);
    yValue.value = yValue.value.clamp(-math.pi / 2, math.pi / 2);
    if (xValue.value == 0.0) {
      angle.value = 0;
      return;
    }
    final newValue = math.atan2(currentCoordinates.y, currentCoordinates.x) - (math.pi / 2);
    angle.value = newValue < -1 ? newValue + (math.pi) : newValue;
  }

  void alterPlayPauseValue() {
    shouldPlay.value = !shouldPlay.value;
  }
}
