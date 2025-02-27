import 'package:flutter/material.dart';

class RoundContainer extends StatelessWidget {
  const RoundContainer({super.key, required this.size});

  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        color: Colors.deepPurple.withAlpha(70),
        borderRadius: BorderRadius.circular(30),
      ),
    );
  }
}
