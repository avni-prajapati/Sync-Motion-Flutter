import 'package:flutter/material.dart';

class RoundContainer extends StatelessWidget {
  const RoundContainer({
    super.key,
    required this.size,
    required this.boarderRadius,
    required this.color,
    this.isSelected,
  });

  final double size;
  final double boarderRadius;
  final Color color;
  final bool? isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(boarderRadius),
        border: Border.all(
          color: isSelected ?? false ? Colors.black : Colors.transparent,
        ),
      ),
    );
  }
}

class HeartWidget extends StatelessWidget {
  const HeartWidget({super.key, required this.color, required this.size});

  final Color color;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Icon(Icons.favorite, color: color, size: size);
  }
}
