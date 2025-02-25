import 'package:get/get.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'dart:math' as math;

enum AppState { loading, loaded, error, initial }

class HomeController extends GetxController {
  late final Stream<GyroscopeEvent> gyroscopeStream;
  late final Stream<AccelerometerEvent> accelerometerStream;
  var angle = 0.0.obs;
  var hasError = false.obs;
  var xValue = 0.0.obs;
  var yValue = 0.0.obs;
  var zValue = 0.0.obs;
  var lastTimestamp = 0.0;
  var smoothingFactor = 0.8;
  var steeringAngle = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    gyroscopeStream = gyroscopeEventStream();
    listenGyroscopeStream();
  }

  void listenGyroscopeStream() {
    gyroscopeStream.listen(
      (event) {
        updateSteeringAngle(event);
      },
      onError: (error) {
        hasError.value = true;
      },
      cancelOnError: true,
    );
  }

  // void findAngle({required GyroscopeEvent currentCoordinates}) {
  //   xValue.value += currentCoordinates.x * 0.02;
  //   yValue.value += currentCoordinates.y * 0.02;
  //   // zValue.value += currentCoordinates.z * 0.05;
  //   xValue.value = xValue.value.clamp(-math.pi / 4, math.pi / 4);
  //   yValue.value = yValue.value.clamp(-math.pi / 4, math.pi / 4);
  //   // zValue.value = zValue.value.clamp(-math.pi / 2, math.pi / 2);
  //   if (xValue.value == 0.0) {
  //     angle.value = 0;
  //     return;
  //   }
  //   angle.value += zValue.value;
  // }
  void findAngle({required GyroscopeEvent currentCoordinates}) {
    // Accumulate rotation values for X, Y, and Z axes
    xValue.value += currentCoordinates.x * 0.02; // Tilting forward/backward (Pitch)
    yValue.value += currentCoordinates.y * 0.02; // Tilting left/right (Roll)
    zValue.value += currentCoordinates.z * 0.02; // Rotating like a steering wheel (Yaw)

    // Clamp the values to prevent excessive movement
    xValue.value = xValue.value.clamp(-math.pi / 2, math.pi / 2); // Limit to 90 degrees
    yValue.value = yValue.value.clamp(-math.pi / 2, math.pi / 2); // Limit to 90 degrees
    zValue.value = zValue.value.clamp(-math.pi, math.pi); // Limit full rotation

    // Combine X, Y, and Z for smoother 3D rotation using quaternion-like behavior
    angle.value = math.atan2(
      math.sqrt(math.pow(xValue.value, 2) + math.pow(yValue.value, 2)),
      zValue.value,
    );
  }

  void updateSteeringAngle(GyroscopeEvent event) {
    // For steering wheel effect, we primarily care about rotation around z-axis
    // (the axis perpendicular to the phone screen)

    // Get current time for time-based smoothing
    final now = DateTime.now().millisecondsSinceEpoch / 1000;
    final deltaTime = lastTimestamp > 0 ? now - lastTimestamp : 0.016;
    lastTimestamp = now;

    // Apply z-axis rotation (steering wheel motion)
    // Negative value makes rotation direction match physical movement
    final rotationDelta = -event.z * deltaTime * 1.5; // Adjust sensitivity with multiplier

    // Apply smoothing for more natural feel
    final newAngle = steeringAngle.value + rotationDelta;

    // Optional: Limit steering angle to realistic range (e.g., ±90 degrees)
    // Comment this line out if you want unlimited rotation
    final clampedAngle = newAngle.clamp(-math.pi / 2, math.pi / 2);

    // Apply smoothing between old and new value
    steeringAngle.value =
        steeringAngle.value * smoothingFactor + clampedAngle * (1 - smoothingFactor);
  }

  // Reset steering to center position
  void resetSteering() {
    steeringAngle.value = 0.0;
  }
}
