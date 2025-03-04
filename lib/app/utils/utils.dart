import 'package:flutter/material.dart';

enum AppState { loading, loaded, error, initial }

enum ThemeShape { round, square, heart }

List<Color> themeColorsList = [
  Colors.deepPurple,
  Colors.pink,
  Colors.deepOrange,
  Colors.blue,
  Colors.green,
];

final List<double> sizes = [10, 15, 18, 22, 24, 27, 24, 22, 18, 15, 10];
final List<double> heartSizes = [20, 25, 32, 37, 40, 37, 32, 25, 20];

class ThemeClass {
  static String getColorName(Color color) {
    switch (color) {
      case Colors.deepPurple:
        return 'purple';
      case Colors.pink:
        return 'pink';
      case Colors.deepOrange:
        return 'orange';
      case Colors.blue:
        return 'blue';
      case Colors.green:
        return 'green';
      default:
        return 'Unknown';
    }
  }

  static Color? getColorFromName(String name) {
    switch (name.toLowerCase()) {
      case 'purple':
        return Colors.deepPurple;
      case 'pink':
        return Colors.pink;
      case 'orange':
        return Colors.deepOrange;
      case 'blue':
        return Colors.blue;
      case 'green':
        return Colors.green;
      default:
        return null;
    }
  }

  static String getShapeName(ThemeShape themeShape) {
    switch (themeShape) {
      case ThemeShape.round:
        return 'round';
      case ThemeShape.square:
        return 'square';
      case ThemeShape.heart:
        return 'heart';
    }
  }

  static ThemeShape? getShapeFromName(String name) {
    switch (name.toLowerCase()) {
      case 'round':
        return ThemeShape.round;
      case 'square':
        return ThemeShape.square;
      case 'heart':
        return ThemeShape.heart;
      default:
        return null;
    }
  }
}
