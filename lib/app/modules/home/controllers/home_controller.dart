import 'package:flutter/material.dart';
import 'package:flutter_overlay_window/flutter_overlay_window.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'dart:math' as math;

class HomeController extends GetxController with WidgetsBindingObserver {
  late final Stream<AccelerometerEvent> accelerometerStream;
  var angle = 0.0.obs;
  var hasError = false.obs;
  var xValue = 0.0.obs;
  var yValue = 0.0.obs;
  var shouldPlay = true.obs;
  var shouldShowOverlay = false.obs;
  var isOverlayPermissionGranted = Rxn<bool>();
  final box = GetStorage('ThemeData');

  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addObserver(this);
    accelerometerStream = accelerometerEventStream();
    _fetchPermissionValue();
    _listenAccelerometerStream();
    _getAndSetOverlayData();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _restoreOverlayIfNeeded();
    } else if (state == AppLifecycleState.paused) {
      box.write('overlayWasActive', shouldShowOverlay.value);
    }
  }

  void alterPlayPauseValue() {
    shouldPlay.value = !shouldPlay.value;
  }

  Future<void> alterAndHandleOverlay() async {
    isOverlayPermissionGranted.value = await FlutterOverlayWindow.isPermissionGranted();
    shouldShowOverlay.value = !shouldShowOverlay.value;
    if (isOverlayPermissionGranted.value ?? false) {
      if (shouldShowOverlay.value) {
        await _showOverlay();
      } else {
        await _hideOverlay();
      }
    } else {
      await FlutterOverlayWindow.requestPermission();
    }
  }

  // Future<void> _checkOverlayPermissionOnResume() async {
  //   isOverlayPermissionGranted.value = await FlutterOverlayWindow.isPermissionGranted();
  //   final isActive = await FlutterOverlayWindow.isActive();
  //   if ((isOverlayPermissionGranted.value ?? false) && shouldShowOverlay.value && isActive) {
  //     await _showOverlay();
  //   }
  // }

  Future<void> _restoreOverlayIfNeeded() async {
    await _getAndSetOverlayData();
    isOverlayPermissionGranted.value = await FlutterOverlayWindow.isPermissionGranted();
    bool isActive = false;
    try {
      isActive = await FlutterOverlayWindow.isActive();
    } catch (e) {
      isActive = false;
    }
    if (shouldShowOverlay.value && (isOverlayPermissionGranted.value ?? false) && !isActive) {
      await FlutterOverlayWindow.showOverlay(
        enableDrag: false,
        flag: OverlayFlag.clickThrough,
        alignment: OverlayAlignment.bottomCenter,
      );
    }
  }

  Future<void> _getAndSetOverlayData() async {
    final overlayData = box.read('isOverlayOn');
    if (overlayData != null) {
      shouldShowOverlay.value = overlayData;
    }
  }

  Future<void> _fetchPermissionValue() async {
    isOverlayPermissionGranted.value = await FlutterOverlayWindow.isPermissionGranted();
  }

  void _listenAccelerometerStream() {
    accelerometerStream.listen(
      (event) {
        _findAngle(currentCoordinates: event);
      },
      onError: (error) {
        hasError.value = true;
      },
      cancelOnError: true,
    );
  }

  void _findAngle({required AccelerometerEvent currentCoordinates}) {
    xValue.value -= currentCoordinates.x * 0.03;
    yValue.value -= currentCoordinates.y * 0.03;
    xValue.value = xValue.value.clamp(-math.pi / 2, math.pi / 2);
    yValue.value = yValue.value.clamp(-math.pi / 2, math.pi / 2);
    if (xValue.value == 0.0) {
      angle.value = 0;
      return;
    }
    final newValue = -math.atan2(currentCoordinates.y, currentCoordinates.x) - (math.pi / 2);
    var a = -5 < newValue && newValue < -1 ? newValue + (math.pi) : newValue;
    angle.value = a.clamp(-1.05, 1.05);
  }

  Future<void> _showOverlay() async {
    await box.write('isOverlayOn', true);
    await FlutterOverlayWindow.showOverlay(
      enableDrag: false,
      flag: OverlayFlag.clickThrough,
      alignment: OverlayAlignment.bottomCenter,
    );
  }

  Future<void> _hideOverlay() async {
    await box.write('isOverlayOn', false);
    await FlutterOverlayWindow.closeOverlay();
    shouldShowOverlay.refresh();
  }

  @override
  void onClose() {
    WidgetsBinding.instance.removeObserver(this);
    super.onClose();
  }
}
