import 'package:flutter/material.dart';

class RoundContainer extends StatelessWidget {
  const RoundContainer({
    super.key,
    required this.size,
    required this.boarderRadius,
    required this.color,
    this.isSelected,
    this.onTap,
  });

  final double size;
  final double boarderRadius;
  final Color color;
  final bool? isSelected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: size,
        width: size,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(boarderRadius),
          border: Border.all(
            color: (isSelected ?? false) ? Colors.black54 : Colors.transparent,
            width: 2,
          ),
        ),
      ),
    );
  }
}

class HeartWidget extends StatelessWidget {
  const HeartWidget({
    super.key,
    required this.color,
    required this.size,
    this.onTap,
  });

  final Color color;
  final double size;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Icon(Icons.favorite, color: color, size: size),
    );
  }
}
